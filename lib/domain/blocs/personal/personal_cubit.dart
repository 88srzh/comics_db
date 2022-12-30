import 'package:bloc/bloc.dart';
import 'package:comics_db_app/domain/blocs/personal/personal_container.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'personal_state.dart';

class PersonalCubit extends Cubit<PersonalState> {
  PersonalCubit() : super(PersonalInitial());
}
