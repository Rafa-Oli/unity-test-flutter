import 'package:bloc/bloc.dart';
import 'package:unity_test/person_repository.dart';
import 'package:unity_test/person_state.dart';

enum PersonEvent { clear, fetch }

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final PersonRepository repository;

  final listMock = '[{name: ana, age: 24, height: 11, weight: 40}]';

  PersonBloc(this.repository) : super(PersonListState([])) {
    on<PersonEvent>(fetch);
  }

  Future<void> fetch(PersonEvent event, Emitter<PersonState> emit) async {
    if (event == PersonEvent.clear) {
      emit(PersonListState([]));
    } else if (event == PersonEvent.fetch) {
      emit(PersonLoadingState());

      try {
        final list = repository.getPerson();
        emit(PersonListState(list));
      } catch (e) {
        emit(PersonErrorState(e));
      }
    }
  }
}
