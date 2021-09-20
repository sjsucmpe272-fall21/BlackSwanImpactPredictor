# Team-Project-7







# Idea - 4

## Geo-safety indicator

### Problem Statement
A mobile app that will notify users if they are in a neighborhood with high crime rate.

### Abstract
Law is something that helps maintain peace among societies. Crime is an unlawful act which is punishable by the state or other authority. Since humans have started living in civilization, we as humans have been striving to avoid eliminate crimes. 
Through this project, we aim to build a mobile application that could help in reducing crimes. When this application is installed, it will monitor the GPS location of the user. This GPS location will be used to check the past crime rates of the neighborhood from the crime database. Depending on the analysis of the area, a safety-score will be derived and same score will be shown in the app. If this safety score is above a specific threshold, the user will be notified by a push notification to be aware of the surroundings and take precautionary methods to be safe.
The algorithm could further be refined to include profile of users in the analysis. So if the user is a minor, we can prioritize crimes like child abduction. 

### Approach
We can build an android/iOS application that will poll the GPS coordinates from the OS service at regular intervals. With this location co-ordinates, we can calculate the safety-score considering a 0.5 or 1 mile perimeter from the dataset. 
The safety-score will be recorded on a 1-10 scale; 1 being the safest and 10 being unsafe. It can be computed using the following factors (more factors can be added further post discussions):
a.	Proximity of the location to the crime location
b.	How recent the crimes have taken place
c.	Type of crime: violent and non-violent

### Persona
Target audience would be everyone who is concerned about their safety

### Dataset links
[Sanfrancisco Crime Analysis | Kaggle](https://www.kaggle.com/roshansharma/sanfrancisco-crime-analysis/data)

[CityProtect](https://cityprotect.com/) – This site provides API to get crime data, but it may not be a free option 
 

