import 'package:flutter/material.dart';
import 'package:notely/screens/create_note.dart';
import 'package:notely/screens/notes_created.dart';
import 'package:notely/screens/profile.dart';
import 'package:notely/screens/signup_page.dart';

import '../widgets/buttons_widget.dart';

class CreateNoteLandingPage extends StatelessWidget {
  const CreateNoteLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8EEE2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage())),
                    child: const Icon(
                      Icons.menu_open,
                      size: 30,
                    )),
                const Spacer(),
                const Text(
                  'All Notes',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                const Icon(Icons.search, size: 30),
              ],
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/comp.png',
                  height: 250,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Create Your First Note',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Add a note about anything (your thoughts on climate change, or your history essay) and share it with the world.',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
            Buttons(
              buttontext: 'Create A Note',
              secondbutton: 'Import Note',
              onpressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CreateNote()));
              },
            )
          ]),
        ),
      ),
    );
  }
}
