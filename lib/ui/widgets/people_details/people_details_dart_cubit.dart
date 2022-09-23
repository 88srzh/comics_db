import 'package:bloc/bloc.dart';
import 'package:comics_db_app/ui/widgets/people_details/components/people_details_data.dart';

part 'people_details_dart_state.dart';

class PeopleDetailsCubit extends Cubit<PeopleDetailsState> {
  final data = PeopleDetailsData();
  // movieService until we do
  final int id;
  PeopleDetailsCubit(this.id) : super(PeopleDetailsDartInitial());
}
