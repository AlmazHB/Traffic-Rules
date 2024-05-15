import 'package:flutter/material.dart';
import 'package:test/data/constants/colors.dart';
import 'package:test/models/models.dart';
import 'package:test/widgets/widgets.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<Question> question = [
    Question(
        id: "1",
        sorag: "What to do in such a situation?",
        jogaplar: {
          "Give way to a vehicle": false,
          "Cross the road in front of car": false,
          "A motorist must give way to a pedestrian": true,
        },
        surat: "assets/images/test/first.png"),
    Question(
        id: "2",
        sorag: "What should drivers do if they see a pedestrain crossing sing?",
        jogaplar: {
          "They have to get out of the car": false,
          "They should slow down/stop": true,
          "They should add speed": false,
        },
        surat: ""),
    Question(
        id: "3",
        sorag: "Find the girl’s mistake?",
        jogaplar: {
          "She crosses the road with backpack": false,
          "She plays the phone": true,
          "She put on her sneakers wrong": false,
        },
        surat: "assets/images/test/p3.png"),
    Question(
        id: "4",
        sorag: "What / Who doesn’t  participate in traffic?",
        jogaplar: {
          "Birds": true,
          "Girls": false,
          "Boys": false,
          "Drivers": false,
        },
        surat: ""),
    Question(
        id: "5",
        sorag: "Which of these rules are wrong?",
        jogaplar: {
          "A green traffic light means you can cross the road": false,
          '“Children” sign located nears school, camp, kindergarten ': false,
          "A traffic light needed for animal": true,
          "A pedestrian crossing indicates that there is a pedestrian nearby ":
              false,
        },
        surat: ""),
    Question(
        id: "6",
        sorag: "Find the boy’s mistake ?",
        jogaplar: {
          "He listens to music on his headphone while crossing the road": true,
          "He didn’t put on socks": false,
          "He crosses the pedestrian crossing ": false,
        },
        surat: "assets/images/test/p6.png"),
    Question(
        id: "7",
        sorag: "When should you follow traffic rules?",
        jogaplar: {
          "Always": true,
          "In the dark ": false,
          "When you are in the mood for it ": false,
          "Never": false,
        },
        surat: ""),
    Question(
        id: "8",
        sorag: "What games can you play on the roadway?",
        jogaplar: {
          "In sedentary ": false,
          "Board games ": false,
          "In no way ": true,
          'All games': false,
        },
        surat: ""),
    Question(
        id: "9",
        sorag: "Where should you expect public transport?",
        jogaplar: {
          "On the side of the road ": false,
          "At a stop, you can not go out onto the roadway": true,
          "In any place convenient for pedestrians": false,
          "Everywhere": false,
        },
        surat: ""),
  ];
  int index = 0;
  int score = 0;

  bool isPressed = false;
  bool isAlreadySelected = false;

  void nextQuestion() {
    if (index == question.length - 1) {
      showDialog(
          context: context,
          builder: (ctx) => ResulBox(
                lengthQuestion: question.length,
                result: score,
                onPressed: startOver,
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please select any option"),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(vertical: 20.0),
          ),
        );
      }
    }
  }

  void checkAnswerAndUpdate(volue) {
    if (isAlreadySelected) {
      return;
    } else {
      if (volue == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
        score;
      });
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Container(
          margin: const EdgeInsets.only(right: 20),
          child: const Text(
            "Test",
            style: TextStyle(color: Colors.white, fontSize: 36),
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(left: 6),
            width: 150,
            height: 80,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Score:$score",
                softWrap: false,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: neytral),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: background,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(
          children: [
            QuestionWidget(
                sorag: question[index].sorag,
                indexAction: index,
                totalQuestion: question.length),
            const Divider(
              color: neytral,
            ),
            question[index].surat == ""
                ? SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: Column(
                      children: [
                        for (int i = 0;
                            i < question[index].jogaplar.length;
                            i++)
                          GestureDetector(
                            onTap: () => checkAnswerAndUpdate(
                                question[index].jogaplar.values.toList()[i]),
                            child: JCard(
                              jogap: question[index].jogaplar.keys.toList()[i],
                              color: isPressed
                                  ? question[index]
                                              .jogaplar
                                              .values
                                              .toList()[i] ==
                                          true
                                      ? dogry
                                      : yalnysh
                                  : neytral,
                            ),
                          ),
                      ],
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Column(
                          children: [
                            for (int i = 0;
                                i < question[index].jogaplar.length;
                                i++)
                              GestureDetector(
                                onTap: () => checkAnswerAndUpdate(
                                    question[index]
                                        .jogaplar
                                        .values
                                        .toList()[i]),
                                child: JCard(
                                  jogap:
                                      question[index].jogaplar.keys.toList()[i],
                                  color: isPressed
                                      ? question[index]
                                                  .jogaplar
                                                  .values
                                                  .toList()[i] ==
                                              true
                                          ? dogry
                                          : yalnysh
                                      : neytral,
                                ),
                              ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(question[index].surat),
                          ),
                        ),
                      ),
                    ],
                  ),
            const SizedBox(
              height: 60,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: nextQuestion,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: const Text(
                    "Next",
                    style: TextStyle(fontSize: 26),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: const Padding(
      //   padding: EdgeInsets.all(88.0),
      //   child: NextButton(
      //     nextQuestion:nextQuestion,
      //   ),
      // ),
      // floatingActionButton: CircleAvatar(
      //   child: TextButton(
      //     onPressed: () {
      //       print(question[index].surat);
      //     },
      //     child: Text('+'),
      //   ),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
