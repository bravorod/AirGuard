from sqlalchemy import Column, Integer, String, Float, DateTime
from sqlalchemy.ext.declarative import declarative_base
import datetime

Base = declarative_base()

class ReadingEntry(Base):
    __tablename__ = "readings"
    id = Column(Integer, primary_key=True, index=True)
    sensor_id = Column(String, index=True)
    timestamp = Column(DateTime, default=datetime.datetime.utcnow)
    pm25 = Column(Float)
    no2 = Column(Float)
    o3 = Column(Float)
