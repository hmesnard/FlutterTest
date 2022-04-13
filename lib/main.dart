import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/country.dart';
import 'pages/loading.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MapScreen(),
      '/loading': (context) => Loading(),
      '/country-info': (context) => Country()
    },
  ));
}