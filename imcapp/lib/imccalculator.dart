import 'package:flutter/material.dart';
import 'package:imcapp/imc.dart';
import 'package:imcapp/imcitem.dart';

class IMCCalculator extends StatefulWidget {
  const IMCCalculator({super.key});

  @override
  State<IMCCalculator> createState() => _IMCCalculatorState();
}

class _IMCCalculatorState extends State<IMCCalculator> {
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();
  final IMC imcCalculator = IMC();
  String resultado = '';
  List<IMCItem> imcData = [];

  void calcularIMC() {
    double peso = double.tryParse(pesoController.text) ?? 0;
    double altura = double.tryParse(alturaController.text) ?? 0;

    if (altura >= 100) {
      altura = altura / 100;
    }

    double imc = imcCalculator.calcular(peso, altura);
    String classificacao = imcCalculator.classificar(imc);

    setState(() {
      resultado = 'Seu IMC é ${imc.toStringAsFixed(2)} - $classificacao';
      imcData.add(IMCItem(peso: peso, altura: altura, imc: imc));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Peso (kg)'),
            ),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Altura (m)'),
            ),
            ElevatedButton(
              onPressed: calcularIMC,
              child: const Text('Calcular IMC'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(resultado),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Altura',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Peso',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'IMC',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: imcData.length,
                itemBuilder: (context, index) {
                  return imcData[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
