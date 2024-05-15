import 'package:flutter/material.dart';

class BusStopSing extends StatelessWidget {
  const BusStopSing({super.key});

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
        title: const Text("Bus Stop Sing"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height-60,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage("assets/images/busstop1.png"),
          ),
        ),
      ),
    );
  }
}

class RoadTypes extends StatelessWidget {
  const RoadTypes({Key? key}) : super(key: key);

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
        title: const Text("Road types"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height-60,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage("assets/images/roadway.png"),
          ),
        ),
      ),
    );
  }
}
class ResidentialZone extends StatelessWidget {
  const ResidentialZone({Key? key}) : super(key: key);

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
        title: const Text("Road types"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height-60,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage("assets/images/residentialzone.png"),
          ),
        ),
      ),
    );
  }
}

