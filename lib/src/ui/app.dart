import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'movie_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xff212121),
        scaffoldBackgroundColor: Color(0xff616161),
        accentColor: Colors.amber,
        textTheme: TextTheme(
          title: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.amber),
          subtitle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.amber),
          body1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.white),
          body2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.white),
      )
      ),
      home: Scaffold(
        body: MovieList(),
      ),
    );
  }
}