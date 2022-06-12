import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FormPengajuan extends StatefulWidget {
  const FormPengajuan({Key? key}) : super(key: key);

  @override
  State<FormPengajuan> createState() => _FormPengajuanState();
}

class _FormPengajuanState extends State<FormPengajuan> {
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
          "http://192.168.0.106/dpin/data_warga.php"));

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

  // var level = '1';
  // var status = 'diajukan';
  // var jenis =
  // Future _onSubmit() async {
  //   try {
  //     return await http.post(
  //       Uri.parse("http://192.168.0.106/dpin/crud/create.php"),
  //       body: {
  //         "title": title.text,
  //         "content": content.text,
  //       },
  //     ).then((value) {
  //       //print message after insert to database
  //       //you can improve this message with alert dialog
  //       var data = jsonDecode(value.body);
  //       print(data["message"]);

  //       Navigator.of(context)
  //           .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final maxLines = 5;
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
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          ),
          title: const Text('Konfirmasi Data Diri'),
        ),
        body:
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                child: Text(
                  'Silahkan isi data form berikut ini sesuai dengan\n e-KTP ataupun KK',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              _get.length != 0
                  ?
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: _get.length,
                  itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color.fromARGB(255, 227, 227, 227),
                        ),
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                            top: 20,
                            right: 20,
                            left: 20,
                            bottom: 30
                        ),

                        child:Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              width: 312,
                              child: TextFormField(
                                // enabled: false,
                                readOnly: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(255, 61, 192, 150))),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(255, 61, 192, 150))),
                                  labelText: '${_get[index]['nama']}',
                                  hintMaxLines: 1,
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: 8,
                            // ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              width: 312,
                              child: TextFormField(
                                // enabled: false,
                                readOnly: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(255, 61, 192, 150))),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(255, 61, 192, 150))),
                                  labelText: '${_get[index]['tempat_lahir']}/${_get[index]['tanggal_lahir']}',
                                  hintMaxLines: 1,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              width: 312,
                              child: TextFormField(
                                // enabled: false,
                                readOnly: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(255, 61, 192, 150))),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(255, 61, 192, 150))),
                                  labelText: '${_get[index]['jenis_kelamin']}',
                                  hintMaxLines: 1,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              width: 312,
                              child: TextFormField(
                                // enabled: false,
                                readOnly: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(255, 61, 192, 150))),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(255, 61, 192, 150))),
                                  labelText: '${_get[index]['NIK']}',
                                  hintMaxLines: 1,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              width: 312,
                              child: TextFormField(
                                // enabled: false,
                                readOnly: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(255, 61, 192, 150))),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(255, 61, 192, 150))),
                                  labelText: '${_get[index]['agama']}',
                                  hintMaxLines: 1,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              width: 312,
                              child: TextFormField(
                                // enabled: false,
                                readOnly: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(255, 61, 192, 150))),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(255, 61, 192, 150))),
                                  labelText: '${_get[index]['Pekerjaan']}',
                                  hintMaxLines: 1,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              width: 312,
                              child: TextFormField(
                                // enabled: false,
                                readOnly: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(255, 61, 192, 150))),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(255, 61, 192, 150))),
                                  labelText: '${_get[index]['alamat']}',
                                  hintMaxLines: 1,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                          ],
                        ),
                      ),
                    ],
                  );
                }
              )
                  : Center(
                child: Text(
                  "No Data Available",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  
                },
                child: const Text('Ajukan'),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 61, 192, 150),
                    textStyle:
                    TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    fixedSize: const Size(290, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),

    );
  }
}
