import 'package:flutter/material.dart';

class FormInputField extends StatelessWidget {
  const FormInputField({required this.text, required this.hintText, required this.controller});
  final String text;
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(text, style:const TextStyle(fontFamily: 'Nunito', 
         fontSize: 16, fontWeight: FontWeight.w500),),
         const  SizedBox(height: 10,),
          TextField(
            controller:  controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                  const  EdgeInsets.symmetric(vertical: 18, horizontal: 10),
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
