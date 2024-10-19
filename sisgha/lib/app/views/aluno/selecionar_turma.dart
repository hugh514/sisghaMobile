import 'package:flutter/material.dart';
import 'package:sisgha/app/widgets/appBar_aluno.dart';
import 'package:sisgha/app/widgets/body_aluno.dart';

class PaginaAlunoSelec extends StatelessWidget {
  const PaginaAlunoSelec({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarAluno(),
      body: BodyAluno(),
    );
  }
}
