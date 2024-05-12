import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'duvfnuh1': {
      'en': 'Your updates \nfor today !',
      'fr': 'Vos mises à jour\npour aujourd\'hui !',
    },
    '9mqfnacl': {
      'en': 'Leave Balance : 15',
      'fr': 'Solde de sortie : 15',
    },
    'cstt1krj': {
      'en': 'WFH Balance : 24',
      'fr': 'Solde FMH : 24',
    },
    'rav5ldj8': {
      'en': 'How can we help you today ?',
      'fr': 'Que peut-on faire pour vous aider aujourd\'hui ?',
    },
    'vgpetp4y': {
      'en': 'Find\nTechbar',
      'fr': 'Trouver\nBarre technique',
    },
    '1lao6q35': {
      'en': 'Book Room',
      'fr': 'Réserver une chambre',
    },
    's0byd9ij': {
      'en': 'Talk to\nChatbot',
      'fr': 'Parler à\nChatbot',
    },
    'qaixxwaa': {
      'en': 'Search\nContacts',
      'fr': 'Recherche\nContacts',
    },
    'twlwaipk': {
      'en': 'Meetings today',
      'fr': 'Réunions aujourd\'hui',
    },
    'zy19mje8': {
      'en': 'Booking Room',
      'fr': 'Réservation chambre',
    },
    'vorw0bwp': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // details
  {
    'pg233kzd': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // profile
  {
    'fz74havo': {
      'en': 'David Jerome',
      'fr': 'David Jérôme',
    },
    '5ub5ij9y': {
      'en': 'David.j@gmail.com',
      'fr': 'David.j@gmail.com',
    },
    'r8hv8qpx': {
      'en': 'Settings',
      'fr': 'Paramètres',
    },
    'm8i5aiqh': {
      'en': 'employee ID',
      'fr': 'identifiant d\'employé',
    },
    '4nkrmhr3': {
      'en': 'Department',
      'fr': 'Département',
    },
    'xohkce37': {
      'en': 'Unit',
      'fr': 'Unité',
    },
    'k1ey22tp': {
      'en': 'Technology',
      'fr': 'Technologie',
    },
    '1169rgel': {
      'en': 'project',
      'fr': 'projet',
    },
    '4qp3dtx4': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // login
  {
    'pbigph7k': {
      'en': 'Orbit\n',
      'fr': '',
    },
    'zge17uol': {
      'en': 'Welcome Back',
      'fr': '',
    },
    '5qz6n2gs': {
      'en': 'Let\'s get started by filling out the form below.',
      'fr': '',
    },
    '876fgy9i': {
      'en': 'OR',
      'fr': '',
    },
    'd23ym3xw': {
      'en': 'Continue with Google',
      'fr': '',
    },
    'chzglemn': {
      'en': 'Continue with Apple',
      'fr': '',
    },
    'hfjhq3wy': {
      'en': 'Don\'t have an account? ',
      'fr': '',
    },
    't52kqe3y': {
      'en': 'Sign Up here',
      'fr': '',
    },
    'xsla9pxv': {
      'en': 'UserName',
      'fr': '',
    },
    '1nnb77nx': {
      'en': 'Overall',
      'fr': '',
    },
    '03523zzf': {
      'en': '5',
      'fr': '',
    },
    'p272posw': {
      'en':
          'Nice outdoor courts, solid concrete and good hoops for the neighborhood.',
      'fr': '',
    },
    'fxvhioba': {
      'en': 'Home',
      'fr': '',
    },
  },
  // meetingItem
  {
    'm8lyxab2': {
      'en': 'Northern Lights',
      'fr': 'Aurores boréales',
    },
    'u5nxl2mf': {
      'en': 'Booking Room',
      'fr': 'Réservation chambre',
    },
    'o6t7stc2': {
      'en': '16:52 - 17:30',
      'fr': '16h52 - 17h30',
    },
    'tr62rrlf': {
      'en': 'Sara Warner',
      'fr': 'Sara Warner',
    },
  },
  // microftlogin
  {
    'k2aa33ba': {
      'en': 'Continue with Microsoft',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'mvyx3xoc': {
      'en': 'Hello World',
      'fr': 'Bonjour le monde',
    },
    '7mb5zdul': {
      'en': '',
      'fr': '',
    },
    'o2udefum': {
      'en': '',
      'fr': '',
    },
    '9zv4phkw': {
      'en': '',
      'fr': '',
    },
    'wc0qmuxg': {
      'en': '',
      'fr': '',
    },
    '5x6sngmv': {
      'en': '',
      'fr': '',
    },
    'y33htwjo': {
      'en': '',
      'fr': '',
    },
    '4i0vurbs': {
      'en': '',
      'fr': '',
    },
    '2nwqz7hq': {
      'en': '',
      'fr': '',
    },
    'ui1poyt2': {
      'en': '',
      'fr': '',
    },
    'ycg5hfj9': {
      'en': '',
      'fr': '',
    },
    '0l3mm6j1': {
      'en': '',
      'fr': '',
    },
    'wx4iftlt': {
      'en': '',
      'fr': '',
    },
    'tbxr4q7q': {
      'en': '',
      'fr': '',
    },
    '7ge3pei6': {
      'en': '',
      'fr': '',
    },
    't7i1zgox': {
      'en': '',
      'fr': '',
    },
    'fx4n0fjh': {
      'en': '',
      'fr': '',
    },
    '6hlbogpz': {
      'en': '',
      'fr': '',
    },
    '63vnt85k': {
      'en': '',
      'fr': '',
    },
    'f2i0v57d': {
      'en': '',
      'fr': '',
    },
    '7v37gqtp': {
      'en': '',
      'fr': '',
    },
    'x3sx6i2e': {
      'en': '',
      'fr': '',
    },
    '6hu35yoh': {
      'en': '',
      'fr': '',
    },
    '4qs3eh9g': {
      'en': '',
      'fr': '',
    },
    'czrucfdk': {
      'en': '',
      'fr': '',
    },
    'yzu9cc3s': {
      'en': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
