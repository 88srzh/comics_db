// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:comics_db_app/domain/entity/account_details.dart';

class AccountDetailsContainer extends Equatable {
  final List<AccountDetails> accountDetails;

  const AccountDetailsContainer.initial()
      : accountDetails = const <AccountDetails>[];

  const AccountDetailsContainer({required this.accountDetails});

  @override
  List<Object> get props => [accountDetails];

  AccountDetailsContainer copyWith({List<AccountDetails>? accountDetails}) {
    return AccountDetailsContainer(
        accountDetails: accountDetails ?? this.accountDetails);
  }
}
