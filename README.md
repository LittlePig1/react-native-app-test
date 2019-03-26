
# react-native-app-test

## Getting started

`$ npm install react-native-app-test --save`

### Mostly automatic installation

`$ react-native link react-native-app-test`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-app-test` and add `RNAppTest.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNAppTest.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.carrot.appTest.RNAppTestPackage;` to the imports at the top of the file
  - Add `new RNAppTestPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-app-test'
  	project(':react-native-app-test').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-app-test/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-app-test')
  	```


## Usage
```javascript
import RNAppTest from 'react-native-app-test';

// TODO: What to do with the module?
RNAppTest;
```
  