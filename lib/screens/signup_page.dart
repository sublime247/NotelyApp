import 'package:flutter/material.dart';
import 'package:notely/screens/premiun_screen.dart';
import 'package:notely/widgets/buttons_widget.dart';
import 'package:notely/widgets/user_input.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
                FormInputField(text: 'Full Name', hintText: 'Salman Khan'),
                const SizedBox(
                  height: 20,
                ),
                FormInputField(
                    text: 'Email Address', hintText: 'Ayoola@gmail.com'),
                const SizedBox(
                  height: 20,
                ),
                FormInputField(
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
              onpressed: () {
               Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PremiumPage()));
              },
            )
          ]),
        ),
      ),
    );
  }
}
