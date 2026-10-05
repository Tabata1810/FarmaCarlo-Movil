import os
import pymysql

def conectar():
    # Lee las credenciales de Render/Aiven o usa valores locales por defecto
    host = os.environ.get('DB_HOST', 'localhost')
    user = os.environ.get('DB_USER', 'root')
    password = os.environ.get('DB_PASSWORD', '')
    database = os.environ.get('DB_NAME', 'farmacarlo_db')
    port = int(os.environ.get('DB_PORT', 3306))

    conexion = pymysql.connect(
        host=host,
        user=user,
        password=password,
        database=database,
        port=port,
        cursorclass=pymysql.cursors.DictCursor
    )
    return conexion

def crear_tabla():
    # Ya las tablas están creadas en Aiven via SQL
    pass