// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(title) =>
      "We do not have any reviews for ${title}. Would you like to write one?";

  static String m1(date, time) => "Date: ${date} Time: ${time}";

  static String m2(howMany) =>
      "${Intl.plural(howMany, one: 'You have 1 message', other: 'You have ${howMany} messages')}";

  static String m3(author) => "A review by";

  static String m4(total) => "Total: ${total}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("Account"),
        "all": MessageLookupByLibrary.simpleMessage("All"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "doYouReallyWantToLogout": MessageLookupByLibrary.simpleMessage(
            "Do you really want to logout?"),
        "favorites": MessageLookupByLibrary.simpleMessage("Favorites"),
        "ifNowReviews": m0,
        "keywords": MessageLookupByLibrary.simpleMessage("Keywords"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "movie": MessageLookupByLibrary.simpleMessage("Movie"),
        "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
        "pageHomeSampleCurrentDateTime": m1,
        "pageHomeSamplePlural": m2,
        "people": MessageLookupByLibrary.simpleMessage("People"),
        "personal": MessageLookupByLibrary.simpleMessage("Personal"),
        "popularPeople": MessageLookupByLibrary.simpleMessage("Popular People"),
        "readTheRest": MessageLookupByLibrary.simpleMessage("read the rest"),
        "reviewBy": m3,
        "reviews": MessageLookupByLibrary.simpleMessage("Reviews"),
        "seeAll": MessageLookupByLibrary.simpleMessage("See All"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "theme": MessageLookupByLibrary.simpleMessage("Theme"),
        "topBilledCast":
            MessageLookupByLibrary.simpleMessage("Top Billed Cast"),
        "totalAmount": m4,
        "trending": MessageLookupByLibrary.simpleMessage("Trending"),
        "tv": MessageLookupByLibrary.simpleMessage("TV"),
        "watchlist": MessageLookupByLibrary.simpleMessage("Watchlist")
      };
}
