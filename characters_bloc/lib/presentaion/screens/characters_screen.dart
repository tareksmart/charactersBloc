import 'package:characters_bloc/bloc/cubit/characters_cubit.dart';
import 'package:characters_bloc/data/model/characters_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late List<CharactersModel> allCharacters;

  @override
  void initState() {
    allCharacters=  BlocProvider.of<CharactersCubit>(context)
        .getAllCharacter();
    super.initState();

   //استدعاء اللbloc ,وايقاظه من حالة ال lazy,لازم تحط genric type عشان تستدعى getallcharacter
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('charachter')),
      body: ListWheelScrollView(
        itemExtent:40.0,
        children: [
          Text('1'),
          Text('2'),
          Text('3'),
          Text('4'),
          Text('5'),
        ],
      ),
    );
  }
}
