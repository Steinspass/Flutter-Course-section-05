import 'package:flutter/material.dart';
import 'package:preferences_user/src/shared/shared_preferences_user.dart';
import 'package:preferences_user/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'home';
  final Preferences prefs = Preferences(); 

  @override
  Widget build(BuildContext context) {

    prefs.lastPage = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences User'),
        backgroundColor: (prefs.colorSecondary) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Secondary Color: ${ prefs.colorSecondary }'),
          Divider(),
          Text('Gender: ${prefs.gender}'),
          Divider(),
          Text('User name: ${prefs.userName}'),
          Divider(),
        ],
      ),
    );
  }

}