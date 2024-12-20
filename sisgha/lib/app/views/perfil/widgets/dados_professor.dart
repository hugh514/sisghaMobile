import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sisgha/app/core/utils/colors.dart';
import 'package:sisgha/app/core/utils/estilos.dart';

Widget dadosUsuario(BuildContext context, nome, email, matricula) {
  return Column(
    children: [
      Text(
        'Professor(a) $nome',
        style: estiloTexto(16, cor: ColorApp.PretoTexto, peso: FontWeight.bold),
      ),
      Text(
        'E-mail: $email',
        style: estiloTexto(14,
            cor: ColorApp.VerdeCinzaTexto, peso: FontWeight.bold),
      ),
      Text(
        'Matrícula: $matricula',
        style: estiloTexto(14,
            cor: ColorApp.VerdeCinzaTexto, peso: FontWeight.bold),
      ),
    ],
  );
}
