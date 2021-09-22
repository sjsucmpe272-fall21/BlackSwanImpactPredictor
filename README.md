# Team-Project-7

# Idea - 1

## Categorize Instagram feeds to increase productivity

### Problem Statement
A web extension to sort and categorize posts on Instagram based on the content type

### Abstract
The digital age has revolutionized how information is shared among people over different social media platforms. 

If we talk about Instagram, millions of posts from different categories are shared over the platform everyday. But what if a person wants to go through a particular category of posts (eg: Finance,  Entertainment, Memes) depending on his/her mood or need. So to make things easier, we have come up with an idea to create a web extension which will categorize the posts based on multiple factors like page type, caption and hashtags. The user can select a specific category they intend to see and the extension will automatically change the posts on the user’s feed accordingly.

### Approach
The goal is to create a web extension which would add a filter dropdown to categorize posts on Instagram's website. The extension would filter out the posts based on the filter selected by the user. The idea is to make navigation on Instagram convenient for the users by giving them an option to prioritize the posts which intrigue them. If a user is particularly interested in the Sports category, the extension would allow them to conveniently view all the Sports related posts. 

The extension would work by scraping data of the Instagram website starting with the title of the post, and then after preprocessing each line of text, it would automatically assign each post a specific category. 

We would use the power of machine learning to train our extension to smartly categorize posts, and would constantly adjust the learning efficiency to get the final result.

### Persona
The target audience for our application would be:
1. People who want to find topics of interest
2. People who want to use social media in a productive way
3. Daily Instagram users

### Dataset links
News and articles.


# Idea - 2
## Filtering troll accounts/tweets on Twitter

### Problem Statement
A web extension to filter out obscene/malicious tweets from troll accounts on Twitter

### Abstract
In today’s world, social media is ubiquitous. Social media has become a powerful tool for people all over the world to fight against oppression. However, with great power comes a great responsibility. While there are a lot of benefits of social media, it’s hard to ignore its adverse effects.
 
Social media platforms like Twitter are extremely popular today as they give people a platform to have their voices heard all over the world. However, a certain section of people misuses the platform to bully and spread hate, anger, and foul remarks. Everyday there is news of people falling into depression due to the amount of hate and backlash they received online for speaking their mind. This significantly affects their mental health, and, in some cases, people tend to commit suicide. Our goal is to make Twitter a better place by filtering out tweets from troll accounts by using the power of technology.

### Approach
The idea is to build an app which would scrape the data from Twitter’s website and filter out tweets by flagging them as a troll if the tweet matches a certain pattern or a list of words from the database. Other important factors to consider while building the app would be the tweet content, number of followers, number of following, and whether the tweet is a retweet. Once, the tweet is flagged as a troll by our application, the extension will hide that particular tweet from the user’s feed and the tweet would no longer be visible to the user. 

### Persona
The target audience for our application would be:
1. 	Celebrities
2. 	Social media influencers
3. 	Everyday users

### Dataset links
[Database of 3 Million Russian troll tweets](https://github.com/fivethirtyeight/russian-troll-tweets)

News Articles


# Idea - 3
## Stock market prediction based on Black Swan events

### Problem Statement
A mobile/web app to analyze the Blackswan events across the globe and predict their effect on the stock market.

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

# Idea - 4

## Geo-safety indicator

### Problem Statement
A mobile app that will notify users if they are in a neighborhood with a high crime rate.

### Abstract
Law is something that helps maintain peace among societies. Crime is an unlawful act which is punishable by the state or other authority. Since humans have started living in civilization, we as humans have been striving to eliminate crimes.

Through this project, we aim to build a mobile application that could help in reducing crimes. The application will monitor the GPS location of the user. This location will be used to check the crime rates of the neighborhood from the dataset. After the analysis, a safety-score will be assigned to the area. If the score is above a specific threshold, the user will be notified by a push notification. The user can use this information to be cautious and take precautionary methods to be safe.

The algorithm could further be enhanced to include the profile of users in the analysis. So if the user is a minor, we can prioritize crimes like child abduction. 


### Approach
We will build an android/iOS application that will poll the GPS coordinates from the OS service at regular intervals. With these location coordinates, we can calculate the safety-score considering a 0.5 or 1 mile perimeter from the dataset.

The safety-score will be recorded on a 1-10 scale; 1 being unsafe and 10 being safest. It can be computed using the following factors (more factors can be added further post discussions):

1. Proximity of the location to the crime location
2. How recent the crimes have taken place
3. Type of crime: violent and non-violent


### Persona
Target audience would be everyone who is concerned about their safety

### Dataset links
[Sanfrancisco Crime Analysis | Kaggle](https://www.kaggle.com/roshansharma/sanfrancisco-crime-analysis/data)

[CityProtect](https://cityprotect.com/) – This site provides API to get crime data, but it may not be a free option 
 

