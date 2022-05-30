import 'package:flutter/material.dart';

class PasswordSettingPage extends StatefulWidget {
  const PasswordSettingPage({Key? key}) : super(key: key);
  static const routeName = '/rolePage';

  @override
  State<PasswordSettingPage> createState() => _PasswordSettingPageState();
}


class _PasswordSettingPageState extends State<PasswordSettingPage> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 61, 192, 150),
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_outlined,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 25,
              ),
            ),
          ),
        ),
        title: const Text('Pengaturan Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: [
              TextField(
                obscureText: _isObscure,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15),
                    ),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 61, 192, 150),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15),
                    ),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 61, 192, 150),
                    ),
                  ),
                  labelText: 'Masukkan Pass Lama',
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                    color: const Color.fromARGB(255, 61, 192, 150),),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      },
                      );
                    },
                  ),
                ),
              ),
             const SizedBox(
               height: 15,
             ),
              TextField(
                obscureText: _isObscure,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15),
                    ),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 61, 192, 150),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15),
                    ),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 61, 192, 150),
                    ),
                  ),
                  labelText: 'Masukkan Pass Baru',
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                        color: const Color.fromARGB(255, 61, 192, 150),
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: _isObscure,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15),
                    ),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 61, 192, 150),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15),
                    ),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 61, 192, 150),
                    ),
                  ),
                  labelText: 'Konfirmasi Password Baru',
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                        color: const Color.fromARGB(255, 61, 192, 150),
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .90,
                height: MediaQuery.of(context).size.height * .07,
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
                    'Simpan',
                    style: TextStyle(
                        color: Colors.white,
                      fontSize: 14
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
