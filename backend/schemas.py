from pydantic import BaseModel
from datetime import datetime

class Reading(BaseModel):
    sensor_id: str
    timestamp: datetime
    pm25: float
    no2: float
    o3: float

class ReadingOut(Reading):
    id: int
    class Config:
        orm_mode = True
