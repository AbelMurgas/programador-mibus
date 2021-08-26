import pandas as pd 

def obtener_datos(archivo):
    """Lee el archivo y lo ordena para interar entre cada 2 paradas y poder adquirir los datos solicitados"""
    df = pd.read_csv(archivo,encoding='cp1252')
    ordenado = (df.sort_values(["RT_ID","SN"]))
    listn = []
    print("Generando Datos...")
    for i in df.index:
        try:
            if ordenado["RT_ID"][i+1] == ordenado["RT_ID"][i]:
                RT_ID = ordenado["RT_ID"][i]
                SN_B = ordenado["SN"][i]
                STOP_CD_B = ordenado["STOP_CD"][i]
                SN_E = ordenado["SN"][i+1]
                STOP_CD_E = ordenado["STOP_CD"][i+1]
                DIST = ordenado["DIST"][i+1]-ordenado["DIST"][i]
                LMT_SPD = ordenado["LMT_SPD"][i+1]
                listn.append([RT_ID,SN_B,STOP_CD_B,SN_E,STOP_CD_E,DIST,LMT_SPD])
        except:
            print("///Se han generado exitosamente///")
    print("///Se han generado exitosamente///")
    return listn

def generar_new_csv(datos):
    """Genera un archivo csv a partir de los datos suministrados"""
    header = ["RT_ID","SN_B","STOP_CD_B","SN_E","STOP_CD_E","DIST","LMT_SPD"]
    df = pd.DataFrame(data=datos, columns=header)
    ordenar = (df.sort_values(["RT_ID","SN_B"]))
    print("Creando Archivo csv con los datos suinistrados...")
    ordenar.to_csv("distancia_entre_paradas.csv", index=False)
    print("///Archivo crreado exitosamente///")

datos = obtener_datos("pattern_detail.csv")
generar_new_csv(datos)