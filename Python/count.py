import os as os
import pandas as pd
from os.path import join as pjoin

os.chdir("C:\Users\sqrf\Documents\Carbono Negro\DATOS-BC-Renamed")

countlist = []

for i in range(1, 532, 1):
    file = str(i)+".csv"
    datos = pd.read_csv(file)
    leng = len(datos)
    countlist.append(leng)

filename = 'count'
path_to_file = pjoin("C:\Users\sqrf\PycharmProjects\BlackCarbon\output", filename)
filetarget = open(path_to_file, "w")
filetarget.write("\n".join(map(lambda x: str(x), countlist)))
filetarget.close()



