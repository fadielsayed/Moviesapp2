import 'package:flutter/material.dart';
import 'package:movie_app/screens/HomeScreen/home_screen.dart';
import 'package:movie_app/shared/Dio/dio_helper.dart';

void main() {
  DioHelper.initDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
