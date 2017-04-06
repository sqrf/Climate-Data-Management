import pandas as pd
import os as os
import matplotlib.pyplot as plt
from os.path import join as pjoin

os.chdir("C:\Users\sqrf\Documents\Carbono Negro\DATOS-BC-Renamed")
dateparser = lambda date, time: pd.datetime.strptime((date+' '+time).strip(), '%Y-%m-%d %H:%M:%S')

resample_list = []

for i in range(461, 463, 1):
    file_name = str(i)+".csv"
    data = pd.read_csv(file_name, parse_dates=[[0, 1]], date_parser=dateparser, index_col=[0])
    ts = data['BC Mass(ug/m3)']
    print ts
    a = ts[0 < ts]
    b = a.resample('5T').interpolate().resample('H') #resample: H, S, T
    resample_list.append(b)#[1:23])
    print b


filename = 'resampleBC'
path_to_file = pjoin("C:\Users\sqrf\PycharmProjects\BlackCarbon\output", filename)
filetarget = open(path_to_file, "w")
filetarget.write("\n".join(map(lambda x: str(x), resample_list)))
filetarget.close()

#plt.plot(b)
#plt.show()