import 'package:breaking_bad/business%20logic%20layer/cubit/characters_cubit.dart';
import 'package:breaking_bad/core/constants/my_colors.dart';
import 'package:breaking_bad/data/models/characters.dart';
import 'package:breaking_bad/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreens extends StatefulWidget {
  const CharactersScreens({super.key});

  @override
  State<CharactersScreens> createState() => _CharactersScreensState();
}

class _CharactersScreensState extends State<CharactersScreens> {
  late List<Character> allCharacters;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    allCharacters =
        BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: ((context, state) {
      if (state is CharactersLoaded) {
        allCharacters = (state).characters;
        return buildLoadedListWidgets();
      } else {
        return showLoadingIndicator();
      }
    }));
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [buildCharactersList()],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: allCharacters.length,
        itemBuilder: ((context, index) {
          return CharacterItem(
            character: allCharacters[index],
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: const Text(
          'Characters',
          style: TextStyle(color: MyColors.myGrey),
        ),
      ),
      body: buildBlocWidget(),
    );
  }
}
