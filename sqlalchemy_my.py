import sqlalchemy
from sqlalchemy import Integer, String, create_engine
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, Session

engine = create_engine(
    "postgresql+psycopg2://postgres:postgres@localhost:5432/test"
)

#База для таблиц
class Base(DeclarativeBase):
    pass
#Описание конкретной таблицы
class User(Base):
    __tablename__ = "alchemy_users"
    
    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    name: Mapped[str] = mapped_column(String, nullable=False)

#Создать таблицу
Base.metadata.create_all(engine)

#Запустить сессию
with Session(engine) as session:
    session.add(User(id = 1, name = "Alice"))
    session.commit()

