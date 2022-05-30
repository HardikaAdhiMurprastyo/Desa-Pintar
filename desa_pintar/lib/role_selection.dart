import 'package:flutter/material.dart';
import 'dart:math' as math;

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({Key? key}) : super(key: key);
  static const routeName = '/rolePage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
          builder: (context, constraints) => Stack(
          children: <Widget>[
            Positioned(
              left: -constraints.maxWidth * .3,
              bottom: constraints.maxHeight * .80,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Image.asset(
                  'assets/bubble2.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 100),
                  child: Image.asset('assets/logo.png'),
                ),
                const Text(
                  "Welcome to D'PIN",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Choose your role",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .50,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor:
                              const Color.fromARGB(255, 61, 192, 150),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Warga',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .50,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor:
                              const Color.fromARGB(255, 61, 192, 150),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'RT',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .50,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor:
                              const Color.fromARGB(255, 61, 192, 150),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'RW',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .50,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor:
                              const Color.fromARGB(255, 61, 192, 150),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Kelurahan',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              // left: -constraints.maxWidth * .1,
              right: -constraints.maxWidth * .31,

              top: constraints.maxHeight * .80,

              child: Transform.rotate(
                angle: - math.pi / 1,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Image.asset(
                    'assets/bubble2.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
        ],
          ),
        ),
      ),
    );
  }
}
