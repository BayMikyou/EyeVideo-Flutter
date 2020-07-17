import 'package:eye_video/bizmodule/main/thiz/main_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EyeVideo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: MainPage(title: 'EyeVideo'),
    );
  }
}
