import 'package:flutter/material.dart';

class IMCItem extends StatelessWidget {
  const IMCItem(
      {super.key, required this.peso, required this.altura, required this.imc});
  final double peso;
  final double altura;
  final double imc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(altura.toStringAsFixed(2)),
        Text(peso.toStringAsFixed(2)),
        Text(imc.toStringAsFixed(2)),
      ],
    );
  }
}
