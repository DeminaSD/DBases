import psycopg2

# Создайте программу для управления клиентами на Python.Требуется хранить персональную информацию о клиентах:

# имя
# фамилия
# email
# телефон
# Сложность в том, что телефон у клиента может быть не один, а два, три и даже больше. А может и вообще не быть телефона, например, он не захотел его оставлять.

# Вам необходимо разработать структуру БД для хранения информации и несколько функций на Python для управления данными.

# Функция, создающая структуру БД (таблицы).
# Функция, позволяющая добавить нового клиента.
# Функция, позволяющая добавить телефон для существующего клиента.
# Функция, позволяющая изменить данные о клиенте.
# Функция, позволяющая удалить телефон для существующего клиента.
# Функция, позволяющая удалить существующего клиента.
# Функция, позволяющая найти клиента по его данным: имени, фамилии, email или телефону.

def creating_tables(database, user, password):
    connection = psycopg2.connect(database=database, user=user, password=password)
    cursor = connection.cursor()
    cursor.execute(
        """CREATE TABLE users(
        user_id SERIAL PRIMARY KEY,
        user_name VARCHAR(20),
        user_surname VARCHAR(30),
        user_email VARCHAR(50)
        );"""
    )
    cursor.execute(
        """CREATE TABLE phones(
        phone_id SERIAL PRIMARY KEY,
        user_id INTEGER NOT NULL REFERENCES users(user_id),
        phone_num VARCHAR(40) NOT NULL
        );"""
    )
    connection.commit()
    connection.close()

def add_client(database, user, password, user_id, user_name, user_surname, user_email):
    connection = psycopg2.connect(database=database, user=user, password=password)
    cursor = connection.cursor()
    cursor.execute(
        """INSERT INTO users(user_id, user_name, user_surname, user_email)
        VALUES(%s, %s, %s, %s);
        """, (user_id, user_name, user_surname, user_email)
    )
    connection.commit()
    connection.close()

def add_phone(database, user, password, phone_id, user_id, phone_num):
    connection = psycopg2.connect(database=database, user=user, password=password)
    cursor = connection.cursor()
    cursor.execute(
        """INSERT INTO phones(phone_id, user_id, phone_num)
        VALUES(%s, %s, %s);
        """, (phone_id, user_id, phone_num)
    )
    connection.commit()
    connection.close()    

creating_tables(database='test', user='postgres', password='postgres')

add_client(
    database='test',
    user='postgres',
    password='postgres',
    user_id=1,
    user_name = 'Павел',
    user_surname='Дуров',
    user_email='xxx@gmail.com'
)

add_phone(
    database='test',
    user='postgres',
    password='postgres',
    phone_id = 1,
    user_id = 1,
    phone_num= '89999999999'
)