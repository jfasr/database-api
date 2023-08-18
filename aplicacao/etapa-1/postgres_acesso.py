# assumes the adapter is installed
# otherwise, install with `$ pip install psycopg2-binary`
import psycopg2
from psycopg2.errors import UniqueViolation
from string import ascii_letters, digits
from random import choice, randint

def create_random_user():
    name_len = randint(5, 15)
    name_chars = ascii_letters + digits
    name = ''
    for _ in range(name_len):
        name += choice(name_chars)
    return name, name + '@email.com'

host = 'lojinha-db.c9c5bcf9eeyi.us-east-1.rds.amazonaws.com'
dbname = 'postgres'
user = password = 'professor'

print(f'Conectando a {host}, no banco {dbname} como {user}...')
conn = psycopg2.connect(host=host, dbname=dbname, user=user, password=password)

print('Conexão concluída')
cur = conn.cursor()
name, email = create_random_user()
SQL_insert_user = f"INSERT INTO lojinha.usuario (email_primario, nome) VALUES ('{name}', '{email}')"
SQL_select_users = "SELECT * from lojinha.usuario"
insert_sucess = 0

print('Encontrando novo usuário para criar...')
while True:
    try:
        cur.execute(SQL_insert_user)
        insert_sucess = 1
    except UniqueViolation:
        name, email = create_random_user()
        SQL_insert_user = f"INSERT INTO lojinha.usuario (email_primario, nome) VALUES ('{name}', '{email}')"
    if insert_sucess:
        break
print(SQL_insert_user + '\n')

cur.execute(SQL_select_users)
print(SQL_select_users)
print('-' * len(SQL_select_users))
results = cur.fetchall()
for row in results:
    print(row)
conn.commit()
conn.close()
