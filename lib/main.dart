import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/country.dart';
import 'pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MapScreen(),
      '/loading': (context) => Loading(),
      '/country-info': (context) => Country()
    },
  ));
}