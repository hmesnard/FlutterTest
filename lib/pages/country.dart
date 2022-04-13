import 'package:flutter/material.dart';

class Country extends StatefulWidget {

  @override
  State<Country> createState() => _CountryState();
}

class _CountryState extends State<Country> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(data['name']),
      ),
      body: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container()),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 40.0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.network(data['flagUrl']),
                  Divider(
                    color: Colors.grey[800],
                    height: 80.0,
                  ),
                  Text(data['capital'], style: TextStyle(
                    fontSize: 35.0
                  ),
                  ),
                  SizedBox(height: 20.0),
                  Text('is the capital of', style: TextStyle(
                    fontSize: 20.0
                  ),
                  ),
                  SizedBox(height: 20.0),
                  Text(data['name'], style: TextStyle(
                    fontSize: 35.0
                  ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container())
        ],
      ),
    );
  }
}
