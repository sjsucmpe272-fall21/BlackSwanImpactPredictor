# Team-Project-7







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
 

