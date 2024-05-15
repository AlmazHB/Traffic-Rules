// import 'package:flutter/material.dart';
// import 'package:test/data/constants/colors.dart';
// import 'package:test/models/models.dart';

// class GameTwo extends StatefulWidget {
//   const GameTwo({Key? key}) : super(key: key);

//   @override
//   State<GameTwo> createState() => _GameTwoState();
// }

// class _GameTwoState extends State<GameTwo> {
//   List<QuestionTwo> questionTwo = [
//     QuestionTwo(id: "1", jogaplar: {
//       "Traffic": 1,
//       "Walk": 3,
//       "Bike": 2,
//       "Light": 1,
//       "Cross": 3,
//       "Route": 2,
//     }),
//     QuestionTwo(id: "1", jogaplar: {
//       "Traffic": 1,
//       "Walk": 3,
//       "Bike": 2,
//       "Light": 1,
//       "Cross": 3,
//       "Route": 2,
//     })
//   ];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     onePressed;
//     colorNow;
//   }

//   int index = 1;
//   int itIsPressed=0;
//   int itIsLastPressed=0;
//   bool onePressed=false;
//   Color colorNow=Colors.blueAccent;

//   void changeColorToYellow(){
//     if (onePressed) {
//       setState(() {
//         colorNow=Colors.yellow;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: background,
//       appBar: AppBar(
//         backgroundColor: background,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         title: const Text("Game",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//         centerTitle: true,
//         elevation: 20,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           const Spacer(),
//           Center(
//             child: Wrap(
//               spacing: MediaQuery.of(context).size.width / 2,
//               children: [
//                 for (int i = 0; i < questionTwo[index].jogaplar.length; i++)
//                   GestureDetector(
//                     onTap: () {
//                       if (onePressed) {
//                         itIsPressed=questionTwo[index].jogaplar.values.toList()[i];
//                         if (itIsPressed==itIsLastPressed) {
//                           print('$itIsPressed win...');
//                         }else if(itIsLastPressed!=itIsPressed){
//                           print('$itIsLastPressed wonn..');
//                         }
//                           setState(() {
//                             onePressed=false;
//                           });
//                       } else if (!onePressed) {
//                          setState(() {
//                           onePressed=true;
//                           itIsLastPressed=questionTwo[index].jogaplar.values.toList()[i];
//                         });

//                         print(itIsLastPressed);
//                       }
//                     },
//                     child: Container(
//                       width: 240,
//                       decoration: BoxDecoration(
//                           color: colorNow ,
//                           borderRadius: BorderRadius.circular(18)),
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 64, vertical: 18),
//                       margin: EdgeInsets.only(bottom: 50),
//                       child: Center(
//                         child: Text(
//                           questionTwo[index].jogaplar.keys.toList()[i],
//                           style: TextStyle(color: Colors.white, fontSize: 24),
//                         ),
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//           Spacer(),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:test/data/constants/colors.dart';
import 'package:test/models/models.dart';

class GameTwo extends StatefulWidget {
  const GameTwo({Key? key}) : super(key: key);

  @override
  State<GameTwo> createState() => _GameTwoState();
}

class _GameTwoState extends State<GameTwo> {
  List<QuestionTwo> questionTwo = [
    QuestionTwo(id: 1, jogaplar: {
      "Traffic": 1,
      "Walk": 3,
      "Bike": 2,
      "Light": 1,
      "Cross": 3,
      "Route": 2,
    }),
    QuestionTwo(id: 2, jogaplar: {
      "Traffic": 1,
      "Walk": 3,
      "Bike": 2,
      "Light": 1,
      "Cross": 3,
      "Route": 2,
    })
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onePressed;
    colorNow;
    itIsIdPressed;
    winnsVolume;
  }

