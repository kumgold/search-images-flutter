import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StringResources {
  static StringResources of(BuildContext context) {
    return Localizations.of(context, StringResources);
  }

  String getText(String key) => language[key];
}

late Map<String, dynamic> language;

class StringResourcesDelegate extends LocalizationsDelegate<StringResources> {
  const StringResourcesDelegate();

  @override
  Future<StringResources> load(Locale locale) async {
    String strings = await rootBundle.loadString('assets/strings/${locale.languageCode}.json');
    language = json.decode(strings);
    return SynchronousFuture<StringResources>(StringResources());
  }

  @override
  bool isSupported(Locale locale) {
    return ['en'].contains(locale.languageCode);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<StringResources> old) => false;
}
