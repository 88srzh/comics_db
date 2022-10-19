import 'package:comics_db_app/ui/widgets/people_details/components/character_data.dart';

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
  List<PeopleDetailsCharacterData> characterData = const <PeopleDetailsCharacterData>[];
  // List<KnownForData> knownFor = const <KnownForData>[];
}
