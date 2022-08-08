import 'package:characters_bloc/bloc/cubit/characters_cubit.dart';
import 'package:characters_bloc/data/model/characters_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/character_item.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late List<CharactersModel> allCharacters;

  @override
  void initState() {
    allCharacters = BlocProvider.of<CharactersCubit>(context).getAllCharacter();
    //CharactersCubitهنا الكونتكست جاى من ال
    super.initState();

    //استدعاء اللbloc ,وايقاظه من حالة ال lazy,لازم تحط genric type عشان تستدعى getallcharacter
  }

  Widget buildBlockWidegt() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharacterLoaded) {
          allCharacters = (state).charactersList;
          return SingleChildScrollView(
            child: Container(
              color: Colors.amber,
              child: Column(children: [
                buildCharactersList(),
              ]),
            ),
          );
        } else {
          return CircularProgressIndicator(color: Colors.red,);
        }
      },
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2 / 3,
          mainAxisSpacing: 1,
        ),
          shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: allCharacters.length,
        itemBuilder: (ctx, index) {
          return characterItem(character: allCharacters[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('charachter')),
      body: buildBlockWidegt(),
    );
  }
}
