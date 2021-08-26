import mysql.connector
import csv

def obtener_datos(archivo):
    """Lee el archivo y obtieene todo los datos dentro para convertirlos en una lista"""
    datos = []
    with open(archivo) as File:
        reader = csv.reader(File, delimiter=',')
        for row in reader:
            datos.append(row)
    return datos

def creacion_db_prueba_dos():
    db = mysql.connector.connect(
                host="localhost",
                user="root",
                passwd = "mysqlabel21",
                database = 'prueba_dos'
                )
    my_cursor= db.cursor()
    query = """CREATE TABLE IF NOT EXISTS transacciones
                        (Fecha_Transaccion VARCHAR(50),
                        Bus INT,
                        Validador INT,
                        TARJETA INT,
                        Fecha_de_Registro VARCHAR(100),
                        Tarifa INT,
                        Tipo_Transaccion VARCHAR(50),
                        Código_transacción INT,
                        Fecha_Contabilización VARCHAR(50)
                        )
                        """
    my_cursor.execute(query)
    db.commit()
    db.close()

def insertar_datos_DDBB(datos):
    datos.pop(0)
    db = mysql.connector.connect(
            host="localhost",
            user="root",
            passwd = "mysqlabel21",
            database = 'prueba_dos'
            )
    my_cursor= db.cursor()
    for i in range(len(datos)):
        query = f"""INSERT INTO transacciones (Fecha_Transaccion,Bus,Validador,TARJETA,Fecha_de_Registro,Tarifa,Tipo_Transaccion,Código_transacción,Fecha_Contabilización) 
                VALUES ("{(datos[i][0])}","{(datos[i][1])}","{(datos[i][2])}","{(datos[i][3])}","{(datos[i][4])}","{(datos[i][5])}","{(datos[i][6])}","{(datos[i][7])}","{(datos[i][8])}")"""
        my_cursor.execute(query)
    db.commit()
    db.close()

datos = obtener_datos("transacciones.csv")
creacion_db_prueba_dos()
insertar_datos_DDBB(datos)