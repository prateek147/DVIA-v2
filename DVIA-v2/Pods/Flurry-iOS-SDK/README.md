# Flurry SDK

[![pod](https://img.shields.io/cocoapods/v/Flurry-iOS-SDK)](https://cocoapods.org/pods/Flurry-iOS-SDK)
[![platform](https://img.shields.io/cocoapods/p/Flurry-iOS-SDK)](https://cocoapods.org/pods/Flurry-iOS-SDK)
[![license](https://img.shields.io/github/license/flurry/flurry-ios-sdk)](https://github.com/flurry/Flurry-iOS-SDK)

## Table of Contents

- [Installation](#installation)
  - [iOS](#ios)
  - [watchOS](#watchos)
  - [tvOS](#tvos)
- [Requirements](#requirements)
- [Examples](#examples)
- [Suppport](#support)
- [License](#license)

## Installation

To install FlurrySDK from CocoaPods, please follow the instructions below. Remember to include `use_frameworks!` if your app target is in Swift.

### iOS

To enable Flurry Analytics:

```ruby
pod 'Flurry-iOS-SDK/FlurrySDK'
```

To enable Flurry Ad serving: 

```ruby
pod 'Flurry-iOS-SDK/FlurrySDK'
pod 'Flurry-iOS-SDK/FlurryAds'
```

To enable Flurry Config:

```ruby
pod 'Flurry-iOS-SDK/FlurryConfig'
```

To enable Flurry Messaging:

```ruby
pod 'Flurry-iOS-SDK/FlurryMessaging'
```

### watchOS

To use FlurrySDK for Apple Watch 2.x Extension:    

```ruby
target 'Your Apple Watch 2.x Extension Target' do 
  platform :watchos, '2.0'
  pod 'Flurry-iOS-SDK/FlurrySDK'
end   
```

### tvOS

To use FlurrySDK for tvOS apps:

```ruby
target 'Your tvOS Application' do
  platform :tvos, '10.0'
  pod 'Flurry-iOS-SDK/FlurrySDK'
end
```

To enable Flurry Messaging for tvOS:

```ruby
pod 'Flurry-iOS-SDK/FlurryMessaging'
```

## Requirements

* iOS 10.0+
* tvOS 10.0+
* watchOS 3.0+

## Examples

Listed below are brief examples of initializing and using Flurry in your project. For detailed instructions, please [check our documentation](https://developer.yahoo.com/flurry/docs/).

### Initialize Flurry

* iOS/tvOS

  To initialize Flurry, please import Flurry in your Application Delegate and start a Flurry session inside `applicationDidFinishLaunching`, as described below.

  ```swift
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      let sb = FlurrySessionBuilder()
            .build(logLevel: FlurryLogLevel.all)
            .build(crashReportingEnabled: true)
            .build(appVersion: "1.0")
            .build(iapReportingEnabled: true)
        
      Flurry.startSession(apiKey: "YOUR_API_KEY", sessionBuilder: sb)
      return true
  }
  ```

* watchOS

  Please follow [our instructions here](https://developer.yahoo.com/flurry/docs/integrateflurry/watchos/).

### Log Events

Use this to log normal events and timed events in your app.

* iOS/tvOS

  ```swift
  // Normal events
  Flurry.log(eventName: "Event", parameters: ["Key": "Value"])
        
  // Timed events
  Flurry.log(eventName: "Event", parameters: ["Key": "Value"], timed: true)
  Flurry.endTimedEvent(eventName: "Event", parameters: ["Key": "Value"])
        
  // Standard events
  let param = FlurryParamBuilder()
      .set(doubleVal: 34.99, param: FlurryParamBuilder.totalAmount())
      .set(booleanVal: true, param: FlurryParamBuilder.success())
      .set(stringVal: "book 1", param: FlurryParamBuilder.itemName())
      .set(stringVal: "This is an awesome book to purchase !!!", key: "note")
        
  Flurry.log(standardEvent: FlurryEvent.purchased, param: param)
  ```
  Please see our [sample project here](https://github.com/flurry/iOS-StandardEventSample).


* watchOS

  ```swift
  FlurryWatch.logWatchEvent("Event", withParameters: ["Key": "Value"])
  ```

### Log Error (iOS/tvOS)

Use this to log exceptions and/or errors that occur in your app. Flurry will report the first 10 errors that occur in each session.

```swift
Flurry.log(errorId: "ERROR_NAME", message: "ERROR_MESSAGE", exception: e)
```

### Track User Demographics (iOS/tvOS)

After identifying the user, use this to log the user’s assigned ID, username, age and gender in your system.

```swift
Flurry.set(userId: "USER_ID")
Flurry.set(age: 20)
Flurry.set(gender: "f") // "f" for female and "m" for male
```

### Session Origins and Attributes (iOS/tvOS)

This allows you to specify session origin and deep link attached to each session, or add a custom parameterized session parameters. You can also add an SDK origin specified by origin name and origin version.

```swift
Flurry.add(sessionOriginName: "SESSION_ORIGIN")
Flurry.add(sessionOriginName: "SESSION_ORIGIN", deepLink: "DEEP_LINK")
Flurry.sessionProperties(["key": "value"])
Flurry.add(originName: "ORIGIN_NAME", originVersion: "ORIGIN_VERSION")
Flurry.add(originName: "ORIGIN_NAME", originVersion: "ORIGIN_VERSION", parameters: ["key": "value"])
```

## Support

* [Flurry Documentation](https://developer.yahoo.com/flurry/docs/)
* [FAQs for Flurry](https://developer.yahoo.com/flurry/docs/faq/)
* [Flurry Support](https://developer.yahoo.com/support/flurry/)

## License

Copyright (c) 2021 Yahoo. All rights reserved.

This project is licensed under the terms of the [Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0) open source license. Please refer to [LICENSE](LICENSE) for the full terms. Your use of Flurry is governed by [Flurry Terms of Service](https://developer.yahoo.com/flurry/legal-privacy/terms-service/).

