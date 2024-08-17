
## Getting Started

The Transrentals contains the minimal implementation required to create a new library or project. The repository code is preloaded with some basic components like basic app architecture, app theme, constants and required dependencies to create a new project. By using boiler plate code as standard initializer, we can have same patterns in all the projects that will inherit it. This will also help in reducing setup & development time by allowing you to use same code pattern and avoid re-writing from scratch.

---

### Folder Structure

Here is the core folder structure which flutter provides.

```
flutter-app/
|- assets
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- app/
|- core/
|- di/
|- features/
|- gen/
|- global_widgets/
|- routes/
|- translations/
|- utils/
|- main.dart
```

Now, lets dive into the lib folder which has the main code for the application.

1. app: </br>

   - This is an entry point of an application. </br>
   - themes, locale, routes, etc are defined here.

2. core:

   - `constants`: All app level constants (e.g textStyles, color, themes,etc).

   - `local`: Local storage helper methods and keys are defined here.

   - `network`: Dio http client, endpoints and interceptor are defined here.

3. di:

   - Dependencies which needs to be injected as soon as app loads are defined here.

4. features:

   - All the pages/feature are defined here.
   - Every feature must contain following :
     - data: For networking related stuff
     - view: For UI
     - controller: For managing state and
     - binding

5. gen:

   - All the app level assets (e.g Images, fonts,etc are auto generated here by `flutter packages pub run build_runner build --delete-conflicting-outputs`)

6. global_widgets:

   - Custom and resusable widgets are defined here.

7. routes:

   - pages: Where all the Get pages are defined with its respective bindings.
   - routes: Routes keys are defined here.

8. translations:

   - All the keys/strings with its respective localized values are defined here.

9. utils: App utilities are defined here. E.g :
   - connection
   - device
   - permission
   - platform

---

### Assets

Contains custom fonts, icons, and images

```
assets/
|- fonts/
|- images/
```

---

## Splash Screen

In order to use your logo in the splash screen. Simply update the `logo.png` inside `assets/images/` with your logo and run the following command.

```
flutter clean && flutter pub get && flutter pub run flutter_native_splash:create
```

---

## Responsiveness

The project is built with `flutter_screen_util`, in order to make the application responsive.

---

</br>

## Packages used in this Project

1. `dio`: A powerful Http client for Dart
2. `get`: A library for reactively managing the state of your applications
3. `flutter_screenutil`: Adds the responsiveness of your application to different screen sizes.
4. `connectivity_plus`: Checks the network connectivity of device.
5. `permission_handler`: Used to request permission from the user
6. `logger`: Small, easy to use and extensible logger which prints beautiful logs.
7. `shared_preferences`: Local Storage
8. `gap`: For adding gaps inside Flex widgets such as Columns and Rows or scrolling views.
