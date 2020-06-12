# react-native-zendesk-ichat :mega:


[![Build Status](https://img.shields.io/npm/v/react-native-zendesk-ichat)](https://www.npmjs.com/package/react-native-zendesk-ichat)

## Getting started

Follow the instructions to install the SDK for iOS and Android.

`$ npm install react-native-zendesk-ichat --save` or  `$ yarn add react-native-zendesk-ichat`

### Mostly automatic installation

`$ react-native link react-native-zendesk-ichat` (Only versions less than 0.60)

### :blue_book: Manual installation


#### :iphone: iOS

##### Using CocoaPods (Best Approach)

- Target minimum iOS version: '9.0' => ZDCChat 1.4.1
- Target minimum iOS version: '9.3' => ZDCChat 1.4.2 (configured to use this version https://developer.zendesk.com/embeddables/docs/ios-chat-sdk/releasenotes#version-1.4.2)

1. Go to `ios` ➜ `pod install`.
2. Open up `ios/[...]/AppDelegate.m`
  - Add `#import <ZDCChat/ZDCChat.h>;`
  - Add 
	```objective-c
 	-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
	{
	...
		[ZDCChat initializeWithAccountKey:@"key"]; // <- add this
   		return YES;
	}
 	```

#### :iphone: Android

1. Open up `android/app/src/main/java/[...]/MainApplication.java`
  - Add `import com.rnzendeskchat.RNZendeskChatModule;` and `com.facebook.react.bridge.ReactApplicationContext;` to the imports at the top of the file
  - Add `static RNZendeskChatModule rnZendeskChatModule;` before the `onCreate` method;
  - Add 
  	```java 
	ReactApplicationContext reactContext = new ReactApplicationContext(this);
	rnZendeskChatModule = new RNZendeskChatModule(reactContext);
	rnZendeskChatModule.init("key");
	```
	to the `onCreate` method;
  - (Only versions less than 0.60) Add `new RNZendeskChatPackage()` to the list returned by the `getPackages()` method
2. Insert the following lines inside the allprojects repositories block in `android/build.gradle`:
  	```
	  maven { url 'https://zendesk.artifactoryonline.com/zendesk/repo' }
	```
3. (Only versions less than 0.60)  Append the following lines to `android/settings.gradle`:
  	```java
  	include ':react-native-zendesk-ichat'
  	project(':react-native-zendesk-ichat').projectDir = new File(rootProject.projectDir, '../node_modules/react-native-zendesk-ichat/android')
  	```
4. (Only versions less than 0.60)  Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-zendesk-ichat')
  	```

## 👍 Contribute

Show your ❤️ and support by giving a ⭐. Any suggestions and pull request are welcome !

### 📝 License

MIT © [DavidTito](https://github.com/davidtito1992)

## :rocket: Usage
```javascript
import RNZendeskChat from 'react-native-zendesk-ichat';

RNZendeskChat.startChat({
            name: 'someName',
            email: 'someEmail',
            phone: 'somePhone',
            tags: ['someTag1', 'someTag2']
          })
```
