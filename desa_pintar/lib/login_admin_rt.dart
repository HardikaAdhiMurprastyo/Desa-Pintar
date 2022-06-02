
import 'package:desa_pintar/widget/dropdown.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
          builder: (context, constraints) => Stack(
            children: [
              Positioned(
                left: -constraints.maxWidth * .3,
                bottom: constraints.maxHeight * .80,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Image.asset(
                    'assets/bubble2.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SafeArea(
                  child: Padding(
                padding: EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    Container(
                        child: Center(child: Image.asset('assets/ilust2.png'))),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 25),
                      child: const Text(
                        'Login Admin',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                        child: TextField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 61, 192, 150))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 61, 192, 150))),
                            labelText: 'Email',
                            hintMaxLines: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                        child: TextField(
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: const Color.fromARGB(255, 61, 192, 150))),
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 61, 192, 150))),
                            labelText: 'Password',
                            hintMaxLines: 1,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color.fromARGB(255, 61, 192, 150),
                              ),
                              onPressed: () {
                                setState(
                                  () {
                                    _isObscure = !_isObscure;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Dropdown(),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Login'),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 61, 192, 150),
                          textStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          fixedSize: const Size(310, 45),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ],
                ),
              )),
              Positioned(
                // left: -constraints.maxWidth * .1,
                right: -constraints.maxWidth * .31,

                top: constraints.maxHeight * .86,

                child: Transform.rotate(
                  angle: -math.pi / 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
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