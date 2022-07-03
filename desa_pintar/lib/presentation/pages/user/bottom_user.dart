import 'package:desa_pintar/data/provider/berita_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import '../../../data/api/api_service.dart';
import '../../setting.dart';
import '../user/home_user.dart';
import '../user/list_surat.dart';
import '../user/riwayat.dart';
//import halaman belum

class BottomUser extends StatefulWidget {
  const BottomUser({Key? key}) : super(key: key);

  @override
  State<BottomUser> createState() => _BottomUserState();
}

class _BottomUserState extends State<BottomUser> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    ChangeNotifierProvider<BeritaProvider>(
      create: (_) => BeritaProvider(apiService: ApiService()),
      child: const HomeUser(),
    ),
    const ListSurat(),
    const RiwayatPage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 61, 192, 150),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GNav(
              iconSize: MediaQuery.of(context).size.width / 13,
              rippleColor: const Color.fromARGB(255, 61, 192, 150),
              // hoverColor: Colors.transparent,
              gap: 12,
              activeColor: Colors.white,
              // iconSize: 24,
              padding: const EdgeInsets.all(10),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: const Color.fromARGB(
                255,
                133,
                215,
                185,
              ),
              color: Colors.white,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Beranda',
                ),
                GButton(
                  icon: Icons.mail,
                  text: 'Pengajuan',
                ),
                GButton(
                  icon: Icons.list_alt_outlined,
                  text: 'Riwayat',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Pengaturan',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
