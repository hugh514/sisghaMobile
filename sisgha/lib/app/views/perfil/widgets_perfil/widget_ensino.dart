import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sisgha/app/constants/colors.dart';
import 'package:sisgha/app/constants/estilos.dart';

class WidgetEnsino extends StatefulWidget {
  const WidgetEnsino({super.key});

  @override
  State<WidgetEnsino> createState() => _WidgetEnsino();
}

class _WidgetEnsino extends State<WidgetEnsino> {
  final List<Map<String, dynamic>> materias = [
    {
      "materia": "Matemática",
      "cursos": [
        {
          "curso": "Informática",
          "anos": ["1ºA", "1ºB", "2ºA", "3ºA"],
        },
        {
          "curso": "Quimica",
          "anos": ["1ºA", "2ºA", "3ºA"],
        },
        {
          "curso": "Floresta",
          "anos": ["1ºA", "2ºA", "3ºA"],
        }
      ]
    },
    {
      "materia": "Português",
      "cursos": [
        {
          "curso": "Informática",
          "anos": ["1ºA", "1ºB", "2ºA", "3ºA"],
        },
        {
          "curso": "Quimica",
          "anos": ["1ºA", "2ºA", "3ºA"],
        },
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          CarouselSlider(
            items: List.generate(materias.length,
                (index) => gerador(constraints.maxWidth, index)),
            options: CarouselOptions(
              enableInfiniteScroll: false,
              viewportFraction: 0.8,
              enlargeCenterPage: false,
              height: 250,
            ),
          ),
        ],
      ),
    );
  }

  Widget gerador(double largura, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: boxDecoration(),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(9),
              topRight: Radius.circular(9),
            ),
            child: Image.asset(
              'assets/img/gtr.jpeg',
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
              width: largura,
              height: 70,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    materias[index]["materia"],
                    style: estiloTexto(14, peso: FontWeight.bold),
                  ),
                ),
                mostrarInformacoesdaMateria(index),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget mostrarInformacoesdaMateria(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: materias[index]["cursos"].map<Widget>((curso) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 4,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(color: ColorApp.VerdeCinza),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Text(
                  curso["curso"],
                  style: estiloTexto(14, peso: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  curso["anos"].join(", "),
                  style: estiloTexto(14, peso: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
