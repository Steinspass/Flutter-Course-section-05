import 'package:shared_preferences/shared_preferences.dart';


class Preferences{


  // ninguna de estas propiedades se usa
  //bool _colorSecondary;
  //int _gender;
  //String _name;

  static final  Preferences _instancia = new Preferences._internal();

  factory Preferences() {
    return _instancia;
  }

  Preferences._internal();

  SharedPreferences _prefs;

  initPrefs() async{
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET & SET GENDER
  get gender{
    return _prefs.getInt('gender') ?? 1;
  }

  set gender(int value) {
    _prefs.setInt('gender', value);
  }

  // GET & SET SECONDARY COLOR
  get colorSecondary{
    return _prefs.getBool('secondary') ?? false;
  }

  set colorSecondary(bool value) {
    _prefs.setBool('secondary', value);
  }

  // GET & SET USER NAME
  get userName{
    return _prefs.getString('username') ?? 'no name';
  }

  set userName(String value) {
    _prefs.setString('username', value);
  }

  // GET & SET LAST PAGES
  get lastPage{
    return _prefs.getString('lastPage') ?? 'home';
  }

  set lastPage(String value) {
    _prefs.setString('lastPage', value);
  }


}