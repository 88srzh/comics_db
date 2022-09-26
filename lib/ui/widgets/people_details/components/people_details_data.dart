import 'package:comics_db_app/domain/entity/people_known_for.dart';
import 'package:comics_db_app/ui/widgets/people_details/components/known_for_data.dart';

class PeopleDetailsData {
  String? birthday = '';
  String knownForDepartment = '';
  String? deathday = '';
  int id = 0;
  String name = '';
  List<String> alsoKnownAs = [];
  int gender = 0;
  String biography = '';
  double popularity = 0.0;
  String? placeOfBirth = '';
  String? profilePath = '';
  bool adult = true;
  String imdbId = '';
  String? homepage = '';
  List<KnownForData> knownFor = const <KnownForData>[];
}
