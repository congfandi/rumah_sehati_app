import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rumah_sehati_mobile/app/data/models/article/response/article.dart';
import 'package:rumah_sehati_mobile/app/data/models/child/response/child.dart';
import 'package:rumah_sehati_mobile/app/data/models/child/response/perkembangan.dart';
import 'package:rumah_sehati_mobile/app/data/models/kms/kms.dart';

import 'package:rumah_sehati_mobile/firebase_options.dart';
import 'package:rumah_sehati_mobile/infrastructure/base/base_app.dart';

import 'infrastructure/navigation/routes.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    var initialRoute = await Routes.initialRoute;
    _hiveInit(initialRoute);
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

_hiveRegisterAdapter() {
  Hive.registerAdapter(ArticleAdapter());
  Hive.registerAdapter(KmsAdapter());
  Hive.registerAdapter(PerkembanganAdapter());
  Hive.registerAdapter(ChildAdapter());
}

_hiveInit(String initialRoute) async {
  await Hive.initFlutter();
  _hiveRegisterAdapter();
  await Hive.openBox<Article>("articles");
  await Hive.openBox<Kms>("kms");
  await Hive.openBox<Perkembangan>("perkembangan");
  await Hive.openBox<Child>("children");
  runApp(MyApp(
    initialRoute: initialRoute,
  ));
}
