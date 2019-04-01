# MDSimpleMobileClient
This is simple mobile client

Project setup
1. Go to project folder `MDSimpleMobileClient`
2. Run command `pod install`
3. Open project with `MDTwitterClient.xcworkspace`

Run
1. Test user values username: `mdle@dcre8tive.com`, password: `123456 `
2. Pull down refresh tableview to get updated tweets (simulation)
3. Tap `Tweet` button top right to enter new tweet message
4. You can `Cancel` or `Send` new message
5. Tap `Logout` to logout the app

Archictect/Patterns using for this project
1. Using Coordinator for the navigation flow for `Login Screen`, `Main Screen`
2. Using delegate pattern for `Tweet Message Screen`
3. Using protocols, generics for abstracting the classes and easy for testing, mocking

Third party libraries
1. Using Realm database for local storage
2. Using `LoremSwiftum` for generate random tweets for testing

Test cases can be found
1. `MDTwitterClientTests`
