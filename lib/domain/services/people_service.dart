import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/ui/widgets/people_details/components/people_details_local.dart';

class PeopleService {
  final _movieAndTvApiClient = MovieAndTvApiClient();

  Future<PeopleDetailsLocal> loadPeopleDetails({required int id, required String locale}) async {
    final peopleDetails = await _movieAndTvApiClient.popularPeopleDetails(id, locale);
    return PeopleDetailsLocal(details: peopleDetails);
  }
}
