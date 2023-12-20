// Package imports:
import 'package:equatable/equatable.dart';

class AccountDetailsCubitState extends Equatable {
  final int id;
  final String name;
  final String username;
  final bool includeAdult;

  const AccountDetailsCubitState({
    required this.id,
    required this.name,
    required this.username,
    required this.includeAdult,
  });

  @override
  List<Object> get props => [id, name, username, includeAdult];

  AccountDetailsCubitState copyWith({
    int? id,
    String? name,
    String? username,
    bool? includeAdult,
  }) {
    return AccountDetailsCubitState(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      includeAdult: includeAdult ?? this.includeAdult,
    );
  }
}
