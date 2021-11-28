#Reading news data
from datetime import datetime, timedelta
from os import path
from uuid import uuid4
import cufflinks as cf
import numpy as np
import pandas as pd
import plotly.graph_objs as go
import requests
from chart_studio import plotly as py

cf.go_offline()
from plotly.offline import download_plotlyjs, init_notebook_mode, iplot, plot

CURRENT_DIR = path.dirname(__file__)

data = {
    'amazon': 
        { 
            'news_url': 'https://news.yahoo.com/amazon-pushing-hard-ocean-shipping-200001052.html',
            'historical_news_path': f'{CURRENT_DIR}/../news_data/amazon_news.csv',
            'similarities': [0.7791, 0.5986, 0.7309, 0.7061, 0.7184, 0.648, 0.6707, 0.4732, 0.7404, 0.7302, 0.7908, 0.7849, 0.7267, 0.7621, 0.7944, 0.7392, 0.5898]
        }
} 

use_cached_data = True;
data_type = 'amazon'
token = '3e609e553c274103bf2acd8dd9029d8c'


def process_URL(news_url):
    global data
    #url of the news to be analysed
    # news_url = data[data_type]['news_url']
    #Sentiment analysis of the news

    url = 'https://api.dandelion.eu/datatxt/sent/v1/?lang=en&token=' + token + '&url=' + news_url
    response = requests.get(url)
    res_json = response.json()
    if 'sentiment' in res_json:
        print("Sentiment of the news article:", res_json['sentiment'])

    #Read historical news

    news_data = pd.read_csv(data[data_type]['historical_news_path'], sep=';')
    news_data['Date'] = pd.to_datetime(news_data['Date']).dt.date
    news_data.head()

    # Find similarities of current news and historical news
    similarities = []

    if not use_cached_data:
        for url in news_data['Link']:
            url = 'https://api.dandelion.eu/datatxt/sim/v1/?url1=' + news_url + '&url2=' + url + '&token=' + token
            response = requests.get(url)
            data = response.json()
        #     print(data)
            if('similarity' in data):
                similarities.append(data['similarity'])
    else:
        similarities = data[data_type]['similarities']
            
    print(similarities)
    print("Mean of similarities: ", np.mean(similarities))

    #Get the stock data for the date range of the news

    stock_data = pd.read_csv(f'{CURRENT_DIR}/../stock_data/spy500_historical_data.csv', sep=',')
    stock_data.rename(columns={'Close/Last':'Close'}, inplace=True)
    stock_data['Change_Stock'] = stock_data['Close'].diff(periods=-1)
    stock_data['Date'] = pd.to_datetime(stock_data['Date']).dt.date
    stock_data = stock_data.drop(columns=['Volume', 'Open', 'High' ,'Low'])

    stock_data.head()
    #Plot a graph of history with changes as per news

    merged_data = pd.merge(stock_data, news_data, on = "Date" )
    merged_data.drop_duplicates(subset="Date", keep='last', inplace=True)
    merged_data.set_index('Date', inplace=True)
    merged_data


    dateset= list(sorted(merged_data.index))

    changelist = []
    for date in dateset:
        try:
            changelist.append(merged_data.loc[date]['Change_Stock'].round(3))
        except:
            changelist.append(0)

    trace_close = go.Scatter(
                    x=stock_data["Date"],
                    y=stock_data['Close'],
                    name = "Close")

    colorlist = []
    for s in changelist:
        if s > 0:
            colorlist.append('green')
        elif s == 0:
            colorlist.append('rgb(150, 150, 150)')
        else:
            colorlist.append('red')
            
    shapes = [dict(
                x0 = s,
                x1 = s + timedelta(days=1),
                y0 = 0,
                y1 = 1,
                xref= 'x',
                yref = 'paper',
                opacity =  0.3,
                line = {'color': colorlist[i], 'width': 5}
                ) for (i,s) in enumerate(dateset)]


    annotations =  [dict(
                x = s,
                y = (0.05 + i*0.2) % 1,
                xref = 'x',
                yref = 'paper',
                showarrow = False,
                xanchor = 'left',
                ax = 20,
                ay = -30,
                bordercolor = '#000000',
                borderwidth = 2,
                borderpad = 4,
                bgcolor = colorlist[i],
                font = {
                    'family':'Courier New, monospace',
                    'size':16,
                    'color':'#ffffff'
                },
                opacity = 0.8,
                text =  changelist[i]
                
                ) for (i,s) in enumerate(dateset)]


    data = [trace_close]

    layout = dict(
        title = "Stock prices",
        shapes = shapes,
        annotations = annotations,
        xaxis = dict(range = [merged_data.index.min() - pd.DateOffset(months=2),merged_data.index.max() + pd.DateOffset(months=2)]),
        yaxis = dict(title = 'Close price')
    )


    fig = dict(data=data, layout=layout)
    filename = f'{uuid4()}.png'
    go.Figure(fig).write_image(f'{CURRENT_DIR}/../../static/{filename}')

    return filename
