part of 'account_bloc.dart';

@freezed
class AccountDetailsEvent with _$AccountDetailsEvent {
  factory AccountDetailsEvent.loadDetails({required String locale}) =
      AccountDetailsEventLoadDetails;
  factory AccountDetailsEvent.loadReset() = AccountDetailsEventLoadReset;
  factory AccountDetailsEvent.logout() = AccountLogoutEvent;
}
