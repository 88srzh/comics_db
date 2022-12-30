part of 'personal_bloc.dart';


class PersonalDetailsState extends Equatable {
  final AccountDetailsContainer accountDetailsContainer;

  const PersonalDetailsState.initial() : accountDetailsContainer = const AccountDetailsContainer.initial();

  const PersonalDetailsState({required this.accountDetailsContainer});

  @override
  List<Object> get props => [accountDetailsContainer];

  PersonalDetailsState copyWith({
    AccountDetailsContainer? accountDetailsContainer,
  }) {
    return PersonalDetailsState(
        accountDetailsContainer: accountDetailsContainer ?? this.accountDetailsContainer,
    );
  }
}