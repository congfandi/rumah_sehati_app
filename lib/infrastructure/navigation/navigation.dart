import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  const EnvironmentsBadge({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginControllerBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterScreen(),
      binding: RegisterControllerBinding(),
    ),
    GetPage(
      name: Routes.LOGIN_REGISTER,
      page: () => const LoginRegisterScreen(),
      binding: LoginRegisterControllerBinding(),
    ),
    GetPage(
      name: Routes.HOME_MENU,
      page: () => const HomeMenuScreen(),
      binding: HomeMenuControllerBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileScreen(),
      binding: ProfileControllerBinding(),
    ),
    GetPage(
      name: Routes.CHILDREN,
      page: () => const ChildrenScreen(),
      binding: ChildrenControllerBinding(),
    ),
    GetPage(
      name: Routes.FASKES,
      page: () => const FaskesScreen(),
      binding: FaskesControllerBinding(),
    ),
    GetPage(
      name: Routes.CALCULATOR,
      page: () => const CalculatorScreen(),
      binding: CalculatorControllerBinding(),
    ),
    GetPage(
      name: Routes.BALITA,
      page: () => const BalitaScreen(),
      binding: BalitaControllerBinding(),
    ),
    GetPage(
      name: Routes.IBU_HAMIL,
      page: () => const IbuHamilScreen(),
      binding: IbuHamilControllerBinding(),
    ),
    GetPage(
      name: Routes.PRAKONSEPSI,
      page: () => const PrakonsepsiScreen(),
      binding: PrakonsepsiControllerBinding(),
    ),
    GetPage(
      name: Routes.MENU_HARIAN,
      page: () => MenuHarianScreen(),
      binding: MenuHarianControllerBinding(),
    ),
    GetPage(
      name: Routes.PARENTING,
      page: () => ParentingScreen(),
      binding: ParentingControllerBinding(),
    ),
    GetPage(
      name: Routes.REKAN_BUNDA,
      page: () => const RekanBundaScreen(),
      binding: RekanBundaControllerBinding(),
    ),
    GetPage(
      name: Routes.KONSULTASI_GIZI,
      page: () => const KonsultasiGiziScreen(),
      binding: KonsultasiGiziControllerBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashControllerBinding(),
    ),
    GetPage(
      name: Routes.QUESTIONER,
      page: () => const QuestionerScreen(),
      binding: QuestionerControllerBinding(),
    ),
    GetPage(
      name: Routes.QUESTIONER_DETAIL,
      page: () => const QuestionerDetailScreen(),
      binding: QuestionerDetailControllerBinding(),
    ),
    GetPage(
      name: Routes.ARTICLE,
      page: () => ArticleScreen(),
      binding: ArticleControllerBinding(),
    ),
    GetPage(
      name: Routes.ARTICLE_DETAIL,
      page: () => ArticleDetailScreen(),
      binding: ArticleDetailControllerBinding(),
    ),
  ];
}
