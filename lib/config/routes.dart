import 'package:flutter/material.dart';

class ILRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      //TODO: Add the routes here
      case '/':
        return MaterialPageRoute(builder: (_) => Container());
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
