import 'package:flutter/material.dart';
import 'package:preferences_user/src/shared/shared_preferences_user.dart';
import 'package:preferences_user/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings'; 

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecondary;
  int _gender;
  String _name = "";

  TextEditingController _textEditingController;

  final Preferences prefs = Preferences();

  @override
  void initState() {
    super.initState();

    prefs.lastPage = SettingsPage.routeName;

    _gender = prefs.gender;
    _colorSecondary = prefs.colorSecondary;

    _textEditingController = new TextEditingController(text: prefs.userName );
  }

  _setSelectedRadio(int value){
    prefs.gender = value;

    _gender = value;
    setState(() {
      
    });
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: (prefs.colorSecondary) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold ),) ,
          ),

          Divider(),

          SwitchListTile(
            value: _colorSecondary,
            title: Text('Color secundario'),
            onChanged: (value){
              setState(() {
                _colorSecondary = value;
                prefs.colorSecondary = value; 
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _gender,
            onChanged: _setSelectedRadio
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _gender,
            onChanged: _setSelectedRadio
          ),
          
          Divider(),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Name',
                helperText: 'Person Name' 
              ),
              onChanged: (text){
                _name = text;
                 prefs.userName = text;
              },
            ),
          ),

          

        ],
      ),
    );
  }
}