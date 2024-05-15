import 'package:flutter/material.dart';


class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color.fromARGB(255, 87, 181, 202),
      appBar: AppBar(
        elevation: 30,
        backgroundColor: const Color.fromARGB(255, 87, 181, 202),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('About us ',style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
      ), body: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage('assets/images/about.png'))),
        // child: Center(child: Text("Text textbjskcnsalma;sa,;aac;s,c;'scs ckscmsalckascm\nnewnuwqdwiqwqidjwqijdwqojdwiqindiwqndj xhjqwx qja",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),),
      ));
  }
}