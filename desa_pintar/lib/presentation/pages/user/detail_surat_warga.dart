import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailSuratWarga extends StatefulWidget {

  DetailSuratWarga({Key? key, required this.no_surat}) : super(key: key);
  String no_surat;
  @override
  State<DetailSuratWarga> createState() => _DetailSuratWargaState();
}

class _DetailSuratWargaState extends State<DetailSuratWarga> {
  final _formKey = GlobalKey<FormState>();

  //inisialize field
  var no_surat = TextEditingController();
  var tanggal_surat = TextEditingController();
  var perihal = TextEditingController();
  var ttd = TextEditingController();

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
          "http://192.168.0.106/dpin/detail_surat.php?no_surat='${widget.no_surat}'"));

      // if response successful
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // entry data to variabel list _get
        setState(() {
          no_surat = TextEditingController(text: data['no_surat']);
          tanggal_surat = TextEditingController(text: data['tanggal_surat']);
          perihal = TextEditingController(text: data['jenis_surat']);
          ttd = TextEditingController(text: data['level']);
        });
      }
    } catch (e) {
      print(e);
    }
  }

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
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ),
        title: const Text('Detail Surat'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(10),
                  child: const Text(
                    'Info Surat',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    margin: const EdgeInsets.only(
                      // left: 10,
                      right: 10,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 1,
                                child: const Text(
                                  'Nomor Surat',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'KeteranganDomisili  /',
                                    style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 40,
                                child: TextFormField(
                                  readOnly: true,
                                  controller: no_surat,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Note Title is Required!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: const Text(
                                  '/ 06 / 2022',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Text(
                                  'Tanggal Surat',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: TextFormField(
                                  readOnly: true,
                                  controller: tanggal_surat,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Note Title is Required!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex:1,
                                child: Text(
                                  'Perihal',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: TextFormField(
                                  readOnly: true,
                                  controller: perihal,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Note Title is Required!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Text(
                                  'Penandatangan',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: TextFormField(
                                  readOnly: true,
                                  initialValue:'Ketua RT, Ketua RW ',
                                  // controller: perihal,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Note Title is Required!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Text(
                                  'Asal Surat',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: TextFormField(
                                  readOnly: true,
                                  initialValue:'Baiq Tasya',
                                  // controller: perihal,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Note Title is Required!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            height: 10,
            color: Color.fromARGB(255, 207, 206, 206),
            thickness: 2,
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(
                      top: 10, left: 10, right: 10, bottom: 1),
                  child: const Text(
                    'Detail Surat',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Container(
                  color: const Color.fromARGB(255, 226, 246, 239),
                  margin: EdgeInsets.all(10),
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {},
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/assets_dpin/logo.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Surat Pengantar SKCK',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          '1 page',
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          '345 KB',
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],),);
  }
}
