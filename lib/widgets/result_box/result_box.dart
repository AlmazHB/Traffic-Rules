import 'package:flutter/material.dart';
import 'package:test/data/constants/colors.dart';

class ResulBox extends StatelessWidget {
  const ResulBox({Key? key, required this.result, required this.lengthQuestion, required this.onPressed})
      : super(key: key);
  final int result;
  final int lengthQuestion;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Result',
              style: TextStyle(
                  fontSize: 26, fontWeight: FontWeight.bold, color: neytral),
            ),
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
              backgroundColor: result == lengthQuestion / 2
                  ? Colors.yellow
                  : result < lengthQuestion / 2
                      ? yalnysh
                      : dogry,
              child: Text(
                '$result / $lengthQuestion',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              radius: 50,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              result == lengthQuestion / 2
                  ? "Almost There"
                  : result < lengthQuestion / 2
                      ? "Try again"
                      : "Great!",
              style: const TextStyle(color: neytral),
            ),
            const SizedBox(
              height: 25.0,
            ),
            GestureDetector(
              onTap: onPressed ,
              child: const Text(
                "Start Over",
                style: TextStyle(
                    color: Colors.blue, fontSize: 20, letterSpacing: 1.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
