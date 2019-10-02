# react-native-zendesk-ichat

## Getting started

Follow the instructions to install the SDK for iOS and Android.

`$ npm install react-native-zendesk-ichat --save` or  `$ yarn add react-native-zendesk-ichat`

### Mostly automatic installation

`$ react-native link react-native-zendesk-ichat` (Only versions less than 0.60)

### Manual installation


#### iOS

##### Using CocoaPods (Best Approach)

1. Go to `ios` ➜ `pod install`.
2. Open up `ios/[...]/AppDelegate.m`
  - Add `#import <ZDCChat/ZDCChat.h>;`
  - Add `[ZDCChat initializeWithAccountKey:@"key"];` before the `return YES;` in the `didFinishLaunchingWithOptions:(NSDictionary *)launchOptions` method;

#### Android

1. Open up `android/app/src/main/java/[...]/MainApplication.java`
  - Add `import com.rnzendeskchat.RNZendeskChatPackage;` and `com.facebook.react.bridge.ReactApplicationContext;` to the imports at the top of the file
  - Add `static RNZendeskChatModule rnZendeskChatModule;` before the `onCreate` method;
  - Add `ReactApplicationContext reactContext = new ReactApplicationContext(this);`
    `rnZendeskChatModule = new RNZendeskChatModule(reactContext);`
    `rnZendeskChatModule.init("key")` to the `onCreate` method;
  - (Only versions less than 0.60) Add `new RNZendeskChatPackage()` to the list returned by the `getPackages()` method
2. Insert the following lines inside the allprojects repositories block in `android/build.gradle`:
  	```
	  maven { url 'https://zendesk.artifactoryonline.com/zendesk/repo' }
	```
3. (Only versions less than 0.60)  Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-zendesk-ichat'
  	project(':react-native-zendesk-ichat').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-zendesk-ichat/android')
  	```
4. (Only versions less than 0.60)  Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-zendesk-ichat')
  	```


## Usage
```javascript
import RNZendeskChat from 'react-native-zendesk-ichat';

RNZendeskChat.startChat({
            name: 'someName',
            email: 'someEmail',
            phone: 'somePhone',
            tags: ['someTag1', 'someTag2'],
            department: 'someDepartment'
          })
```
