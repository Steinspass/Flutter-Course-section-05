import 'package:flutter/material.dart';
import 'package:preferences_user/src/pages/home_page.dart';
import 'package:preferences_user/src/pages/settings_page.dart';
import 'package:preferences_user/src/shared/shared_preferences_user.dart';
 
void main() async{

  final prefs = new Preferences();
  await prefs.initPrefs();
  runApp(MyApp());
} 
 
class MyApp extends StatelessWidget {

  final prefs = new Preferences();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shared Preferences',
      initialRoute: prefs.lastPage,
      routes: {
          HomePage.routeName      : (BuildContext context) => HomePage(),
          SettingsPage.routeName  : (BuildContext context) => SettingsPage(),
      },
    );
  }
}