import 'package:desa_pintar/presentation/pages/admin/list_pengajuan.dart';
import 'package:desa_pintar/presentation/pages/user/form_pengajuan.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ListSurat extends StatefulWidget {
  const ListSurat({Key? key}) : super(key: key);
  static const routeName = '/rolePage';

  @override
  State<ListSurat> createState() => _ListSuratState();
}

class _ListSuratState extends State<ListSurat> {
  bool isSwitched = false;
  Widget build(BuildContext context) {
    return Scaffold(body: setUserForm());
  }

  Widget setUserForm() {
    return Stack(children: <Widget>[
      Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 61, 192, 150),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(360),
                  bottomLeft: Radius.circular(360))),
          height: MediaQuery.of(context).size.height * 0.2),

      //Above card
      Container(
        height: MediaQuery.of(context).size.height * .31,
        margin: const EdgeInsets.only(
          top: 145,
          right: 10,
          left: 10,
        ),
        child: Column(
          children: [
            Card(
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => FormPengajuan()));
                },
                child: const ListTile(
                  title: Text(
                    'Surat Surat Keterangan Domisili',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            SizedBox(
            height: 10,
          ),
            Card(
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => FormPengajuan()));
                },
                child: const ListTile(
                  title: Text(
                    'Surat Penghantar Kartu Keluarga',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
          ],
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
          title: Text("Pengajuan"),
        ),
      ),
    ]);
  }
}
