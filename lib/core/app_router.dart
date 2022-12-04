import 'package:breaking_bad/core/constants/strings.dart';
import 'package:breaking_bad/presentation/screens/character_details.dart';
import 'package:breaking_bad/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
            builder: (context) => const CharactersScreens());

      case characterDetailScreen:
        return MaterialPageRoute(
            builder: ((context) => const CharacterDetailsScreen()));
    }
    return null;
  }
}
