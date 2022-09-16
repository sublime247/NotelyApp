import 'package:flutter/material.dart';

class FormInputField extends StatelessWidget {
 FormInputField({required this.text, required this.hintText});
  final String text;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(text, style:const TextStyle(fontFamily: 'Nunito', 
         fontSize: 16, fontWeight: FontWeight.w500),),
         const  SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                  const  EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                filled: true,
                hintText: hintText,
                fillColor:const Color(0xFFFFFDFA),
                enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFFF2E5D5), width: 1))),
          )
        ]);
  }
}
