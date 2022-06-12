import 'package:flutter/material.dart';

class ListPengajuan extends StatefulWidget {
  const ListPengajuan({Key? key}) : super(key: key);

  @override
  State<ListPengajuan> createState() => _ListPengajuanState();
}

class _ListPengajuanState extends State<ListPengajuan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Pengajuan'),
      ),
    );
  }
}