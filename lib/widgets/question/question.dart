import 'package:flutter/material.dart';
import 'package:test/data/constants/colors.dart';

class QuestionWidget extends StatelessWidget {
 const QuestionWidget({Key? key, required this.sorag, required this.indexAction, required this.totalQuestion}) : super(key: key);
  final String sorag;
  final int indexAction;
  final int totalQuestion;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child:  Text(
        'Test ${indexAction+1}/$totalQuestion: $sorag',
        style: const TextStyle(
          fontSize: 48,
          color: neytral,
        ),
      ),
    );
  }
}