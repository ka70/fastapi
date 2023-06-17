from fastapi import FastAPI
from sqlalchemy import create_engine, Table, MetaData

DATABASE_URL = "postgresql://postgres:postgres@db:5432/testdb"

engine = create_engine(DATABASE_URL)
metadata = MetaData()

items = Table("items", metadata, autoload_with=engine)

app = FastAPI()


@app.get("/items/")
async def read_items():
    with engine.connect() as connection:
        result = connection.execute(items.select())
        return [{"id": row[0], "name": row[1]} for row in result.fetchall()]
