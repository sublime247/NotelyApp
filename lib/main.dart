import 'package:flutter/material.dart';
import 'package:notely/screens/get_started.dart';
import 'package:notely/screens/signup_page.dart';

void main() {
  runApp(const Notely());
}

class Notely extends StatelessWidget {
  const Notely({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notely',
      theme: ThemeData(
        backgroundColor:const Color(0xFFF8EEE2),
        scaffoldBackgroundColor: const Color(0xFFF8EEE2),
        fontFamily: 'Nunito'
      ),
      
      
      home:  GetStarted(),
    );
  }
}



  