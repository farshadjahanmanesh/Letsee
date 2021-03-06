# Welcome to LetSee!

## What is wrong with Xcode's console?

Many applications need to handle API calls and communicating with servers. The problem is by logging API calls (requests and responses) in **Xcode's console**, you see a very **crowded terminal, nasty and confusing** information moreover for a piece of data, you have to look through all printed texts in terminal alongside with **interface issues, library warnings, other logs** and more ... within a very ordinary, unorganized and pale color place. Are you tired of this?

![alt text](https://github.com/farshadjahanmanesh/Letsee/blob/main/Examples%2BImages/bad.jpg?raw=true)

## Then what is LetSee?
**LetSee**, it lets you see what is going on between your application and server in a **very neat, clean, and organized** space. Do you like this?

![LetSee](https://github.com/farshadjahanmanesh/Letsee/blob/main/Examples%2BImages/good.gif?raw=true)

Using it is very easy, you can just import it and log function. 
> **Note:** this library inspired by [**WatchTower**](https://github.com/adibfara/WatchTower) written by [Adibfara](https://github.com/adibfara).

### LetSee Features
-   Track and observe all API calls made through Moya, Alamofire, and ...'s client
-   GET, POST, PUT, DELETE, PATCH methods
-   Query parameters, request and response body and headers
-   Response success and failure status, size, date and latency
-   Adjustable port for the server and the websocket server
-   API call history, even If no browsers were open
-   Search in the URLs of all requests
-   Fully responsive UI

## How To Use:
### 1. Add LetSee to your project
using this library is undoubtedly easy, currently we support **CocoaPods** and **Swift Package Manager**

#### SPM
you can whether add **LetSee** like below (if you have a `Package.swift` file):
```swift
 dependencies: [
		 .package(name: "LetSee", url: "https://github.com/farshadjahanmanesh/Letsee.git", from: "0.1.0")
 ],
 targets: [
		 .target(name: "Your Package Name", 
				 dependencies: ["LetSee"]),
 ]
```

or from the `Add Package` menu:


package.manager
![LetSee - Package Manager](https://github.com/farshadjahanmanesh/Letsee/blob/main/Examples%2BImages/package.manager.jpg?raw=true)
#### CocoaPods
just import LetSee simply like other pods
```ruby
pod 'LetSee', :git => 'https://github.com/farshadjahanmanesh/Letsee.git'
```
### 2. Import LetSee
it completely up to you, if you have multiple Moya provider, you can keep LetSee as a global Variable otherwise just keep LetSee wherever you need it and be sure that its instance would be alive til you need the logger
```swift
#if DEBUG
-----------
import LetSee
let  letSee = LetSee()
------------
// OR
class someAPIManagerClass {
	...
	let  letSee = LetSee()
	...
}
#endif
```
Then you need to pass the `LetSeeLogger` to `Moya` as a plugin like this.  **LetSeeLogger** is a MoyaPlugin which interrupts the requests and log them into LetSee
```swift
#if DEBUG
...
provider = MoyaProvider<Apis>(plugins:[letSee.logger])
//  provider
//  .request(.me) { result in
//
//  }.
#endif
```
### 3. Bon App??tit
Yes, that's it. Done, congratulation. Now just look at your Xcode's console for this message
```batch
// the server address could be something else in your machine
@LETSEE>  Server has started (192.168.1.100:8080/). 
```
---
### Next Features
- [ ] We need somehow open LetSee website in Safari (a button attached to window would be a great idea) 
- [ ] It would be great if we have something similar to **LetSee** website in the application, a Page for requests list and a details' page to show the details of that request.
- [ ]  It is a good idea to have a **BaseURL Provider**, this way, we can achieve `Feature/URL` (Devops team provides a new BaseUrl for each new feature and QA team tests each feature simultaneously without requiring new build)
