import 'package:uuid/uuid.dart';

class IMCModel {
  final Uuid uuid = const Uuid();
  final String _id;
  double _peso;
  double _altura;

  IMCModel(this._peso, this._altura) : _id = const Uuid().v4();

  String get id => _id;
  double get peso => _peso;

  set peso(double newPeso) {
    if (newPeso <= 0) {
      throw ArgumentError('Peso deve ser um valor positivo.');
    }
    _peso = newPeso;
  }

  double get altura => _altura;

  set altura(double newAltura) {
    if (newAltura <= 0) {
      throw ArgumentError('Altura deve ser um valor positivo.');
    }
    _altura = newAltura;
  }

  double calcularIMC() {
    if (_peso <= 0 || _altura <= 0) {
      throw ArgumentError('Peso e altura devem ser valores positivos.');
    }
    return _peso / (_altura * _altura);
  }

  String classificarIMC() {
    final imc = calcularIMC();
    if (imc.isNaN) {
      throw ArgumentError('IMC é um valor inválido.');
    }

    if (imc <= 16) {
      return 'Magreza grave';
    } else if (imc <= 17) {
      return 'Magreza moderada';
    } else if (imc <= 18.5) {
      return 'Magreza leve';
    } else if (imc <= 25) {
      return 'Saudável';
    } else if (imc <= 30) {
      return 'Sobrepeso';
    } else if (imc <= 35) {
      return 'Obesidade Grau I';
    } else if (imc <= 40) {
      return 'Obesidade Grau II (severa)';
    } else {
      return 'Obesidade Grau III (mórbida)';
    }
  }

  // fromMap
  factory IMCModel.fromMap(Map<String, dynamic> map) {
    return IMCModel(
      map['peso'] as double,
      map['altura'] as double,
    );
  }

  // toMap
  Map<String, dynamic> toMap() {
    return {
      'peso': peso,
      'altura': altura,
    };
  }
}
