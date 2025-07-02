# AirGuard

> A crowdsourced, real-time air quality monitoring & alert platform empowering communities with hyper-local pollution data and forecasts.

---

## Overview

AirGuard brings real-time air quality data to your fingertips by combining low-cost sensor networks, time-series storage, and machine-learning forecasts. Whether you’re a health advocate, researcher, or community organizer, AirGuard provides the insights you need to take action.

---

## Features

<p align="center">
  <img src="assets/airguard-banner.png" alt="AirGuard: Real-Time Air Quality Monitoring" />
</p>


- **Sensor Onboarding**  
  Register new PM2.5 / NO₂ / O₃ sensors with location metadata.
- **Real-Time Ingestion**  
  Accepts MQTT or HTTP webhook streams into a TimescaleDB backend.
- **Interactive Map & Dashboard**  
  Live heatmaps, historical charts, and drill-down views with Leaflet & Plotly.
- **Automated Alerts & Forecasting**  
  Threshold-based SMS/email alerts and 24-hour pollution forecasts (Prophet).
- **Community Portal**  
  “Guardians” can follow sensors, submit reports, and share recommendations.
- **Open API & Data Export**  
  Public REST endpoints for accessing raw and aggregated data in JSON/CSV.
  
---


## Getting Started

### Prerequisites

- Node.js ≥ 14  
- Python 3.9+  
- PostgreSQL with TimescaleDB extension  
- MQTT broker (e.g., Mosquitto) or public webhook endpoint  

### Installation

```bash
git clone https://github.com/rodrigo-bravo/airguard.git
cd airguard
````

#### Backend

```bash
cd backend
python3 -m venv venv
source venv/bin/activate   # Windows: .\venv\Scripts\activate
pip install -r requirements.txt
cp .env.example .env       # configure DB, MQTT, alert settings
python manage.py migrate
```

#### Frontend

```bash
cd ../web
npm install
cp .env.example .env       # configure API_BASE_URL
```

### Running the App

Start ingestion & API:

```bash
cd backend
uvicorn app.main:app --reload
```

Run the web dashboard:

```bash
cd ../web
npm start
```

Access the dashboard at `http://localhost:3000`.

---

## Usage

* **Register Sensor**: POST `/api/sensors` with `{ "id": "...", "lat": ..., "lng": ... }`
* **Ingest Reading**: MQTT topic `airguard/sensors/{id}` or POST `/api/readings`
* **Query Data**: GET `/api/readings?sensor={id}&from=YYYY-MM-DD&to=YYYY-MM-DD`
* **Forecast**: GET `/api/forecast/{sensor}`

Full API documentation available at `/api/docs` when the server is running.

---

## Deployment

1. **Docker Compose** (example):

   ```bash
   docker-compose up --build
   ```

2. **Cloud**:

   * Push `backend/` Docker image to AWS ECR or Docker Hub
   * Deploy to AWS ECS Fargate, Heroku, or similar
   * Serve `web/` as a static site on Netlify or Vercel

---

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) and [CODE\_OF\_CONDUCT.md](CODE_OF_CONDUCT.md) before contributing.

<sup>Ensure tests pass and adhere to code style (Prettier, ESLint, Black). </sup>

---

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

