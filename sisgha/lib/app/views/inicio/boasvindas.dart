import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sisgha/app/views/home/navegacao.dart';
import 'package:sisgha/app/views/login/login.dart';

class BoasVindasPage extends StatefulWidget {
  const BoasVindasPage({super.key});

  @override
  State<BoasVindasPage> createState() => _BoasVindasPageState();
}

class _BoasVindasPageState extends State<BoasVindasPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      const CircularProgressIndicator();
      verificarToken().then((value) {
        if (value) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Navigation(
                  initialIndex: 0,
                ),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const PaginaLogin(),
              ));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<bool> verificarToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      return false;
    } else {
      return true;
    }
  }
}