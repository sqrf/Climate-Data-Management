import pandas as pd
import os as os
import matplotlib.pyplot as plt
from os.path import join as pjoin

os.chdir("C:\Users\sqrf\Documents\Carbono Negro\DATOS-BC-Renamed")
dateparser = lambda date, time: pd.datetime.strptime((date+' '+time).strip(), '%Y-%m-%d %H:%M:%S')
data = pd.read_csv("174.csv", parse_dates=[[0, 1]], date_parser=dateparser, index_col=[0])
ts = data['BC Mass(ug/m3)']


a = ts[0 < ts]
b = a.resample('T').interpolate().resample('H') #resample: H, S, T
print b

plt.plot(b)
plt.show()

filename = 'resampleBC_single'
path_to_file = pjoin("C:\Users\sqrf\PycharmProjects\BlackCarbon\output", filename)
filetarget = open(path_to_file, "w")
filetarget.write("\n".join(map(lambda x: str(x), b)))
filetarget.close()



