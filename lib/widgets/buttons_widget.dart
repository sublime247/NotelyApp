import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons(
      {required this.buttontext, required this.secondbutton,  this.onpressed, Key? key})
      : super(key: key);
  final String buttontext;
  final String secondbutton;
  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 24),
              primary: const Color(0xFFD9614C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(12),
              ),
              elevation: 0),
          onPressed: onpressed,
          child: Text(
            buttontext,
            style: const TextStyle(
                color: Color(0xFFFFFBFA),
                fontFamily: 'Nunito',
                fontSize: 25,
                fontWeight: FontWeight.w800),
          ),
        ),
        TextButton(
            onPressed: onpressed,
            child: Text(secondbutton,
                style: const TextStyle(
                    color: Color(0xFFD9614C),
                    fontFamily: 'Nunito',
                    fontSize: 20,
                    fontWeight: FontWeight.w800)))
      ],
    );
  }
}
