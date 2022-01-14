import 'package:flutter_test/flutter_test.dart';
import 'package:unity_test/person.dart';

void main() {
  final person = Person(name: 'Jacob', age: 29, height: 1.77, weight: 64.4);
  print('Test de unidade - Imc deve vir 20.56: ${person.imc == 20.56}');
  testWidgets('Imc deve vir 20.56', (tester) async {
    expect(person.imc, isA<double>());
    expect(person.imc, 20.56);
  });

  test('Se a idade for maior que 18, então isOlder deve ser true', () {
    expect(person.isOlder, true);
  });
}
