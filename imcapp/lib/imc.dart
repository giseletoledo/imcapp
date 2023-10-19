class IMC {
  double calcular(double peso, double altura) {
    if (peso <= 0 || altura <= 0) {
      throw ArgumentError('Peso e altura devem ser valores positivos.');
    }
    return peso / (altura * altura);
  }

  String classificar(double imc) {
    if (imc.isNaN) {
      throw ArgumentError('IMC é um valor inválido.');
    }

    switch (imc) {
      case 16:
        return 'Magreza grave';
      case 17:
        return 'Magreza moderada';
      case 18.5:
        return 'Magreza leve';
      case 25:
        return 'Saudável';
      case 30:
        return 'Sobrepeso';
      case 35:
        return 'Obesidade Grau I';
      case 40:
        return 'Obesidade Grau II (severa)';
      default:
        if (imc < 16) {
          return 'Magreza grave';
        } else if (imc < 17) {
          return 'Magreza moderada';
        } else if (imc < 18.5) {
          return 'Magreza leve';
        } else if (imc < 25) {
          return 'Saudável';
        } else if (imc < 30) {
          return 'Sobrepeso';
        } else if (imc < 35) {
          return 'Obesidade Grau I';
        } else if (imc < 40) {
          return 'Obesidade Grau II (severa)';
        } else {
          return 'Obesidade Grau III (mórbida)';
        }
    }
  }
}
