import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        atomica: "atomic unit value",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.atomica}) : super(key: key);

  final String title;
  final String atomica;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _atomicU = 0;

  void _atomicUIncrease() {
    setState(() {
      _atomicU++;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[Text("datda")],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text("String:  "),
                    ),
                    Center(
                      child: Text("quarks:"),
                    ),
                    Center(
                      child: Text("Up Quark"),
                    ),
                    Center(
                      child: Text("Down Quark"),
                    ),
                    Center(
                      child: Text("data"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Text("data"),
          ),
          Expanded(
            child: Container(
              child: Text("data"),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: Colors.green,
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
          color: Colors.deepPurple,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}
