import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:comics_db_app/configuration/configuration.dart';
import 'package:comics_db_app/domain/api_client/movie_and_tv_api_client.dart';
import 'package:comics_db_app/domain/blocs/personal/personal_container.dart';
import 'package:comics_db_app/domain/data_providers/session_data_provider.dart';
import 'package:comics_db_app/domain/entity/account_details.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_state.dart';

part 'personal_event.dart';

part 'personal_bloc.freezed.dart';

class PersonalDetailsBloc extends Bloc<PersonalDetailsEvent, PersonalDetailsState> {
  final _personalApiClient = MovieAndTvApiClient();
  final _sessionDataProvider = SessionDataProvider();

  PersonalDetailsBloc(PersonalDetailsState initialState) : super(initialState) {
    on<PersonalDetailsEvent>(((event, emit) async {
      if (event is PersonalDetailsEventLoadDetails) {
        await onPersonalDetailsEventLoadDetails(event, emit);
      } else if (event is PersonalDetailsEventLoadReset) {
        await onPersonalDetailsEventLoadReset(event, emit);
      }
    }), transformer: sequential());
  }

  Future<void> onPersonalDetailsEventLoadDetails(PersonalDetailsEvent event, Emitter<PersonalDetailsState> emit) async {
    final sessionId = await _sessionDataProvider.getAccountId();
    final result = await _personalApiClient.accountDetails(sessionId, Configuration.apiKey);
    final details = List<AccountDetails>.from(state.accountDetailsContainer.accountDetails)..addAll(result.accountDetails);
    final container = state.accountDetailsContainer.copyWith(
      accountDetails: details,
    );
    final newState = state.copyWith(accountDetailsContainer: container);
    emit(newState);
  }

  Future<void> onPersonalDetailsEventLoadReset(PersonalDetailsEvent event, Emitter<PersonalDetailsState> emit) async {
    emit(const PersonalDetailsState.initial());
  }
}
