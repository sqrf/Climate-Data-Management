import pandas as pd
import os as os
import matplotlib.pyplot as plt
from os.path import join as pjoin


os.chdir("C:\Users\sqrf\Documents\Carbono Negro\DATOS ARTICULO\CSVs")

file_name = "SAG-2000-2016(O3+WSP+WDR+T+RH+Nox+pm10).csv"



data = pd.read_csv(file_name, index_col=[0])

df = pd.DataFrame(data)
pd.to_numeric(df, errors='ignore')
#print df["O3"]
#print(data.loc[df['O3'] == 150])
contingence = df['O3'] > 150
print(contingence)


"""
filename = 'SAG-extracted.csv'
path_to_file = pjoin("C:\Users\sqrf\PycharmProjects\BlackCarbon\output", filename)
filetarget = open(path_to_file, "w")
filetarget.write("\n".join(map(lambda x: str(x), df)))
filetarget.close()
"""


print df
