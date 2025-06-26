# para testear la conexion entre docker# para testear la conexion entre dockerss
import pymysql

# Configuración de la conexión
host = 'db.local'
port = 3306  # o el puerto que uses
user = 'root'
password = 'flash'

connection = pymysql.connect(  host=host,        port=port,        user=user,        password=password    )
with connection.cursor() as cursor:
    cursor.execute("SHOW DATABASES;")
    databases = cursor.fetchall()
    print("Bases de datos en el servidor:")
        for db in databases:
        print(db[0])


connection.close()

