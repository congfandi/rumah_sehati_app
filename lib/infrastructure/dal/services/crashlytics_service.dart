import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class Crashlytics {
  Crashlytics._();

  static Future<void> nonFatalError({
    dynamic error,
    StackTrace? stackTrace,
    String? reason,
  }) async {
    await FirebaseCrashlytics.instance.recordError(
      error,
      stackTrace,
      reason: reason ?? "a non-fatal error",
    );
  }

  static Future<void> apiError({
    dynamic error,
    StackTrace? stackTrace,
    String? reason,
  }) async {
    await FirebaseCrashlytics.instance.recordError(
      error,
      stackTrace,
      reason: reason ?? "api error",
    );
  }

  static Future<void> fatalError({
    dynamic error,
    StackTrace? stackTrace,
    String? reason,
  }) async {
    await FirebaseCrashlytics.instance.recordError(
      error,
      stackTrace,
      reason: reason ?? "a fatal error",
      fatal: true,
    );
  }
}
