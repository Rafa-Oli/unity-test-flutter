import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:unity_test/person.dart';
import 'package:unity_test/person_bloc.dart';
import 'package:unity_test/person_repository.dart';
import 'package:unity_test/person_state.dart';

import 'person_bloc_test.mocks.dart';

@GenerateMocks([PersonRepository])
void main() {
  var repository = MockPersonRepository();
  final bloc = PersonBloc(repository);
  final person = Person(name: 'Jacob', age: 29, height: 1.77, weight: 64.4);
  test('deve retornar uma lista de person', () async {
    when(repository.getPerson()).thenAnswer((_) => [person, person]);
    bloc.add(PersonEvent.fetch);
    await expectLater(bloc.stream,
        emitsInOrder([isA<PersonLoadingState>(), isA<PersonListState>()]));
  });
  test('deve disparar um error', () async {
    when(repository.getPerson()).thenThrow(Exception('deu error'));
    bloc.add(PersonEvent.fetch);
    await expectLater(bloc.stream,
        emitsInOrder([isA<PersonLoadingState>(), isA<PersonErrorState>()]));
  });
}
