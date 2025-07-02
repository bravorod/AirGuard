from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

# Example connection string; replace with env var in real use
SQLALCHEMY_DATABASE_URL = "postgresql://user:pass@localhost/airguard"

engine = create_engine(SQLALCHEMY_DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