  int index = 1;
  int itIsPressed = 0;
  int itIsIdPressed = 0;
  int itIsLastPressed = 0;
  bool onePressed = false;
  Color colorNow = Colors.blueAccent;
  List<Color> colorOfAnswers = [
    Colors.blueAccent,
    Colors.blueAccent,
    Colors.blueAccent,
    Colors.blueAccent,
    Colors.blueAccent,
    Colors.blueAccent,
  ];
  List<int> winnsVolume = [];

  void changeColorToYellow(int id) {
    setState(() {
      // Iterate over the buttons and change the color if the ID matches
      // for (int i = 0; i < questionTwo[index].jogaplar.length; i++) {
      // String buttonId = questionTwo[index].jogaplar.keys.toList()[i];
      // if (buttonId == id) {
      //   colorNow = Colors.yellow; // Change the color
      //   break; // Exit the loop once the color is changed
      // }

      colorOfAnswers[id] = Colors.yellow;
    });
  }

  void changeColorToGreen(int id, int id1) {
    setState(() {
      colorOfAnswers[id] = Colors.green;
      colorOfAnswers[id1] = Colors.green;
    });
  }

  void changeColorToRed(int id, int id1) {
    setState(() {
      colorOfAnswers[id] = Colors.red;
      colorOfAnswers[id1] = Colors.red;
    });
  }

  void showErrorMessage(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Неправильный выбор!'),
      duration: Duration(seconds: 1), // Установка продолжительности 1 секунда
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          "Game",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 20,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Spacer(),
          Center(
            child: Wrap(
              spacing: MediaQuery.of(context).size.width / 2,
              children: [
                for (int i = 0; i < questionTwo[index].jogaplar.length; i++)
                  GestureDetector(
                    onTap: () {
                      if (onePressed) {
                        itIsPressed =
                            questionTwo[index].jogaplar.values.toList()[i];
                        if (itIsPressed == itIsLastPressed &&
                            i != itIsIdPressed) {
                          setState(() {
                            winnsVolume.add(itIsPressed);
                          });
                          changeColorToGreen(i, itIsIdPressed);
                          print('$itIsLastPressed win!...');
                          print(winnsVolume);
                        } else if (itIsLastPressed != itIsPressed) {
                          changeColorToRed(i, itIsIdPressed);
                          Future.delayed(Duration(seconds: 1), () {
                            setState(() {
                              colorOfAnswers[i] = Colors
                                  .blueAccent; // Изменяем цвет ответа на исходный
                              colorOfAnswers[itIsIdPressed] = Colors
                                  .blueAccent; // Изменяем цвет ответа на исходный
                            });
                          });
                          print('$itIsLastPressed wonn..');
                          showErrorMessage(context);
                        } else if (i == itIsIdPressed) {
                          setState(() {
                            colorOfAnswers[itIsIdPressed] = Colors.blueAccent;
                          });
                          showErrorMessage(context);
                        }
                        setState(() {
                          onePressed = false;
                        });
                      } else if (!onePressed) {
                        if (!winnsVolume.contains(questionTwo[index].jogaplar.values.toList()[i])) {
                          setState(() {
                            onePressed = true;
                            itIsLastPressed =
                                questionTwo[index].jogaplar.values.toList()[i];
                            itIsIdPressed = i;
                            // Call changeColorToYellow method with the ID of the tapped button
                            changeColorToYellow(i);
                          });
                          print(itIsLastPressed);
                        } else if (winnsVolume.contains(questionTwo[index].jogaplar.values.toList()[i])) {
                          showErrorMessage(context);
                        }
                      }
                      //  else if (!onePressed &&
                      //     winnsVolume.contains(i)) {
                      //   showErrorMessage(context);
                      //   print('$i is be winned');
                      // }
                    },
                    child: Container(
                      width: 240,
                      decoration: BoxDecoration(
                        color: colorOfAnswers[i],
                        borderRadius: BorderRadius.circular(18),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 64, vertical: 18),
                      margin: EdgeInsets.only(bottom: 50),
                      child: Center(
                        child: Text(
                          questionTwo[index].jogaplar.keys.toList()[i],
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
