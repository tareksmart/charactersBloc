import 'package:characters_bloc/Routes_method/routes.dart';
import 'package:characters_bloc/presentaion/screens/characters_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SPecialRouter {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.characters:
       return MaterialPageRoute(builder: (_) => CharacterScreen());

        break;
      default:
       return MaterialPageRoute(builder: (_) => CharacterScreen());
    }
  }
}
