# syntax=docker/dockerfile:1

##########################
# 1) Backend deps stage  #
##########################
FROM python:3.9-slim AS backend-deps

# avoid interactive prompts, ensure up-to-date apt + clean up
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends gcc libpq-dev \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# copy only requirements first to leverage Docker cache
COPY backend/requirements.txt .

# install into site-packages; --no-cache-dir saves space
RUN pip install --no-cache-dir -r requirements.txt

##########################
# 2) Backend runtime     #
##########################
FROM python:3.9-slim AS backend

# create a non-root user
RUN useradd --create-home appuser

WORKDIR /app
ENV PYTHONUNBUFFERED=1 \
    LOG_LEVEL=info

# copy installed packages from deps stage
COPY --from=backend-deps /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages

# copy only app source
COPY backend/ ./backend
COPY backend/app.py ./app.py    # adjust as needed
# EXPOSE documents intent; doesn’t actually publish port
EXPOSE 8000

# healthcheck so orchestrators know if it’s alive
HEALTHCHECK --interval=30s --timeout=5s \
  CMD curl --fail http://localhost:8000/healthz || exit 1

USER appuser
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]


##########################
# 3) Web build stage     #
##########################
FROM node:16-alpine AS web-build

WORKDIR /app
# copy package files first so dependencies cache
COPY web/package.json web/yarn.lock ./
RUN yarn install --frozen-lockfile

# copy source and build
COPY web/ ./
RUN yarn build

##########################
# 4) Web runtime stage   #
##########################
FROM nginx:alpine AS web

# remove default site
RUN rm -rf /usr/share/nginx/html/*

# copy built static files
COPY --from=web-build /app/build /usr/share/nginx/html

EXPOSE 80
STOPSIGNAL SIGQUIT
CMD ["nginx", "-g", "daemon off;"]
