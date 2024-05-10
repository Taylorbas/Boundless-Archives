# Boundless-Archives
The project runs as follows:
Firstly you will need to gain access to the firebase database as it will be used with the program.
The access should be given to the needed user but if not request access to taylo126@ranger,uwp.edu.

Next download the code that is shared within the hub repo and make sure to download the required dependencies. Note that the used installer for the project is under the Swift Package Installer, and the dependencies are used are as follows( FirebaseAnalytics, FirebaseAnalyticsSwift, FirebaseDatabase, FirebaseDatabaseSwift, FirebaseFirestore, FirebaseRemoteConfig, FirebaseRemoteConfigSwift, and FirebaseStorage).

Once the project is set up the running phase is as follows:
The title screen/ welcome screen will show first and appear for 10 sec before auto navigating to the main contentVIew.
There will be three boxes labeled “Pokemon”, “Magic”, and “Sports” Each is a tappable item. In addition there will be a trophy icon that will navigate the user to the achievement screen.

For the achievement screen the only functions to the locks can toggle revealing the text of challenges that are not functioning as of this version. Once done click the back button to return to the previous screen.

For the Pokemon, Magic, and Sport boxes each have some functionality. Once the boxes are clicked the navigation will take the user to the selected collection and display the data from the database in a list format. The difference between the three collections is the fields that each have data for. For more insight check the firestore database and see the different fields.

Lastly the PokeView is the only collection view that has each of the items of the list with tabbable icons, and once tapped will display a plus symbol. Once clicked the project is supposed to create a separate collection but more on that in the features section.

That's all for the functionality of the project. 



Limitations:
As stated before the app can read the data from the database fine and it functions with newly added data to the database as well, but that is mainly all the function of the app aside from the animations on the ContentView and welcomeView.

Features not completed:
Audio player does not play background music
Welcome screen does not have app icon in the middle of text
The Collection functions are limited
Cannot create separate collection for selected card picked from list in any of the collections
Achievements are nonfunctional

Future Development:
As for plans in the future, there are a lot of options that can be used for the app. Initially what the app has is a good foundation to expand upon as adding more cards or even new card games are easy to implement. Once the functionality of the selected card collection, achievement system, and background music functionally is working, this app can be seen handling a multiple of other card games. Future functions would include a better filter system, Accounting and logins, live price checker, and a whole UI redesign.



