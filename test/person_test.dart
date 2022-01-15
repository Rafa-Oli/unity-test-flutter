import 'package:flutter_test/flutter_test.dart';
import 'package:unity_test/person.dart';

void main() {
  final person = Person(name: 'Jacob', age: 29, height: 1.77, weight: 64.4);
  setUp(() {
    print('Inicia o test');
  });

  tearDown(() {
    print('destrói teste');
  });

  setUpAll(() {
    print('inicia suite');
  });

  tearDownAll(() {
    print('destrói suite');
  });

  testWidgets('Imc deve vir 20.56', (tester) async {
    print('executando');
    expect(person.imc, isA<double>());
    expect(person.imc, 20.56);
  });

  test('throw error', () {
    expect(() => int.parse('x'), throwsA(isA<Exception>()));
  });

  group('isOlder', () {
    test('Se a idade for maior que 18, então isOlder deve ser true', () {
      expect(person.isOlder, true);
    });
    test('Se a idade for igual a 18, então isOlder deve ser true', () {
      final person = Person(name: 'Jacob', age: 18, height: 1.77, weight: 64.4);
      expect(person.isOlder, true);
    });
  });
}
