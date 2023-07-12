# base_app_credible

Flutter app credible, this application has registration, login and home. It allows the flow of creation and login of a user for now stores the information on the device but is easily expandable to access a login service, the home shows a list of 10 websites and opens a webview where you can navigate the site, you can switch to dark mode.

## Description

 This app contain a few pakages already configured, to use in middle and big applications;  between of the most important characteristic include are pakages to manages internationalization, routes, states and help to mapping objects, to see more details check dependencies section.

## Dependencies
 - auto_route `Manages router.`
 - dio `HTTP client.`
 - flutter_localizations `Internationalization.`
 - flutter_riverpod `State manager.`
 - freezed `Code generator for data-classes/unions/pattern-matching/cloning.`
 - webview_flutter `Provides a WebView widget.`
 - camera `Access to the device cameras.`

## Installation steps 

Clone this repository  

Run: `flutter pub get`

Run: `flutter pub run build_runner build --delete-conflicting-outputs`

Run the project.

## first steps inside the application

create an account (once created for the first time it is saved on the device and it is possible to log in)