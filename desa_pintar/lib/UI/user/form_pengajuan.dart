import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FormPengajuan extends StatefulWidget {
  const FormPengajuan({Key? key}) : super(key: key);

  @override
  State<FormPengajuan> createState() => _FormPengajuanState();
}

class _FormPengajuanState extends State<FormPengajuan> {
  List _get = [];

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          //you have to take the ip address of your computer.
          //because using localhost will cause an error
          "http://192.168.1.10/dpin_database/get_data_user.php"));

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
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    const maxLines = 5;
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
          title: const Text('Form Surat Pengajuan SKCK'),
        ),
        body: 
        _get.length != 0
        ? ListView.builder(
          itemCount: _get.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    alignment: Alignment.center,
                    child: const Text(
                      'Silahkan isi data form berikut ini sesuai dengan\n e-KTP ataupun KK',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromARGB(255, 227, 227, 227),
                    ),
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(
                        top: 20, right: 20, left: 20, bottom: 20),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          width: 312,
                          child: TextFormField(
                            readOnly: true,
                            initialValue: '${_get[index]['nama']}',
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 61, 192, 150))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 61, 192, 150))),
                              labelText: 'Nama Lengkap',
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
                            readOnly: true,
                            initialValue: '${_get[index]['tempat_lahir']}/${_get[index]['tanggal_lahir']}',
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 61, 192, 150))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 61, 192, 150))),
                              labelText: 'Tempat/Tanggal Lahir',
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
                            readOnly: true,
                            initialValue: '${_get[index]['jenis_kelamin']}',
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 61, 192, 150))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 61, 192, 150))),
                              labelText: 'Jenis Kelamin',
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
                            readOnly: true,
                            initialValue: '${_get[index]['NIK']}',
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 61, 192, 150))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 61, 192, 150))),
                              labelText: 'NIK/No.KTP',
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
                            readOnly: true,
                            initialValue: '${_get[index]['agama']}',
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 61, 192, 150))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 61, 192, 150))),
                              labelText: 'Agama',
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
                            readOnly: true,
                            initialValue: "Mahasiswa",
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 61, 192, 150))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 61, 192, 150))),
                              labelText: 'Pekerjaan',
                              hintMaxLines: 1,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: 312,
                          height: maxLines * 24.0,
                          margin: EdgeInsets.all(10),
                          child: TextFormField(
                            readOnly: true,
                            initialValue: '${_get[index]['alamat']}',
                            maxLines: maxLines,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 61, 192, 150))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 61, 192, 150))),
                              labelText: 'Alamat',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: const Text(
                      "Dengan klik tombol ajukan, saya dengan \ndata diri diatas mengajukan surat \nketerangan domisili",
                      style: TextStyle(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Ajukan'),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 61, 192, 150),
                        textStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        fixedSize: const Size(290, 45),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            );
          },
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
      );
    
  }
}
