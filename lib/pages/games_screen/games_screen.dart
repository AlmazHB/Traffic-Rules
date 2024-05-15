import 'package:flutter/material.dart';
import 'package:test/pages/games_screen/game._two.dart';
import 'package:test/pages/games_screen/suraty_sayla.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 87, 181, 202),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 87, 181, 202),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Games',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              "Select the Game",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SuratSayla(),
                  ),
                );
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2.8,
                height: MediaQuery.of(context).size.height / 1.7,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/game/p1.png"),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 14,
                        child: const Text(
                          "Select the correct answer",
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const GameTwo(),
                  ),
                );
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2.8,
                height: MediaQuery.of(context).size.height / 1.7,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/game/p2.jpg"),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 14,
                        child: const Text(
                          "Select the correct answer",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
          const Spacer(),
        ],
      ),
    );
  }
}
