import 'package:unity_test/person.dart';

void main(List<String> args) {
  final person = Person(name: 'Jacob', age: 29, height: 1.77, weight: 64.4);
  print('Test de unidade - Imc deve vir 20.56: ${person.imc == 20.56}');
}
