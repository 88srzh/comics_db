class AccountDetailsCubitState {
  final int id;
  final String name;
  final String username;
  final bool includeAdult;
  final String? avatarPath;
  final String localeTag;

  const AccountDetailsCubitState({
    required this.id,
    required this.name,
    required this.username,
    required this.includeAdult,
    required this.avatarPath,
    required this.localeTag,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountDetailsCubitState &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          username == other.username &&
          includeAdult == other.includeAdult &&
          avatarPath == other.avatarPath &&
          localeTag == other.localeTag;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ username.hashCode ^ includeAdult.hashCode ^ avatarPath.hashCode ^ localeTag.hashCode;

  AccountDetailsCubitState copyWith({
    int? id,
    String? name,
    String? username,
    bool? includeAdult,
    String? avatarPath,
    String? localeTag,
  }) {
    return AccountDetailsCubitState(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      includeAdult: includeAdult ?? this.includeAdult,
      avatarPath: avatarPath ?? this.avatarPath,
      localeTag: localeTag ?? this.localeTag,
    );
  }
}
