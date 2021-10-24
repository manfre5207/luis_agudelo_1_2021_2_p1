import 'package:dogsbreed/screen/dogs_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ('Lista de razas'),
      initialRoute: 'home',
      routes: {'home': (_) => DogsScreen()},
    );
  }
}
