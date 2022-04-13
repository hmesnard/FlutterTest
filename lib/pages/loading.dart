import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:testmaps/services/country_info.dart';

class Loading extends StatefulWidget {

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  Map data = {};

  void setupCountryInfo(BuildContext context) async {
    data = ModalRoute.of(context)!.settings.arguments as Map;

    print(data);
    CountryInfo countryInfo = CountryInfo(
        name: data['name']
    );
    await countryInfo.getInfo();
    Navigator.pushReplacementNamed(context, '/country-info', arguments: {
      'name': countryInfo.name,
      'capital': countryInfo.capital,
      'flagUrl': countryInfo.flagUrl
    });
  }

  @override
  Widget build(BuildContext context) {
    setupCountryInfo(context);

    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitDualRing(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
