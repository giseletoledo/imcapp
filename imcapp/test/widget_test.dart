// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:imcapp/imc_model.dart';
import 'package:imcapp/imc_calculator.dart';

void main() {
  testWidgets('Teste de cálculo de IMC', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: IMCCalculator()));

    // Insira valores de peso e altura nos campos de texto
    await tester.enterText(find.bySemanticsLabel('Peso (kg)'), '70');
    await tester.enterText(find.bySemanticsLabel('Altura (m)'), '1.75');

    // Clique no botão "Calcular IMC"
    await tester.tap(find.text('Calcular IMC'));
    await tester.pump();

    // Verifique se o resultado é exibido corretamente
    expect(find.text('Seu IMC é 22.86 - Saudável'), findsOneWidget);
  });

  test('Teste de classificação de IMC', () {
    // Define um valor de altura constante para os testes
    const altura = 1.75; // Substitua pelo valor desejado

    // Teste classificações de IMC
    expect(IMCModel(15, altura).classificarIMC(), 'Magreza grave');
    expect(IMCModel(16.5, altura).classificarIMC(), 'Magreza moderada');
    expect(IMCModel(18.0, altura).classificarIMC(), 'Magreza leve');
    expect(IMCModel(23, altura).classificarIMC(), 'Saudável');
    expect(IMCModel(27.5, altura).classificarIMC(), 'Sobrepeso');
    expect(IMCModel(32.0, altura).classificarIMC(), 'Obesidade Grau I');
    expect(
        IMCModel(37.5, altura).classificarIMC(), 'Obesidade Grau II (severa)');
    expect(
        IMCModel(42, altura).classificarIMC(), 'Obesidade Grau III (mórbida)');
  });
}
