import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //controller for TabBar
      title: 'Exercise 1 ',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: HomePage(title: 'My Icon'),
    );
  }
}
class HomePage extends StatefulWidget{
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int red = 0;
  int green = 0;
  int blue = 0;
  double iconSize = 100;

  bool _isAllowResize = false;
  bool _isAllowColor = false;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.blue[100], //background color of scaffold
      appBar: AppBar(
          backgroundColor: Colors.brown, //background color of app bar
          title: Text(widget.title),
          actions: _isAllowResize ? [
            IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    iconSize -= 50;
                  });
                }),
            TextButton(
              child: Text(
                "S",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  iconSize = 100;
                });
              },
            ),
            TextButton(
              child: Text(
                "M",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  iconSize = 300;
                });
              },
            ),
            TextButton(
              child: Text(
                "L",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  iconSize = 500;
                });
              },
            ),
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    iconSize += 50;
                  });
                }),
          ] : []
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              child: CheckboxListTile(
                title: const Text('Allow resize?'),
                activeColor: Colors.grey,
                checkColor: Colors.white,
                value: _isAllowResize,
                onChanged: (bool value) {
                  setState(() {
                    _isAllowResize = value;
                  });
                },
              ),
            ),
            Container(
                child: CheckboxListTile(
                  title: const Text('Allow change primer color?'),
                  activeColor: Colors.grey,
                  checkColor: Colors.white,
                  value: _isAllowColor,
                  onChanged: (bool value) {
                    setState(() {
                      _isAllowColor = value;
                    });
                  },
                ),
            ),
            ListTile(
                onTap:(){
                  if(scaffoldKey.currentState.isDrawerOpen){ //check if drawer is open
                    Navigator.pop(context); //context of drawer is different
                  }
                },
                leading:Icon(Icons.close),
                title: Text("Close")
            )
          ],
        ),
      ),

      body: SizedBox( //content body on scaffold
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(
                Icons.access_alarm,
                size: iconSize,
                color: Color.fromRGBO(red, green, blue, 1),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _isAllowColor ? FloatingActionButton(
            backgroundColor: Colors.red[700],
            onPressed: () {
              setState(() {
                red = 255;
                green = 0;
                blue = 0;
              });
            },
            child: Text("$red"),
          ) : Text("$red"),
          _isAllowColor ? FloatingActionButton(
            backgroundColor: Colors.green[700],
            onPressed: () {
              setState(() {
                red = 0;
                green = 255;
                blue = 0;
              });
            },
            child: Text("$green"),
          ) : Text("$green"),
          _isAllowColor ? FloatingActionButton(
            backgroundColor: Colors.blue[700],
            onPressed: () {
              setState(() {
                red = 0;
                green = 0;
                blue = 255;
              });
            },
            child: Text("$blue"),
          ) : Text("$blue"),
        ],
      ),

      bottomNavigationBar: SizedBox(
        height: 150,
        child: Column(
          children: <Widget>[
            Slider(
              activeColor: Colors.grey[500],
              value: red.toDouble(),
              min: 0.0,
              max: 255.0,
              onChanged: (value) {
                setState(() {
                  red = value.toInt();
                });
              },
            ),
            Slider(
              activeColor: Colors.grey[500],
              value: green.toDouble(),
              min: 0.0,
              max: 255.0,
              onChanged: (value) {
                setState(() {
                  green = value.toInt();
                });
              },
            ),
            Slider(
              activeColor: Colors.grey[500],
              value: blue.toDouble(),
              min: 0.0,
              max: 255.0,
              onChanged: (value) {
                setState(() {
                  blue = value.toInt();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
