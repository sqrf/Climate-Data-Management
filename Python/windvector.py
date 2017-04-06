import numpy as np
import pandas as pd
import os as os
import matplotlib.pyplot as plt
from os.path import join as pjoin

start_pos = 3146
end_pos = 3650
hours_interval = 1

os.chdir("C:\Users\sqrf\Documents\Carbono Negro\DATOS ARTICULO\CSVs")

file_name = "2016GAM.csv"

data = pd.read_csv(file_name, index_col=[0])
WSP = data["WSP"]
WDR = data["WDR"]
date = data["date"]
#print WSP[start_pos:end_pos]
#print WDR[start_pos:end_pos]


speeds = WSP[start_pos:end_pos: hours_interval]
angles = WDR[start_pos:end_pos: hours_interval]
date1 = date[start_pos:end_pos: hours_interval]


s = pd.to_numeric(speeds)
a = pd.to_numeric(angles)
"""
speeds = np.random.random(50)*10
angles = np.random.random(50)*360

"""
U = s*np.cos(a)
V = s*np.sin(a)

fig = plt.figure()
plt.quiver(U, V, width=0.001,color='moccasin')
fig.savefig('21may-wind.png', transparent=True)
#plt.xlabel(date1, rotation=90)


plt.show()

