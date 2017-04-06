from numpy import *
from os.path import join as pjoin
from halfhr import halfhour

temp_by_hour = []
half = halfhour


for i in xrange(0, 7404, 2):
    dato = half[i]
    temp_by_hour.append(dato)




filename = 'half2int-temp'
path_to_file = pjoin("./output/", filename)
filetarget = open(path_to_file, "w")
filetarget.write("\n".join(map(lambda x: str(x), temp_by_hour)))
filetarget.close()




