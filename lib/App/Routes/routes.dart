import 'package:get/get.dart';
import 'package:mobile_zone/App/Auth/ViewModel/registor_view_model.dart';
import '../Auth/View/login_view.dart';
import '../Auth/View/login_viiew.dart';
import '../Auth/View/register_view.dart';
import '../Auth/ViewModel/login_view_model.dart';
import '../Home/ViewModel/home_view_model.dart';
import '../RootPage/root_page.dart';
import '../Splash/View/splash_view.dart';
import '../Splash/ViewModel/splash_view_model.dart';
import 'route_names.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RouteNames.splashView,
      transition: Transition.rightToLeft,
      page: () => SplashView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SplashViewModel>(
          () => SplashViewModel(),
        );
      }),
    ),
    GetPage(
      name: RouteNames.loginView,
      transition: Transition.rightToLeft,
      page: () => LoginView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginViewModel>(
          () => LoginViewModel(),
        );
      }),
    ),
    GetPage(
      name: RouteNames.rootPage,
      transition: Transition.rightToLeft,
      page: () => const RootPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeViewModel>(
          () => HomeViewModel(),
        );
      }),
    ),
    GetPage(
      name: RouteNames.registorView,
      transition: Transition.rightToLeft,
      page: () => RegisterScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RegistorViewModel>(
          () => RegistorViewModel(),
        );
      }),
    ),
  ];
}
