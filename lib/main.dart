import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Meals App",
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          primarySwatch: Colors.grey,
          accentColor: Colors.deepOrange,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff282726),
      appBar: AppBar(
        title: Text('Meals App'),
      ),
      body: Text('Show Chart'),
    );
  }
}
