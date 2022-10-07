

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:notely/screens/create_note.dart';
import 'package:notely/screens/get_started.dart';
import 'package:notely/service/database.dart';
import 'package:notely/service/firebase_service_auth.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
     MultiProvider(
        providers: [
          Provider(create: (context)=>DataBase),
          Provider<AuthBase>(
      create: (context) => Auth()),
      
        ],
        child: MaterialApp(
            title: 'Notely',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                backgroundColor: const Color(0xFFF8EEE2),
                scaffoldBackgroundColor: const Color(0xFFF8EEE2),
                fontFamily: 'Nunito'),
            home: GetStarted()),
      ));
}
