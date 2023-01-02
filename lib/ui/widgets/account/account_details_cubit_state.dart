import 'package:equatable/equatable.dart';

class AccountDetailsCubitState extends Equatable {
  final int id;
  final String name;
  final String username;

  const AccountDetailsCubitState({
    required this.id,
    required this.name,
    required this.username,
  });

  @override
  List<Object> get props => [id, name, username];

  AccountDetailsCubitState copyWith({
    int? id,
    String? name,
    String? username,
  }) {
    return AccountDetailsCubitState(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
    );
  }
}
