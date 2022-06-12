import 'package:flutter/material.dart';
import 'presentation/splash_screen.dart';
import 'package:desa_pintar/common/style.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
      primary: primaryColor,
      onPrimary: Colors.black,
      secondary: secondaryColor,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: myTextTheme,
    appBarTheme: const AppBarTheme(elevation: 0),
        ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
      },
    );
  }
}
