import 'package:comics_db_app/domain/entity/account_details_response.dart';
import 'package:equatable/equatable.dart';

class AccountDetailsContainer extends Equatable {
  final List<AccountDetailsResponse> accountDetails;

  const AccountDetailsContainer.initial() : accountDetails = const <AccountDetailsResponse>[];

  const AccountDetailsContainer({required this.accountDetails});

  @override
  List<Object> get props => [accountDetails];

  AccountDetailsContainer copyWith({List<AccountDetailsResponse>? accountDetails}) {
    return AccountDetailsContainer(accountDetails: accountDetails ?? this.accountDetails);
  }
}
