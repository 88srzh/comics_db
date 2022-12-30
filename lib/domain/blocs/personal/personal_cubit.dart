import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'personal_state.dart';

class PersonalCubit extends Cubit<PersonalState> {
  PersonalCubit() : super(PersonalInitial());
}
