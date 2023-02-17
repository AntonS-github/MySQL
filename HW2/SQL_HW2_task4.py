"""
CRUD операции с MySQL
Команды можно выбирать, ввод данных захардкодил (это первый опыт написание скрипта на python в связке с mysql :) ).

"""
import sys

import mysql.connector
from mysql.connector import Error


# Подключение БД, в случае успешного подключения в будет уведомление "GB_SQL database connected successfully"
def connect():
    try:
        db = mysql.connector.connect(host='localhost', database='gb_sql', user='root', password='qwerty')
        if db.is_connected():
            print('GB_SQL database connected successfully')
    except Error as e:
        print(e)


# Функция создания таблицы
def create_table():
    db = mysql.connector.connect(host='localhost', database='gb_sql', user='root', password='qwerty')
    my_cursor = db.cursor()
    try:
        my_cursor.execute("CREATE TABLE student(id INT,name VARCHAR(255), mark INT)")
    except:
        db.rollback()
    db.close()


# Функция ввода данных в БД. Внимание - ввод только хардкодом.
def insert_data():
    db = mysql.connector.connect(host='localhost', database='gb_sql', user='root', password='qwerty')
    my_cursor = db.cursor()
    try:
        my_cursor.execute("INSERT INTO student values(1,'Ivanov',5),(2,'Petrov',2),(3,'Sidorov',4)")
        db.commit()
        print('Data inserted successfully.')
    except:
        db.rollback()
    db.close()


# Функция выбора всех данных.
def select_data():
    db = mysql.connector.connect(host='localhost', database='gb_sql', user='root', password='qwerty')
    my_cursor = db.cursor()
    try:
        my_cursor.execute("SELECT * FROM student")
        selected_data = my_cursor.fetchall()
        for i in selected_data:
            id = i[0]
            name = i[1]
            mark = i[2]
            print(id, name, mark)
    except:
        print('Error: Unable to fetch data')
    db.close()


# Функция обновления данных.
def update_data():
    db = mysql.connector.connect(host='localhost', database='gb_sql', user='root', password='qwerty')
    my_cursor = db.cursor()
    try:
        my_cursor.execute("UPDATE student SET mark=6 WHERE name='Petrov'")
        db.commit()
        print('Data updated successfully')
        select_data()
    except:
        db.rollback()
    db.close()


# Функция удаления данных
def delete_data():
    db = mysql.connector.connect(host='localhost', database='gb_sql', user='root', password='qwerty')
    my_cursor = db.cursor()
    try:
        my_cursor.execute("DELETE FROM student WHERE id=1")
        db.commit()
        print('Data deleted successfully')
        select_data()
    except:
        db.rollback()


def run():
    connect()
    while True:
        command = int(input('1 - CREATE TABLE\n'
                            '2 - INSERT DATA\n'
                            '3 - SELECT DATA\n'
                            '4 - UPDATE DATA\n'
                            '5 - DELETE DATA\n'
                            '6 - EXIT\n'
                            'Input number of command: '))
        if command == 1:
            create_table()
        elif command == 2:
            insert_data()
        elif command == 3:
            select_data()
        elif command == 4:
            update_data()
        elif command == 5:
            delete_data()
        elif command == 6:
            sys.exit()
        else:
            print('Unknown command')


if __name__ == '__main__':
    run()
