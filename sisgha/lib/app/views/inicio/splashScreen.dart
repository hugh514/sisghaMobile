import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sisgha/app/constants/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:sisgha/app/constants/tamanhoTela.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  bool temporizador = false;
  bool temporizador2 = false;

  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 2200), () {
      setState(() {
        temporizador = true;
      });
      Timer(Duration(seconds: 2), () {
        setState(() {
          temporizador2 = true;
        });
      });
    });

    Future.delayed(const Duration(milliseconds: 5210), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/bemvindo',
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 50,
              right: 50,
              bottom: 150,
              child: Lottie.asset(
                'assets/img/animacao_logo.json',
              )),
          Positioned(
            top: 0,
            left: 0,
            child: AnimatedContainer(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [ColorApp.VerdeClaro, ColorApp.VerdeEscuro],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(
                      TamanhoTela.vertical(context) < 700 ? 80 : 100),
                ),
              ),
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeIn,
              height: temporizador
                  ? temporizador2
                      ? TamanhoTela.vertical(context)
                      : TamanhoTela.vertical(context) * 0.20
                  : 0,
              width: temporizador
                  ? temporizador2
                      ? TamanhoTela.horizontal(context)
                      : TamanhoTela.horizontal(context) * 0.35
                  : 0,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: AnimatedContainer(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [ColorApp.VerdeEscuro, ColorApp.VerdeClaro],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                      TamanhoTela.vertical(context) < 700 ? 80 : 100),
                ),
              ),
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeIn,
              height: temporizador
                  ? temporizador2
                      ? TamanhoTela.vertical(context)
                      : TamanhoTela.vertical(context) * 0.20
                  : 0,
              width: temporizador
                  ? temporizador2
                      ? TamanhoTela.horizontal(context)
                      : TamanhoTela.horizontal(context) * 0.35
                  : 0,
            ),
          ),
        ],
      ),
    );
  }
}
