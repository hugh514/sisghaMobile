import 'package:flutter/material.dart';
import 'package:sisgha/app/constants/theme_app.dart';
import 'package:sisgha/app/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

// APENAS UM TESTE - DANILO ESCUDERO - 2024
// APENAS UM TESTE - DANILO ESCUDERO - 2024
// APENAS UM TESTE - DANILO ESCUDERO - 2024

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login SISGHA',
      theme: ThemeApp.Tema(),
      initialRoute: '/primeiraTela',
      routes: AppRoutes.rotas(),
    );
  }
}
