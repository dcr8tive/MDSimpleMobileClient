# MDSimpleMobileClient
This is simple mobile client

Project setup
1. Go to project folder `MDTwitterClient`
2. Run command `pod install`
3. Open project with `MDTwitterClient.xcworkspace`

Archictect/Patterns using for this project
1. Using Coordinator for the navigation flow for `Login Screen`, `Main Screen`
2. Using delegate pattern for `Tweet Message Screen`
3. Using protocols, generics for abstracting the classes and easy for testing, mocking

Third party libraries
1. Using Realm database for local storage
2. Using `LoremSwiftum` for generate random tweets for testing

Test cases can be found
1. `MDTwitterClientTests`
