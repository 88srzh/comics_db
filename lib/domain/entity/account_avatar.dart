import 'package:comics_db_app/domain/entity/account_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_avatar.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Avatar {
  final Gravatar gravatar;
  final Tmdb tmdb;

  Avatar({
    required this.gravatar,
    required this.tmdb,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);

  Map<String, dynamic> toJson() => _$AvatarToJson(this);
}
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Gravatar {
  final String hash;

  Gravatar({
    required this.hash,
  });

  factory Gravatar.fromJson(Map<String, dynamic> json) => _$GravatarFromJson(json);

  Map<String, dynamic> toJson() => _$GravatarToJson(this);

}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Tmdb {
  final String avatarPath;

  Tmdb({
    required this.avatarPath,
  });

  factory Tmdb.fromJson(Map<String, dynamic> json) => _$TmdbFromJson(json);

  Map<String, dynamic> toJson() => _$TmdbToJson(this);

}
