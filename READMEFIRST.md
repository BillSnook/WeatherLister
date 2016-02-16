# WeatherLister
Coding challenge
Please use Objective-C for the exercise.
Do try and use storyboards and auto-layout/size-classes. 

Exercise:

1. Use the API's available at http://openweathermap.org/current#format  to pull the weather for 5 cities:
     San Francisco, New York, London, Cairo, Tokyo
    (all text is solid white and default font, size try to adjust similar to attached screens)

2. Display the weather - Don't need pixel perfection, but have a clean presentation.
  
On iPhone:
  2 screens: 
         Main Screen (default landing page) : Simple list of cities with City, main-weather, Temp. General background : beige (RGB:238,235,225). Cell backgrounds based on temperature. 
         Details Screen:  Details for current weather and list of next 7 days. (over all screen background to be based on the current temperature )

Logic for deciding color based on temp: 
Temp above 75F = red (RGB: 218,150,148)
      Temp below 65F = blue (RGB: 198,217,240)
      Temp between 74F-66F(inclusive) = peach (RGB: 252,213,181)
  

On iPad:
  1 screen:  
     List of cities on the left and the details for the chosen city on the right with the next 7 days weather


