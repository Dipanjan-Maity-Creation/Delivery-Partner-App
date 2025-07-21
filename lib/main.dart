import 'package:flutter/material.dart';
import 'package:yaammy_delivery/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:yammygo/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase

  runApp(yaammy_delivery());
}

class yaammy_delivery extends StatelessWidget {
  const yaammy_delivery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yammygo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(),
    );
  }
}
