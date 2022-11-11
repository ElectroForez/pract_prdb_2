from mysql.connector import connect


class Db:
    def __init__(self):
        self.connection = connect(
            database='p_prdb',
            user='admin',
            password='qwerty',
            host='localhost'
        )
        self.connection.autocommit = True
        self.cursor = self.connection.cursor()
        print('successful connect to db')

db = Db()
