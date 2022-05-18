/*
 * byggtid_mobile_app
 * base_app.dart
 * Created by Cong Fandi on 25/1/2022
 * email 	    : me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/navigation/navigation.dart';

import '../dal/services/auth_service.dart';
import '../theme/theme.dart';
import '../utils/resources/strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.initialRoute}) : super(key: key);
  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_,__) => GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: GetMaterialApp(
          title: Strings.appName,
          supportedLocales: const [Locale('id', 'ID')],
          debugShowCheckedModeBanner: false,
          theme: themeLight,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          initialBinding: BindingsBuilder(
            () {
              Get.put(AuthService());
            },
          ),
          initialRoute: initialRoute,
          getPages: Nav.routes,
          locale: const Locale('id', 'ID'),
          fallbackLocale: const Locale('id', 'ID'),
        ),
      ),
    );
  }
}
