import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notely/screens/premiun_screen.dart';
import 'package:notely/widgets/buttons_widget.dart';
import 'package:notely/widgets/user_input.dart';
import 'package:provider/provider.dart';
import '../service/firebase_service_auth.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController name = TextEditingController();

  String get _email => email.text;

  String get _password => password.text;
  bool submit = true;
  void _submit(context) async {
    setState(() {
      submit = false;
    });
    try {
      final authstateChange = Provider.of<AuthBase>(context, listen: false);
      await authstateChange.createAccountWithEmailandPassword(
          _email, _password);
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title:const Text('Input  Field can\'t Empty'),
              content: Text(e.toString()),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child:const Text('OK'))
              ],
            );
          });
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF8EEE2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(height: 30.0),
            const Center(
              child: Text(
                'NOTELY',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(children: [
                const Text(
                  'Create a free account',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Join Notely for free. Create and share unlimited notes with your friends.',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                FormInputField(
                    controller: name,
                    text: 'Full Name',
                    hintText: 'Salman Khan'),
                const SizedBox(
                  height: 20,
                ),
                FormInputField(
                    controller: email,
                    text: 'Email Address',
                    hintText: 'Ayoola@gmail.com'),
                const SizedBox(
                  height: 20,
                ),
                FormInputField(
                  controller: password,
                  text: 'Password',
                  hintText: '#####',
                ),
              ]),
            )),
            const SizedBox(
              height: 10,
            ),
            Buttons(
                buttontext: 'Create Account',
                secondbutton: 'Already have an account?',
                onpressed: () => _submit(context))
          ]),
        ),
      ),
    );
  }
}
