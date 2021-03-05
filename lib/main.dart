import 'package:flutter/material.dart';
import 'package:netflix_clone/pages/root_app.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: RootApp(),
  ));
}
