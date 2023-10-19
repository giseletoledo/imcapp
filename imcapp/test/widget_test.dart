// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:imcapp/imc.dart';
import 'package:imcapp/imccalculator.dart';

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
    final imc = IMC();

    // Teste classificações de IMC
    expect(imc.classificar(15), 'Magreza grave');
    expect(imc.classificar(16.5), 'Magreza moderada');
    expect(imc.classificar(18.0), 'Magreza leve');
    expect(imc.classificar(23), 'Saudável');
    expect(imc.classificar(27.5), 'Sobrepeso');
    expect(imc.classificar(32.0), 'Obesidade Grau I');
    expect(imc.classificar(37.5), 'Obesidade Grau II (severa)');
    expect(imc.classificar(42), 'Obesidade Grau III (mórbida)');
  });
}
