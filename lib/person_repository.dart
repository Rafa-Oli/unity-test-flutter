import 'package:unity_test/person.dart';

class PersonRepository {
  final listMock =
      '[{name: ana, age: 24, height: 11, weight: 40}, {name: ana, age: 24, height: 11, weight: 40}]'
          as List;

  List<Person> getPerson() {
    return listMock.map((e) => Person.fromMap(e)).toList();
  }
}
