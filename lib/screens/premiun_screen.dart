import 'package:flutter/material.dart';
import 'package:notely/screens/landing_create_notepage.dart';
import 'package:notely/widgets/premium_plan.dart';

import '../widgets/buttons_widget.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF8EEE2),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                const Spacer(),
                const Text('Notely Premium',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 30,
                      color: Color(0xFFF403B36),
                    ))
              ],
            ),
            Expanded(
              // flex: 1,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/premiumImage.png',
                      height: 150,
                    ),
                    const Text(
                      'Start Using Notely with Premium Benefits',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: const [
                            Icon(
                              Icons.check,
                              size: 20,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Icon(Icons.check, size: 20),
                            SizedBox(
                              height: 10,
                            ),
                            Icon(Icons.check, size: 20)
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Save unlimited notes to a single project'),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Create unlimited projects and teams'),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Daily backups to keep your data safe')
                          ],
                        ),
                      ],
                    ),
                  const PremiumPlan(),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Buttons(
                buttontext: 'SUBSCRIBE',
                secondbutton: 'Restore Purchase',
                onpressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateNoteLandingPage()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
