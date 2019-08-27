import 'package:flutter/material.dart';
import 'movie_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Movie List App',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.black
    ),
    home: new MovieList(),
  );
}

