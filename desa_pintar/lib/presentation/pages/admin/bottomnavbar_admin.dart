import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'home_admin.dart';
import 'list_pengajuan.dart';
import 'arsip_admin.dart';
import 'detail_warga.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeAdminPage(),
    ListPengajuan(),
    ArsipAdmin(),
    DetailWarga(),
    // PengaturanAdmin(),
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
          child: Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GNav(
                    rippleColor: const Color.fromARGB(255, 61, 192, 150),
                    // hoverColor: Colors.transparent,
                    gap: 12,
                    activeColor: Colors.white,
                    // iconSize: 24,
                    padding: const EdgeInsets.all(10),
                    duration: const Duration(milliseconds: 400),
                    tabBackgroundColor: const Color.fromARGB(255, 133, 215, 185,),
                    color: Colors.white,
                    tabs: const[
                      GButton(
                        icon: Icons.home,
                        text: 'Beranda',
                      ),
                      GButton(
                        icon: Icons.mail,
                        text: 'Pengajuan',
                      ),
                      GButton(
                        icon: Icons.archive,
                        text: 'Arsip',
                      ),
                      GButton(
                        icon: Icons.person_add,
                        text: 'Daftar\nWarga',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

