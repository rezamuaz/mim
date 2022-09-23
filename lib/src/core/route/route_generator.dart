import 'package:flutter/material.dart';
import 'package:mim/src/presentation/views/detail/detail_page.dart';
import 'package:mim/src/presentation/views/home/home_page.dart';
import 'package:mim/src/presentation/views/share/shared_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    const String sharedPage = '/shared';
    const String homePage = '/';
    const String detailPage = '/detail';
    late final args = settings.arguments as String;
    late final multiargs = settings.arguments as List<dynamic>;
    switch (settings.name) {
      case sharedPage:
        return MaterialPageRoute(
            builder: (context) => SharedPage(multiargs: multiargs));

      case homePage:
        return MaterialPageRoute(builder: (context) => const HomePage());

      case detailPage:
        return MaterialPageRoute(
            builder: (context) => DetailPage(
                  url: args,
                ));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(title: const Text('ERROR'), centerTitle: true),
        body: const Center(
          child: Text('Page not Found'),
        ),
      );
    });
  }
}
