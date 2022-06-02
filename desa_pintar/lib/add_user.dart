import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewUser extends StatefulWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  List<String> gender = ['Pria', 'Wanita'];
  String? selectedItem1 = 'Jenis Kelamin';

  List<String> Perkawinan = ['Sudah', 'Belum Menikah'];
  String? selectedItem2 = 'Status Perkawinan';

  List<String> Agama = [
    'Islam',
    'Kristen',
    'Katolik',
    'Hindu',
    'Budha',
    'Konghucu'
  ];
  String? selectedItem3 = 'Agama';

  String? selectedItem4 = 'Status Perkawinan';

  List<String> Pendidikan = ['SD', 'SMP', 'SMA', 'S1', 'S2', 'S3'];
  String? selectedItem5 = 'Pendidikan Terakhir';
  @override
  Widget build(BuildContext context) {
    // bool _isObscure1 = true;
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
          title: const Text('Form Pengisian User Baru'),
        ),
        body: SingleChildScrollView(
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromARGB(255, 227, 227, 227),
                ),
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                    top: 20, right: 20, left: 20, bottom: 30),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      width: 312,
                      child: const TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
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
                          labelText: 'Nama Lengkap',
                          hintMaxLines: 1,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 312,
                      child: const TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
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
                          labelText: 'Tempat/Tanggal Lahir',
                          hintMaxLines: 1,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 312,
                      child: DropdownButtonFormField<String>(
                        hint: Text('Jenis Kelamin'),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(15.0),
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
                        ),
                        items: gender
                            .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                )))
                            .toList(),
                        onChanged: (item) =>
                            setState(() => selectedItem1 = item),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 312,
                      child: DropdownButtonFormField<String>(
                        hint: Text('Status Perkawinan'),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(15.0),
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
                        ),
                        items:
                            Perkawinan.map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                ))).toList(),
                        onChanged: (item) =>
                            setState(() => selectedItem2 = item),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 312,
                      child: DropdownButtonFormField<String>(
                        hint: Text('Agama'),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(15.0),
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
                        ),
                        items: Agama.map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                            ))).toList(),
                        onChanged: (item) =>
                            setState(() => selectedItem3 = item),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 312,
                      child: DropdownButtonFormField<String>(
                        hint: Text('Pendidikan'),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(15.0),
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
                        ),
                        items:
                            Pendidikan.map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                ))).toList(),
                        onChanged: (item) =>
                            setState(() => selectedItem5 = item),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 312,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(16),
                        ],
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
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
                    Container(
                      width: 312,
                      height: maxLines * 24.0,
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        maxLines: maxLines,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
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
                          labelText: 'Alamat Lengkap',
                        ),
                      ),
                    ),
                    Container(
                      width: 312,
                      child: const TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
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
                          labelText: 'Password',
                          hintMaxLines: 1,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Kirim'),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 61, 192, 150),
                          textStyle: TextStyle(
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
            ],
          ),
        ));
  }
}
