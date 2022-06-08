import 'package:flutter/material.dart';
import 'data_terkirim.dart' as data_terkirim;
import 'data_diterima.dart' as data_diterima;
import 'data_ditolak.dart' as data_ditolak;

class ArsipAdmin extends StatefulWidget {
  const ArsipAdmin({Key? key}) : super(key: key);

  @override
  State<ArsipAdmin> createState() => _ArsipAdminState();
}

class _ArsipAdminState extends State<ArsipAdmin>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 61, 192, 150),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Arsip',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        bottom: TabBar(
          labelColor: const Color.fromARGB(255, 61, 192, 150),
          indicator: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: Colors.white,
          ),
          unselectedLabelColor: Colors.white,
          controller: controller,
          tabs: const <Widget>[
            Tab(text: 'Terkirim'),
            Tab(text: 'Diterima'),
            Tab(text: 'Ditolak'),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          data_terkirim.DataTerkirim(),
          data_diterima.DataDiterima(),
          data_ditolak.DataDitolak(),
        ],
      ),
    );
  }
}