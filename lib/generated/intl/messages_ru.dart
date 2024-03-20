// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m3(author) => "Обзор от";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("Аккаунт"),
        "all": MessageLookupByLibrary.simpleMessage("Все"),
        "cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
        "description": MessageLookupByLibrary.simpleMessage("Описание"),
        "doYouReallyWantToLogout":
            MessageLookupByLibrary.simpleMessage("Вы правда хотите выйти?"),
        "favorites": MessageLookupByLibrary.simpleMessage("Избранное"),
        "keywords": MessageLookupByLibrary.simpleMessage("Ключевые слова"),
        "logout": MessageLookupByLibrary.simpleMessage("Выйти"),
        "movie": MessageLookupByLibrary.simpleMessage("Фильмы"),
        "notifications": MessageLookupByLibrary.simpleMessage("Уведомления"),
        "people": MessageLookupByLibrary.simpleMessage("Люди"),
        "personal": MessageLookupByLibrary.simpleMessage("Настройки"),
        "popularPeople":
            MessageLookupByLibrary.simpleMessage("Популярные люди"),
        "readTheRest": MessageLookupByLibrary.simpleMessage("далее"),
        "reviewBy": m3,
        "reviews": MessageLookupByLibrary.simpleMessage("Рецензии"),
        "seeAll": MessageLookupByLibrary.simpleMessage("Все"),
        "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "theme": MessageLookupByLibrary.simpleMessage("Тема"),
        "topBilledCast":
            MessageLookupByLibrary.simpleMessage("В главных ролях"),
        "trending": MessageLookupByLibrary.simpleMessage("Тренды"),
        "tv": MessageLookupByLibrary.simpleMessage("Сериалы"),
        "watchlist": MessageLookupByLibrary.simpleMessage("Список отслеживания")
      };
}