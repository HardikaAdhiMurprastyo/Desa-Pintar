import 'package:flutter/material.dart';

class DataDitolak extends StatelessWidget {
  const DataDitolak({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: userList(context));
  }

  Widget userList(BuildContext context) {
    return Stack(children: <Widget>[
      //Above card
      InkWell(
        onTap: () {},
        child: Container(
          height: MediaQuery.of(context).size.height * .18,
          margin: const EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
          ),
          child: Card(
            color: const Color.fromARGB(255, 225, 246, 239),
            elevation: 2,
            shadowColor: const Color.fromARGB(255, 61, 192, 145),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * .16,
                    width: 130,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 225, 253, 254),
                      border: Border.all(
                          color: const Color.fromARGB(255, 104, 243, 248),
                          width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.network('https://bit.ly/3NNuOjS'),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 5),
                      child: Text(
                        'Surat Permohonan',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 5),
                      child: Text(
                        'Pengajuan: 31-12-2022',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        'Time: 16.30',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
