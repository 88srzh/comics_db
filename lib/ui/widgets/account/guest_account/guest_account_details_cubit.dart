import 'package:comics_db_app/domain/api_client/auth_api_client.dart';
import 'package:comics_db_app/ui/widgets/account/components/guest_account_details_data.dart';
import 'package:comics_db_app/ui/widgets/account/guest_account/guest_account_details_cubit_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuestAccountDetailsCubit extends Cubit<GuestAccountDetailsCubitState> {
  final guestAccountDetailsData = GuestAccountDetailsData();
  final authApiClient = AuthApiClient();

  GuestAccountDetailsCubit() : super(const GuestAccountDetailsCubitState(sessionId: '', expiresAt: '')) {
    emit(GuestAccountDetailsCubitState(
      sessionId: state.sessionId,
      expiresAt: state.expiresAt,
    ));
  }

  Future<String> loadGuestAccountDetails() async {
    final guestSessionId = await authApiClient.guestAuth();
    return guestSessionId;
  }


}
