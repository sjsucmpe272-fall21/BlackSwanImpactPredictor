# BlackSwanImpactPredictor

**Report:** [View](https://github.com/sjsucmpe272-fall21/BlackSwanImpactPredictor/blob/4e0a15657a2f671b04c63f1ae3bd40fc238d9865/documentation/CMPE%20272%20-%20Group%207%20-%20Project%20Report.pdf)

**Presentation:** [View](https://github.com/sjsucmpe272-fall21/BlackSwanImpactPredictor/blob/main/documentation/CMPE%20272%20-%20Group%207%20-%20Project%20Presentation.pdf)

**API details:**

Endpoint URL: http://18.222.25.85:5000/api/process-model

Request:

```
{
    "data_type" : "<news_type>"
}

//As of now, valid news_type values are amazon, tradewar, fedhikerates.
```


Response: 

```
{
    'file_content': <base64_encoded_stock_movement_chart>,
    'impact_score': <impact_score>,
    'sentiment': <sentiment>
}
```


## Stock market prediction based on Black Swan events

### Problem Statement
A mobile app to analyze the Blackswan events across the globe and predict their effect on the stock market.

### Abstract
A Black swan event is an event that is totally unexpected and catches people off guard due to its severe and significant widespread impact. The recent example of a Blackswan event was the COVID-19 pandemic as no one saw it coming. It destroyed people’s lives and eviscerated the stock market. So, to prepare well ahead of time and avoid future market crashes, we aim to build a system which will analyze the events based on news headlines around the world and predict the possible impact of a blackswan event on the stock market.

The idea behind building this system is to predict a score for any event to be a black swan event and if the score is above a certain threshold, the system will send an alert message to notify the user.

### Approach
The approach starts with analyzing global news and scraping out relevant data based on observing patterns or repetitive headlines and calculating an impact score based on the severity of the event, the geographical area affected by it, and the industries which might be impacted by the event.

### Persona
1. Investment Bankers
2. Institutional Investors
3. Fund managers
4. Individual Investors

### Dataset links
Various news portals

CNBC
