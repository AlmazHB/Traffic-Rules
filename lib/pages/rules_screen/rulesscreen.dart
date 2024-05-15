import 'package:flutter/material.dart';
import 'package:test/pages/rules_screen/rules.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD0E5D8),
      appBar: AppBar(
        backgroundColor: Color(0xFFD0E5D8),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('List Rules'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text("Bus stop sing"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BusStopSing(),
                ),
              );
            },
          ),
          ListTile(
            title: Text("Road types"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RoadTypes(),
                ),
              );
            },
          ),
          ListTile(
            title: Text("Residential Zone"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ResidentialZone(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
