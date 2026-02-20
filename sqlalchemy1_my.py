import sqlalchemy
from sqlalchemy import Integer, String, create_engine
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, Session

#инициализация движка:
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
    name: Mapped[str] = mapped_column(String)

Base.metadata.create_all(engine)

with Session(engine) as session:
    session.add(User(id=2, name="Kate"))
    session.add(User(id=3, name="Sarah"))
    session.commit()

    # Задание: получить id, найти пользователя и вывести имя
    user_input = input()
    user = session.get(User, user_input)
    print(user.name)