import 'package:flutter/material.dart';

class GameOne extends StatefulWidget {
  const GameOne({Key? key}) : super(key: key);

  @override
  State<GameOne> createState() => _GameOneState();
}

class _GameOneState extends State<GameOne> {
  var tiles = List.filled(9, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 87, 181, 202),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 181, 202),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text("0 and X"),
      ),
      body: Row(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: GridView.count(
              crossAxisSpacing: 3,
              mainAxisSpacing: 1,
              crossAxisCount: 3,
              children: <Widget>[
                for (var i = 0; i < 9; i++)
                  InkWell(
                    onTap: () {
                      tiles[i] = 1;
                      runAi();
                    },
                    child: Center(
                      child: Text(tiles[i] == 0
                          ? ''
                          : tiles[i] == 1
                              ? 'X'
                              : '0'),
                    ),
                  ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(isWinning(1, tiles)
                  ? 'You won!'
                  : isWinning(2, tiles)
                      ? 'You lost'
                      : 'You move'),
              OutlinedButton(onPressed: () {setState(() {
                tiles= List.filled(9, 0);
              });}, child: Text('Restart'))
            ],
          )
        ],
      ),
    );
  }

  void runAi() async {
    await Future.delayed(Duration(milliseconds: 200));
    int? winning;
    int? blocing;
    int? normal;

    for (var i = 0; i < 9; i++) {
      var val = tiles[i];
      if (val > 0) {
        continue;
      }
      var future = [...tiles]..[i] = 2;
      if (isWinning(2, future)) {
        winning = i;
      }
      future[i] = 1;
      if (isWinning(1, future)) {
        blocing = i;
      }
      normal = i;
    }
    var move = winning ?? blocing ?? normal;
    if (move != null) {
      setState(() {
        tiles[move] = 2;
      });
    }
  }

  bool isWinning(int who, List<int> future) {
    return 
        (tiles[0] == who && tiles[1] == who && tiles[2] == who) ||
        (tiles[3] == who && tiles[4] == who && tiles[5] == who) ||
        (tiles[6] == who && tiles[7] == who && tiles[8] == who) ||
        (tiles[0] == who && tiles[4] == who && tiles[8] == who) ||
        (tiles[2] == who && tiles[4] == who && tiles[6] == who) ||
        (tiles[0] == who && tiles[3] == who && tiles[6] == who) ||
        (tiles[1] == who && tiles[4] == who && tiles[7] == who) ||
        (tiles[2] == who && tiles[5] == who && tiles[8] == who);
  }
}
