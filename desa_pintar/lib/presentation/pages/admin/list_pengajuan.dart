import 'package:desa_pintar/UI/admin/detail_surat_admin_acc.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListPengajuan extends StatefulWidget {
  const ListPengajuan({Key? key}) : super(key: key);

  @override
  State<ListPengajuan> createState() => _ListPengajuanState();
}

class _ListPengajuanState extends State<ListPengajuan> {
  List _get = [];

  @override
  void initState() {
    super.initState();
    //in first time, this method will be executed
    _getData();
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
        //you have to take the ip address of your computer.
        //because using localhost will cause an error
          "http://192.168.0.106/dpin/data_surat.php"));

      // if response successful
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // entry data to variabel list _get
        setState(() {
          _get = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

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
        margin: const EdgeInsets.only(
          top: 110,
        ),
        child: _get.length != 0
            ? ListView.builder(
            itemCount: _get.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .18,
                  margin: const EdgeInsets.only(
                    top: 10,
                    right: 10,
                    left: 10,
                  ),
                  child: Card(
                    elevation: 2,
                    shadowColor: Color.fromARGB(255, 61, 192, 145),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AccSurat(no_surat: _get[index]['no_surat'],),),);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * .16,
                              width: 130,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 225, 253, 254),
                                border: Border.all(
                                    color: Color.fromARGB(255, 104, 243, 248), width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                child: FittedBox(
                                  child:
                                  Image.asset('assets/assets_dpin/logo.png'),
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
                                  '${_get[index]['jenis_surat']}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0, left: 5),
                                child: Text(
                                  'Pengajuan: ${_get[index]['tanggal_surat']}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  'Time: ${_get[index]['waktu_pengajuan']}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  margin: EdgeInsets.only(left: MediaQuery
                                      .of(context)
                                      .size
                                      .height * .23),
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * .04,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * .13,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(92, 255, 238, 89),

                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${_get[index]['status_surat']}',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 255, 155, 89)
                                      ),
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
                ),
              );
            }
        ): Center(
          child: Text(
            "No Data Available",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Positioned(
        top: 0.0,
        left: 0.0,
        right: 0.0,
        child: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 90,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(180),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 61, 192, 150),
          elevation: 0.0,
          centerTitle: true,
          title: Text("LIST PENGAJUAN"),
        ),
      ),
    ]);
  }
}
