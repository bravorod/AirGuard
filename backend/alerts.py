def check_alerts(entry):
    # Stub: send alert if pm25 > threshold
    threshold = 50.0
    if entry.pm25 > threshold:
        print(f"Alert: Sensor {entry.sensor_id} reported PM2.5={entry.pm25}")
