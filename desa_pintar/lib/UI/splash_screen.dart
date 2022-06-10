import 'dart:async';
import 'package:desa_pintar/UI/role_selection.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/splashscreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

 startSplashScreen() async{
    var duration = const Duration(seconds: 3);
    return Timer(duration, (){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const RoleSelectionPage(),
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Stack(
              children: [
                Center(
                  child: 
                  Container(
                    child: Image.asset(
                      'assets/assets_dpin/backLogo.png',
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 40),
                    child: Image.asset(
                      'assets/assets_dpin/logo.png',
                    ),
                  ),
                ),
                
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: const Text(
                "D'PIN",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: const Text(
                "Desa Pintar",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
             const SizedBox(
              height: 250,
            ),
            Container(
              child: Text("Powered by"),
            ),
            Container(
              child: Text("Begajulan"),
            ),
          ],
        ),
        
      ),
    );
  }
}
