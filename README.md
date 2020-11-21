# EventsMVVM-Navigation-Coordinator
# # MVVM iOS App : Navigation And Coordinators | Event Countdown App

<img width="512" alt="Screenshot 2020-11-11 at 13 28 37" src="https://user-images.githubusercontent.com/36473665/98811877-d4582800-2421-11eb-9efb-4fed9650974b.png">

# # Design
<img width="753" alt="design" src="https://user-images.githubusercontent.com/36473665/98826496-0d9a9300-2436-11eb-8d87-e1dc1e81c5cf.png">
<img width="183" alt="Screenshot 2020-11-11 at 20 38 13" src="https://user-images.githubusercontent.com/36473665/98856518-f1125100-245d-11eb-8d48-95c6beb61692.png">

## Tasks

1.  We will look at how to structure our Event Countdown application using Coordinators starting with our AppCoordinator which will be created in our SceneDelegate and is responsible for setting up the app before creating an EventListCoordinator to handle our events list interactions
2.  Build an event countdown iOS app using MVVM we will setup our event model. Using core data we will be able to save and fetch events
3.  Create our view models and handle the add event flow by creating an add event coordinator and also handling when the coordinator has finished this flow
4.  We build out the add event screen. We create a cell view model to represent the cell and look at how we can use callbacks to replicate bindings.We also work out how We can display a datepicker when the user taps on the date textfield vs a normal textfield
5.  we look at how we can allow the user to select an image using UIImagePickerController. Once we have the image we will run through how we can update our view models and cell to handle this as well as how this flows through the architecture,We then save an event using the information from the viewmodel through our core date manager and dismiss the add event view controller and tidy up the coordinator appropriately
6.  We leverage the power of UIStackView to build our event cells and show some tricks around getting the spacing we need
7.  DateComponentsFormatter and Image Caching: we use DateComponentsFormatter to display the time remaining until the event and adjust the contents of the vertical stack view to display this. We then use a cache and a background queue to improve performance
