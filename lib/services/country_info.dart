import 'dart:convert';
import 'package:http/http.dart';

class CountryInfo {
  String name;
  String capital = '';
  String flagUrl = '';

  CountryInfo({ required this.name });

  Future<void> getInfo() async {
    try {
      Response response = await get(Uri(
          scheme: 'https',
          host: 'restcountries.com',
          path: 'v3.1/name/$name'));
      Map data = jsonDecode(response.body)[0];
      print(data);

      capital = data['capital'][0];
      flagUrl = data['flags']['png'];
    }
    catch (e) {
      print(e);
    }
  }
}