# Welcome to LetSee!
## Table of Contents

* [What is wrong with Xcode's console ](#what-is-wrong-with-xcodes-console)
* [What is LetSee?](#then-what-is-letSee)
* [Modularization](#modularization)
	* [Core](#core)
	* [In App View](#in-app-view)

## What is wrong with Xcode's console?

Many applications need to handle API calls and communicate with servers. The problem is by logging API calls (requests and responses) in **Xcode's console**, you see a very **crowded terminal, nasty and confusing** information, moreover for a piece of data, you have to look through all printed texts in the terminal alongside with **interface issues, library warnings, other logs** and more ... within a very ordinary, unorganized and pale color place. Are you tired of this?

![alt text](https://github.com/farshadjahanmanesh/Letsee/blob/main/Examples%2BImages/bad.jpg?raw=true)

## Then what is LetSee?
**LetSee**, lets you see what is going on between your application and the server in a **very neat, clean, and organized** space. Do you like this?

https://user-images.githubusercontent.com/13612410/166748962-bcf2c962-cc40-4960-aeb4-7c06003fa12d.mp4

LetSee consists of 2 modules to do its job which we will talk about them in the following section
> **Note:** We took _inspiration_ from [**WatchTower**](https://github.com/adibfara/WatchTower) written by [Adibfara](https://github.com/adibfara).

# Modularization
LetSee consists of 2 modules, each module brings a set of powerful tools to facilitate working with your networking system.

## Core
<img width="505" alt="image" src="https://user-images.githubusercontent.com/13612410/166746755-dd48bdcd-8f1d-4a6d-959d-401291dcdf89.png">

### LetSee Core Features
-   Tracks and observes all API calls made through Moya, Alamofire, and ...'s client
-   GET, POST, PUT, DELETE, PATCH methods
-   Query parameters, request and response body, and headers
-   Response success and failure status, size, date, and latency
-   Adjustable port for the server and the WebSocket server
-   API call history, even If no browsers were open
-   Search in the URLs of all requests
-   Fully responsive UI
## In App View
<img width="200" alt="image" src="https://user-images.githubusercontent.com/13612410/166746802-0df3b7a4-07f4-4fba-8f79-6bc51637b9e1.png">

### LetSee In App View Features
- Facilitates network request mocking 
- Provides a neat way for defining mock response
- Intercepts the URLRequests and lets you choose a corresponding response
- Provides 4 default responses for every request (Live, Cancel, Custom Success, Custom Error)
- Lets you edit the response JSON
- Helps you test all of the response scenarios (to check if all scenarios have been implemented)
- Has a beautiful SwiftUI view 

## How To Use:
### 1. Add LetSee to your project
using this library is undoubtedly easy, currently we support **CocoaPods** and **Swift Package Manager**

#### CocoaPods
just import LetSee simply like other pods
```ruby
// imports just core features
pod 'LetSee' 
// imports two Moya providers (interceptor and logger)
pod 'LetSee/MoyaPlugin' 
 // in app view which helps you see the request and choose the respond
pod 'LetSee/InAppView'

/// there is one more module, if you want to use raw LetSee Interceptor without LetSee SwiftUI Request List View, you can import it like this. 
pod 'LetSee/Interceptor' 
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
class SomeAPIManagerClass {
	...
	let  letSee = LetSee()
	...
}
#endif
```
#### 2.1 Using LetSee
LetSee needs to know about request and responses to log them, so we need to notify it like this
```swift
final class APIManager {
    func sampleRequest(request: URLRequest) {
	// makes this request identifiable by adding a unique id to its header
	let request = request.addID()
	
	// notifies letSee about this request
        letSee.log(.request(request: request))
	
	// runs the request
        mockSession.dataTask(with: request) { data, response, error in
            // code to handle the response....

	    // logs the response for the request we've just send.
            letSee.log(.response(request: request, response: response, body: data))
        }
        .resume()
    }
    init() {}
}
```

#### 2.2 Using LetSee alongside with Moya
Then you need to pass the `LetSeeLogs` to `Moya` as a plugin like this.  **LetSeeLogs** is a MoyaPlugin which interrupts the requests and log them into LetSee
```swift
#if DEBUG
...
provider = MoyaProvider<Apis>(plugins:[LetSeeLogs(webServer: letSee.webServer)])
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
- [x] It would be great if we have something similar to **LetSee** website in the application, a Page for requests list and a details' page to show the details of that request.
- [ ]  It is a good idea to have a **BaseURL Provider**, this way, we can achieve `Feature/URL` (Devops team provides a new BaseUrl for each new feature and QA team tests each feature simultaneously without requiring new build)
