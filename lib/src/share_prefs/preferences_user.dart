
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUser{
  static final PreferencesUser _instancia = new PreferencesUser._internal();

  factory PreferencesUser(){
    return _instancia;
  }

  PreferencesUser._internal();

  SharedPreferences _prefs;

  initPrefs() async{
    this._prefs = await SharedPreferences.getInstance();
  }

  get gender {
    return _prefs.getInt('gender')??1;
  }

  set gender(int value){
    _prefs.setInt('gender', value);
  }

  get secondaryColor {
    return _prefs.getBool('secondaryColor')??false;
  }

  set secondaryColor(bool value){
    _prefs.setBool('secondaryColor', value);
  }

  get name {
    return _prefs.getString('name')??'';
  }

  set name(String value){
    _prefs.setString('name', value);
  }

}