from sqlalchemy import create_engine
from datetime import datetime

conn_str = "postgresql+psycopg2://postgres:_db:5433"

engine = create_engine(conn_str)
connection = engine.connect()
res = connection.execute("CREATE TABLE test;")