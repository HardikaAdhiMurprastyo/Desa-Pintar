import 'package:flutter/material.dart';
import 'user_login.dart';
// import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: UserLogin(),
      // initialRoute: SplashScreen.routeName,
      // routes: {
      //   SplashScreen.routeName: (context) => const SplashScreen(),
      // },
    );
  }
}