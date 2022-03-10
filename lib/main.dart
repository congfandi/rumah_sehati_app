import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

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
    runApp(MyApp(initialRoute: initialRoute,));
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

