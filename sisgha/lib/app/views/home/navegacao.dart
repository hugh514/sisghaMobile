import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sisgha/app/constants/Icones.dart';
import 'package:sisgha/app/constants/colors.dart';
import 'package:sisgha/app/views/calendario/calendario.dart';
import 'package:sisgha/app/views/home/home.dart';
import 'package:sisgha/app/views/perfil/perfil.dart';

class Navigation extends StatefulWidget {
  final int initialIndex;

  const Navigation({Key? key, required this.initialIndex}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(_selectedIndex),
      bottomNavigationBar: BottomAppBar(
        color: ColorApp.VerdeEscuro,
        child: SizedBox(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildIconButton(Icones.Home, 0),
              _buildIconButton(Icones.Person, 1),
              _buildIconButton(Icones.Calendar, 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const Center(
          child: Home(),
        );
      case 1:
        return const Center(
          child: Perfil(),
        );
      case 2:
        return const Center(
          child: Calendar(),
        );
      default:
        return Container();
    }
  }

  Widget _buildIconButton(String icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Colors.white : null,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 80,
        height: 45,
        child: Iconify(
          icon,
          size: 35.0,
          color: _selectedIndex == index ? ColorApp.VerdeEscuro : Colors.white,
        ),
      ),
    );
  }
}
