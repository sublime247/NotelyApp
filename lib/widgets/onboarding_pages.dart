import 'package:flutter/material.dart';

class OnboardingPages extends StatelessWidget {
  const OnboardingPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/notelyImg.png', height: 200),
        const SizedBox(
          height: 28,
        ),
        const Text('World’s Safest And Largest Digital Notebook', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Nunito', 
                     fontSize: 25, fontWeight: FontWeight.w700),),
        const SizedBox(
          height: 12,
        ),
        const Text(
          'Notely is the world’s safest, largest and intelligent digital notebook. Join over 10M+ users already using Notely.',
          textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Nunito', 
                     fontSize: 20, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
