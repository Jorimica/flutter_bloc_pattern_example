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
      theme: ThemeData.dark(),
      home: Scaffold(
        body: MovieList(),
      ),
    );
  }
}