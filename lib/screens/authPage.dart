import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notely/screens/premiun_screen.dart';
import 'package:notely/screens/signup_page.dart';
import 'package:notely/service/firebase_service_auth.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder(
        stream: auth.authstateChange(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data as User?;
            if (user == null) {
              return SignUpPage();
            }
            return const PremiumPage();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
