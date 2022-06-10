import 'package:desa_pintar/UI/role_selection.dart';
import 'package:desa_pintar/widget/dropdown.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

import '../user/bottom_user.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  bool _isObscure = true;
  late String nik, password;
  String alert = "Ready for Login";
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  void _login() async {
    final response = await http.post(
        Uri.parse("http://192.168.1.10/dpin_database/login_warga.php"),
        body: {
          "NIK": user.text,
          "password": pass.text,
        });
    var datauser = await json.decode(response.body);
    if (datauser.length < 1) {
      setState(() {
        alert = "You can't login";
      });
    } else {
      // setState(() {
      //   nik = datauser[0]['NIK'];
      //   // pass = datauser[0]['password'].toString() as TextEditingController;
      // });
      if (datauser[0]['NIK'] == user.text &&
          datauser[0]['password'] == pass.text) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BottomUser()),
        );
      } else if (user.text == null && pass.text == null) {
        setState(() {
          alert = "Masukan NIK dan Password!";
        });
      } else if (datauser[0]['NIK'] != user.text &&
          datauser[0]['password'] != pass.text) {
        setState(() {
          alert = "NIK dan Password salah";
        });
      } else {
        setState(() {
          alert = "Account not register";
        });
      }
    }
  }

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
                    'assets/assets_dpin/bubble2.png',
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
                        child: Center(
                            child:
                                Image.asset('assets/assets_dpin/ilust1.png'))),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 25),
                      child: const Text(
                        'Login User',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                        child: TextField(
                          controller: user,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            // FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(16),
                          ],
                          decoration: const InputDecoration(
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
                            labelText: 'NIK',
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
                          controller: pass,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 61, 192, 150))),
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
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _login();
                      },
                      child: const Text('Login'),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 61, 192, 150),
                          textStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          fixedSize: const Size(310, 45),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Choose a Role',
                            style: TextStyle(
                              fontSize: 14,
                              // fontWeight: FontWeight.w200,
                              color:  Color.fromARGB(255, 61, 192, 150),
                              // decoration: TextDecoration.underline
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RoleSelectionPage()),
                        );
                      },
                    )
                  ],
                ),
              )),
              Positioned(
                right: -constraints.maxWidth * .31,
                top: constraints.maxHeight * .80,
                child: Transform.rotate(
                  angle: -math.pi / 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: Image.asset(
                      'assets/assets_dpin/bubble2.png',
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
