# Multi-stage build: backend & web
FROM python:3.9-slim AS backend
WORKDIR /app/backend
COPY backend/requirements.txt .
RUN pip install -r requirements.txt
COPY backend/ ./
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]

FROM node:16-alpine AS web
WORKDIR /app/web
COPY web/package.json web/yarn.lock ./
RUN yarn install
COPY web/ ./
CMD ["yarn", "start"]
