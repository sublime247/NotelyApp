import 'package:flutter/material.dart';
import 'package:notely/screens/signup_page.dart';
import 'package:notely/widgets/buttons_widget.dart';
import 'package:notely/widgets/onboarding_pages.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GetStarted extends StatelessWidget {
  GetStarted({Key? key}) : super(key: key);
  final controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8EEE2),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 34,
            ),
            const Center(
                child: Text(
              'NOTELY',
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            )),
            const SizedBox(
              height: 50,
            ),
            Expanded(
                child: PageView(controller: controller, children: const [
              OnboardingPages(),
              OnboardingPages(),
              OnboardingPages(),
            ])),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: ScrollingDotsEffect(
                  spacing: 4,
                  radius: 8,
                  dotColor: const Color(0xFFD9614C).withOpacity(0.5),
                  activeDotColor: const Color(0xFFD9614C),
                  dotHeight: 8,
                  dotWidth: 8),
            ),
            const SizedBox(
              height: 40,
            ),
            Buttons(
              buttontext: 'Get Started',
              secondbutton: 'Already have an account',
              onpressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpPage()));
              },
            )
          ],
        ),
      )),
    );
  }
}
