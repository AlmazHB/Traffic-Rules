import 'package:flutter/material.dart';
import 'package:test/data/constants/colors.dart';
import 'package:test/models/models.dart';
import 'package:test/widgets/widgets.dart';


class SuratSayla extends StatefulWidget {
  const SuratSayla({super.key});

  @override
  State<SuratSayla> createState() => _SuratSaylaState();
}

class _SuratSaylaState extends State<SuratSayla> {
  List<ImageQeustion> question = [
    ImageQeustion(id: "1", sorag: "Find the “Children” sign", suratlar: {
      "assets/images/game/stop.png": false,
      "assets/images/game/ch.png": true,
      "assets/images/game/haywan.png": false,
    }),
    ImageQeustion(id: "2", sorag: "Find the “Stop” sign", suratlar: {
      "assets/images/game/ch.png": false,
      "assets/images/game/haywan.png": false,
      "assets/images/game/stop.png": true,
    }),
  ];

  int index = 0;
  int score = 0;
  double opacity = 0.0;
  double imageOpacity = 1.0;
  bool checked = false;
  bool isAlreadySelected = false;
  
  void nextQuestion() {
    if (index == question.length - 1) {
      showDialog(context: context, builder: (ctx) => ResulBox(lengthQuestion: question.length,result: score,onPressed: startOver,));
    } else {
      if (checked) {
        setState(() {
          index++;
          checked = false;
          isAlreadySelected = false;
          opacity = 0.0;
          imageOpacity = 1.0;
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
    }else{
      if (volue == true) {
      score++;
    }
    setState(() {
      checked = true;
      isAlreadySelected = true;
      opacity = 1.0;
      imageOpacity = 0.5;
      score;
    });
    }
  }

  void startOver(){
    setState(() {
      index=0;
      score=0;
      checked=false;
      isAlreadySelected=false;
      opacity=0;
      imageOpacity=1;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Text(
              "Score:$score",
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          )
        ],
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
          'Select the correct answer',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 100,
        child: Column(
          children: [
            const Center(
              child: Text(
                'Let’s play a game',
                style: TextStyle(color: Colors.white, fontSize: 66),
              ),
            ),
            Center(
              child: Text(
                question[index].sorag,
                style: const TextStyle(color: Colors.white, fontSize: 36),
              ),
            ),
            const SizedBox(height: 25,),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Container(
                  //   width: MediaQuery.of(context).size.width/3,
                  //   height: MediaQuery.of(context).size.height/3,
                  //   decoration: const BoxDecoration(
                  //     image: DecorationImage(
                  //       image: AssetImage("assets/images/game/stop.png"),
                  //     ),
                  //   ),
                  // ),
                  for (int i = 0; i < question[index].suratlar.length; i++)
                    GestureDetector(
                      onTap: () => checkAnswerAndUpdate(
                          question[index].suratlar.values.toList()[i]),
                      child: ImageCard(
                        assetImage: question[index].suratlar.keys.toList()[i],
                        volume: question[index].suratlar.values.toList()[i],
                        opacity: opacity,
                        imageOpacity: imageOpacity,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 50,),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: nextQuestion,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: const Text(
                    "Next",
                    style: TextStyle(fontSize: 26),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
