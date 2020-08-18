import 'package:app_flutter_userpreferences/src/pages/home_page.dart';
import 'package:app_flutter_userpreferences/src/pages/settings_page.dart';
import 'package:app_flutter_userpreferences/src/share_prefs/preferences_user.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferencesUser();
  await prefs.initPrefs();
  runApp(MyApp());
} 
 
class MyApp extends StatelessWidget {
  final prefs = new PreferencesUser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferences',
      initialRoute: prefs.lastPage,
      routes: {
        HomePage.routeName      : (BuildContext context) => HomePage(),
        SettingsPage.routeName  : (BuildContext context) => SettingsPage()
      },
    );
  }
}