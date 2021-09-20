# WEATHER-APP
Using `FLUTTER`, `MVVM`, `PROVIDER`, `CHANGE NOTIFIER`, `OPEN WEATHER API`:

---

> ### Coding Assignment
> 
> Implement a cross platform mobile application using a suitable framework such as
> Flutter etc to demonstrate your skills, ability to write clean and maintainable code and
> attention to details.
> 
> ### Requirement:
> - Use a table to display weather information of Sydney, Melbourne and > > Brisbane
> as start.
> - Provide a way to add more cities using another modal view controller > which
> includes a search functionality to find a city by name or location.
> - City IDs
> o Sydney, Melbourne and Brisbane are: 4163971, 2147714,
> 2174003
> o More city can be found from the following link:
> http://bulk.openweathermap.org/sample
> - Each cell should display at least two pieces of info: Name of city on > the
> left, temperature on the right.
> - Get real time weather information using https://openweathermap.org/> > current -
> You can register and get your API key for free.
> - A sample request to get weather info for one city:
> O
> http://api.openweathermap.org/data/2.5/weather?id=4163971&units=m
> etri c&APPID=your_registered_API_key
> - Weather should be automatically updated periodically.
> - Please commit your code as you proceed with appropriate messages.
> 
> ### Brownie Points:
> - MVVM architectural pattern is preferred with unit tests.
> - Use an activity indicator to provide some feedback to the user while > waiting for
> network response.
> - Allow the user to tap on a cell to open a new “Detail view”, to show > more
> information about the city such as current weather summary, min and max
> temperature, humidity, etc.
> - Try to use table view or collection view to display details.
> - In the “Detail view”, implement animations to enhance the user
> experience.
> - Support all different dimensions of the devices.
> - Support landscape and portrait view together.
> - Project readme with reasoning behind assumptions and decisions.
> Submission:
> Share us a link to the project repo (Preferred) or if not possible, then > send it is a zip
> file.


## Questions/Assumptions/Decisions
1 - I left a TODO to implement a secure method to get/change the API Keys;

2 - I usually count on some support from a prototype, drawings, wireframes, UI/UX designer, etc, but there's nothing included, therefore, I'm using the basic Material components without customization;

3 - I used provider/change notifier as state management but as I tryied to follow SOLID and clean code/architecture principles, I think it is easy to replace by another such as BLOC, MOBX, Redux, etc..., which depends mainly on the preference/knowledge of the team and what is already being used, imho;

4 - I wrote the method for searching by location, however, I could not infere the expected behaviour cause there are many ways of doing so...
My question is whether I should have used gps to get the current user location or if it is expected to input the location or suggest while typing or something else...

5 - I wrote initial test cases with mock data but I could not cover all the cases I wanted... shame on me! =( I wish I could learn more TDD with someone...

6 - I lost track of time/commits so I am redoing the commits in a more logical order... but basically I wrote everything tonight.
As I compromised with Callum to send something today, I did it in a rush cause I am late already =( I am so sorry about it.