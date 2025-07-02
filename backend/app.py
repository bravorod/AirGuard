from fastapi import FastAPI, HTTPException
from .models import Base, ReadingEntry
from .db import engine, SessionLocal
from .schemas import Reading, ReadingOut
from .alerts import check_alerts
from .forecast import generate_forecast

# Create DB tables
Base.metadata.create_all(bind=engine)

app = FastAPI(title="AirGuard API")

@app.get("/health")
async def health():
    return {"status": "ok"}

@app.post("/readings/", response_model=ReadingOut, status_code=201)
async def ingest_reading(r: Reading):
    db = SessionLocal()
    entry = ReadingEntry(**r.dict())
    db.add(entry)
    db.commit()
    db.refresh(entry)
    db.close()
    # Trigger alerts
    check_alerts(entry)
    return entry

@app.get("/readings/{sensor_id}", response_model=list[ReadingOut])
async def get_readings(sensor_id: str, limit: int = 100):
    db = SessionLocal()
    readings = db.query(ReadingEntry).filter_by(sensor_id=sensor_id).order_by(ReadingEntry.timestamp.desc()).limit(limit).all()
    db.close()
    return readings

@app.get("/forecast/{sensor_id}")
async def forecast(sensor_id: str, periods: int = 24):
    return generate_forecast(sensor_id, periods)
