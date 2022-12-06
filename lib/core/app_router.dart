import 'package:breaking_bad/business%20logic%20layer/cubit/characters_cubit.dart';
import 'package:breaking_bad/core/constants/strings.dart';
import 'package:breaking_bad/data/repositries/characters_repository.dart';
import 'package:breaking_bad/data/web_services/characters_web_services.dart';
import 'package:breaking_bad/presentation/screens/character_details.dart';
import 'package:breaking_bad/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());

    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (BuildContext context) =>
                      CharactersCubit(charactersRepository),
                  child: const CharactersScreens(),
                ));

      case characterDetailScreen:
        return MaterialPageRoute(
            builder: ((context) => const CharacterDetailsScreen()));
    }
    return null;
  }
}
