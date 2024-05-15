// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:test/data/constants/colors.dart';

class JCard extends StatelessWidget {
   const JCard({super.key, required this.jogap, required this.color,});
  final String jogap ;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.only(bottom: 12),
        width: double.infinity,
        decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(12)),
        child: Text(
          jogap,style: TextStyle(fontSize: 26,color: color.red!=color.green ? neytral:Colors.black),
        ),
      ),
    );
  }
}