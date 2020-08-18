import 'package:app_flutter_userpreferences/src/share_prefs/preferences_user.dart';
import 'package:app_flutter_userpreferences/src/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  //const SettingsPage({Key key}) : super(key: key);
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  
  bool _secondaryColor;
  int _gender;
  String _name;
  TextEditingController _textController;
  final prefs = new PreferencesUser();

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    //loadPref();
    prefs.lastPage = SettingsPage.routeName;
    _gender = prefs.gender;
    _secondaryColor = prefs.secondaryColor;

    _textController = new TextEditingController(text: prefs.name);
  }

  /*loadPref() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _gender = prefs.getInt('gender');
    setState(() {
      
    });
  }*/

  _setSelectedRadio(int value){
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    
    //prefs.setInt('gender', value);

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
        backgroundColor: (prefs.secondaryColor) ? Colors.teal: Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings',style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),),
          ),
          Divider(),
          SwitchListTile(
            value: _secondaryColor,
            title: Text('Secondary color'),
            onChanged: (value){              
              setState(() {
                _secondaryColor = value;
                prefs.secondaryColor = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text('Male'),
            groupValue: _gender,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Female'),
            groupValue: _gender,
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Name',
                helperText: 'Name user',
              ),
              onChanged: (value){
                prefs.name = value;
              },
            ),
          )
        ],
      ),
    );
  }
}