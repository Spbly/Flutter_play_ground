import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/clickTextCounters.dart';
import 'services/lifeCycleManager.dart';
import 'store.dart';
import 'appState.dart';

void main() {
  LifeCycleManager.registerServices();
  runApp(MyClicker(store: AppStore));
}

class MyClicker extends StatelessWidget {
  final Store<AppState> store;

  MyClicker({this.store});

  @override
  Widget build(BuildContext context) {
    return LifeCycleManager(
        child: StoreProvider(
      store: store,
      child: MaterialApp(
        home: HomePage(),
      ),
    ));
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int clickCount = 0;

  void initState() {
    super.initState();
    print("Here is the init state");
    loadCounter();
  }

  _stringIncrement() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      clickCount = (_prefs.getInt('counter') ?? 0) + 1;
      _prefs.setInt('counter', clickCount);
    });
  }

  loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      clickCount = (prefs.getInt('counter') ?? 0);
      print(clickCount);
    });
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new GestureDetector(
          onTap: () {
            setState(() {
              _stringIncrement();
              log("Container clicked");
            });
          },
          child: new Container(
            color: Colors.lightBlue,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(
                        "String: ",
                        style: TextStyle(height: 1.5, fontSize: 40),
                      ),
                    ),
                    Center(
                      child: Text(
                        '$clickCount',
                        style: TextStyle(height: 1.5, fontSize: 40),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(
                        "Quarks: ",
                        style: TextStyle(height: 1.5, fontSize: 40),
                      ),
                    ),
                    Center(
                      child: Text(
                        '$clickCount',
                        style: TextStyle(height: 1.5, fontSize: 40),
                      ),
                    ),
                    Center(
                      child: ClickTextCounter(),
                    ),
                  ],
                ),
              ],
            ),
          )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_iridescent),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _stringIncrement,
        backgroundColor: Colors.red,
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
