import pandas as pd
import os as os
import matplotlib.pyplot as plt
from os.path import join as pjoin

os.chdir("C:\Users\sqrf\Documents\Carbono Negro\Datos")
dateparser = lambda date, time: pd.datetime.strptime((date+' '+time).strip(), '%d/%m/%Y %H:%M:%S')

mes = ["1-2015cca", "2-2015cca", "4-2015cca", "5-2015cca", "6-2015cca", "7-2015cca",
       "8-2015cca", "9-2015cca","10-2015cca", "11-2015cca", "1-2016cca", "2-2016cca", "4-2016cca",
       "5-2016cca"]

resample_list = []

for i in range(0, 14, 1):
       file_name = mes[i]+".csv"
              #file_name = str(i)+"-2015cca.csv"
       data = pd.read_csv(file_name, parse_dates=[[0, 1]], date_parser=dateparser, index_col=[0])
              #datos=pd.DataFrame(data)
       ts = data['Index']
       print("ts=", ts)
       b = ts.resample('H').interpolate()#.resample('H') #resample: H, S, T
       #resample_list.append(b)#[1:23])  ####### problemas al guardar "b" en una lista, mejor guardar directamente
       #el objeto
       #print b

      # print len(ts)
       #print len(b)
       filename = str(i)+'resampleBar.csv'
       path_to_file = pjoin("C:\Users\sqrf\PycharmProjects\BlackCarbon\output", filename)
       filetarget = open(path_to_file, "w")
       filetarget.write("\n".join(map(lambda x: str(x), b)))
       filetarget.close()







"""
filename = 'resampleHum.csv'
path_to_file = pjoin("C:\Users\sqrf\PycharmProjects\BlackCarbon\output", filename)
filetarget = open(path_to_file, "w")
filetarget.write("\n".join(map(lambda x: str(x), resample_list)))
filetarget.close()

#plt.plot(b)
#plt.show()
"""