import 'package:flutter/material.dart';
import 'dart:math' as math;

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);
  static const routeName = '/rolePage';

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children:[
                Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 61, 192, 150),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(360),
                      bottomRight: Radius.circular(360),

                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * .31,
                    padding: const EdgeInsets.only(
                      top: 60,
                      right: 30,
                      left: 30,
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/assets_dpin/logo.png'
                              ),
                              radius: 35,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0, left: 50),
                                child: Text(
                                  'data',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              child: InkWell(
                onTap: (){

                },
                child: ListTile(
                  leading: Icon(Icons.lock),
                  title: Text(
                    'Ubah Password',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.notifications_active),
                title: Text(
                  'Notifikasi',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      print(isSwitched);
                    });
                  },
                  activeTrackColor: Colors.lightGreenAccent,
                  activeColor: Colors.green,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Container(
                width: 150,
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
                    'KELUAR',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
