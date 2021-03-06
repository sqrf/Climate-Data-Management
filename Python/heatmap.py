import plotly.plotly as py
import plotly.graph_objs as go

import pandas as pd
df = pd.read_csv('https://raw.githubusercontent.com/plotly/datasets/master/volcano.csv')

data = [go.Heatmap( z=df.values.tolist(), colorscale='Viridis')]

py.iplot(data, filename='pandas-heatmap')