import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:play_ground/navBar.dart';

void main() {
  runApp(MyClicker());
}

class MyClicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(
        test: 'test',
        myData: 'dataBro',
        myint: 2,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.test, this.myData, this.myint}) : super(key: key);
  final String test;
  final String myData;
  final int myint;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _intval = 2;

  void _stringIncrement() {
    setState(() {
      _intval++;
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
              _intval++;
              log("Container clicked");
            });
          },
          child: new Container(
            color: Colors.green,
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
                        '$_intval',
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
                        '$_intval',
                        style: TextStyle(height: 1.5, fontSize: 40),
                      ),
                    )
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
