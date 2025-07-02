from prophet import Prophet
import pandas as pd
from .db import SessionLocal
from .models import ReadingEntry

def generate_forecast(sensor_id, periods):
    db = SessionLocal()
    qs = db.query(ReadingEntry).filter_by(sensor_id=sensor_id).order_by(ReadingEntry.timestamp).all()
    df = pd.DataFrame([{"ds": r.timestamp, "y": r.pm25} for r in qs])
    db.close()
    if df.empty:
        return {"error": "no data"}
    m = Prophet().fit(df)
    future = m.make_future_dataframe(periods=periods, freq='H')
    forecast = m.predict(future)
    return forecast[['ds','yhat']].tail(periods).to_dict(orient='records')
