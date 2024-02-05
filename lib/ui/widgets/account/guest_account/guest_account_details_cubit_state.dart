

import 'package:equatable/equatable.dart';

class GuestAccountDetailsCubitState extends Equatable {
  final String sessionId;
  final String expiresAt;

  const GuestAccountDetailsCubitState({
    required this.sessionId,
    required this.expiresAt,
  });

  @override
  List<Object> get props => [sessionId, expiresAt];

  GuestAccountDetailsCubitState copyWith({
    String? sessionId,
    String? expiresAt,
  }) {
    return GuestAccountDetailsCubitState(
      sessionId: sessionId ?? this.sessionId,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }
}