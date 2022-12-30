part of 'account_bloc.dart';


class AccountDetailsState extends Equatable {
  final AccountDetailsContainer accountDetailsContainer;

  const AccountDetailsState.initial() : accountDetailsContainer = const AccountDetailsContainer.initial();

  const AccountDetailsState({required this.accountDetailsContainer});

  @override
  List<Object> get props => [accountDetailsContainer];

  AccountDetailsState copyWith({
    AccountDetailsContainer? accountDetailsContainer,
  }) {
    return AccountDetailsState(
        accountDetailsContainer: accountDetailsContainer ?? this.accountDetailsContainer,
    );
  }
}