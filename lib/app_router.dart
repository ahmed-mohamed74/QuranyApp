import 'package:flutter/material.dart';

import 'Features/Azkari/Presentation/views/azkari_view.dart';
import 'Features/Azkari/Presentation/views/hsn_muslim_card_result_page.dart';
import 'Features/Azkari/data/models/azkari_model.dart';
import 'Features/Azkari/data/models/zekr_model.dart';
import 'Features/Dalelk/Presentation/views/dalelk_view.dart';
import 'Features/Home/Presentation/views/home_view.dart';
import 'Features/Sebha/Presentation/views/add_zekr_view.dart';
import 'Features/Sebha/Presentation/views/sebha_view.dart';
import 'Features/Settings/Presentation/views/setting_view.dart';
import 'Features/Splash/splash_view.dart';
import 'core/global/SharedWidgets/bottom_nav_bar_widget.dart';

abstract class AppRouter {
  static const splashscreen = '/splashScreen';

  static const homeScreen = '/HomeScreen';

  static const sebhaScreen = '/SebhaScreen';

  static const settingScreen = '/SettingScreen';

  static const dalelkScreen = '/DalelkScreen';

  static const edafetZekrPage = '/EdafetZekrPage';

  static const azkariScreen = '/AzkariScreen';

  static const bottomNavBar = '/'; //'/bottomNavBar'

  static const hsnMuslimCardResultPage = '/ShowSahehMuslimCardResultPage';

  static const pageViewBuilderEx = '/pageView';
  static const editTasbehaPage = '/EdditTashaPage';

  // static const konBoardingView = '/onboarding';

//automatically recalled when we use Navigator in our screen

  static Route<dynamic>? onGenerateRoutes(RouteSettings route) {
    String routeName = route.name!;
    final arguments = route.arguments;


    //! provide the nedded bloc providers here

    switch (routeName) {
      case splashscreen:
        return MaterialPageRoute(builder: (context) => const SplashView());

      case bottomNavBar:
        return MaterialPageRoute(
          builder: (context) => const CustomBottomNavBar(),
        );
      case editTasbehaPage:
        return MaterialPageRoute(
          builder: (context) => const EditTasbehaPage(),
        );

      case edafetZekrPage:
        return MaterialPageRoute(builder: (context) => const EdafetZekrPage());

      case hsnMuslimCardResultPage:
        return MaterialPageRoute(
          builder: (context) =>
              HsnMuslimCardResultPage(zekrModel: arguments as ZekrSectionModel),
        );

      case homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeView());

      case sebhaScreen:
        return MaterialPageRoute(builder: (context) => const SebhaView());

      case settingScreen:
        return MaterialPageRoute(builder: (context) => const SettingView());

      case dalelkScreen:
        return MaterialPageRoute(builder: (context) => const DalelkView());

      case azkariScreen:
        return MaterialPageRoute(builder: (context) => const AzkariView());
    }

    return null;
  }
}

class EditTasbehaPage extends StatelessWidget {
  const EditTasbehaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
