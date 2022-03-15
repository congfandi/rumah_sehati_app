// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';

class Environments {
  static const String PRODUCTION = 'prod';
  static const String QAS = 'QAS';
  static const String DEV = 'dev';
  static const String LOCAL = 'local';
}

class ConfigEnvironments {
  static String get _currentEnvironments =>
      kDebugMode ? Environments.LOCAL : Environments.PRODUCTION;
  static final List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.LOCAL,
      'url': 'https://6ab7fc56-3766-4173-b737-5154309e32c5.mock.pstmn.io',
    },
    {
      'env': Environments.DEV,
      'url': '',
    },
    {
      'env': Environments.QAS,
      'url': '',
    },
    {
      'env': Environments.PRODUCTION,
      'url': 'https://sehatidmf.com',
    },
  ];

  static Map<String, String> getEnvironments() {
    return _availableEnvironments.firstWhere(
      (d) => d['env'] == _currentEnvironments,
    );
  }
}
