import 'package:flutter/material.dart';
import 'dart:math' as math;

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({Key? key}) : super(key: key);
  static const routeName = '/rolePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: userList(context));
  }

  Widget userList(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 61, 192, 150),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(360),
                  bottomLeft: Radius.circular(360))),
          height: MediaQuery.of(context).size.height * 0.22),

      //Above card
      Container(
        height: MediaQuery.of(context).size.height * .18,
        margin: const EdgeInsets.only(
          top: 110,
          right: 10,
          left: 10,
        ),
        child: Card(
          elevation: 2,
          shadowColor: Color.fromARGB(255, 61, 192, 145),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * .16,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 225, 253, 254),
                    border: Border.all(color: Color.fromARGB(255, 104, 243, 248), width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: FittedBox(
                      child:
                      Image.asset('assets/logo.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 5),
                    child: Text(
                      'Surat Pengajuan',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 5),
                    child: Text(
                      'Pengajuan: 31-12-2022',
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'Time: 16.30',
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left:MediaQuery.of(context).size.height * .26),
                    height: MediaQuery.of(context).size.height * .04,
                    width: MediaQuery.of(context).size.width * .13,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(183, 232, 162, 162),

                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'ditolak',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 223, 0, 0)
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: 0.0,
        left: 0.0,
        right: 0.0,
        child: AppBar(
          toolbarHeight: 90,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(180),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 61, 192, 150),
          elevation: 0.0,
          centerTitle: true,
          title: Text("RIWAYAT"),
        ),
      ),
    ]);
  }
}
