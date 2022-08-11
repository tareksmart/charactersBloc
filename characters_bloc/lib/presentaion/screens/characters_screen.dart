

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
  late List<CharactersModel> _searchedCharList;//=<CharactersModel>[];
  bool _isSearched = false;

  @override
  void initState() {
    BlocProvider.of<CharactersCubit>(context).getAllCharacter();
    //CharactersCubitهنا الكونتكست جاى من ال
    super.initState();

    //استدعاء اللbloc ,وايقاظه من حالة ال lazy,لازم تحط genric type عشان تستدعى getallcharacter
  }

  Widget buildBlockWidegt() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharacterLoaded) {
          allCharacters = state.charactersList;
          return SingleChildScrollView(
            child: Container(
              color: Colors.amber,
              child: Column(children: [
                buildCharactersList(),
              ]),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
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
        itemCount:_searchControl.text.isEmpty? allCharacters.length:_searchedCharList.length,
        itemBuilder: (ctx, index) {
          return characterItem(
              character:_searchControl.text.isEmpty? allCharacters[index]:_searchedCharList[index]);
        });
  }

  TextEditingController _searchControl = TextEditingController();
  Widget buildTextSearchField() {
    return TextFormField(
      controller: _searchControl,
      decoration: InputDecoration(
        hintText: 'find charachter...',
        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
      ),
      onChanged: (scharacter) {
        _searchedCharList = allCharacters
            .where((character) =>
                character.name!.toLowerCase().startsWith(scharacter))
            .toList();//text changed طريقة البحث باول حرف
        setState(() {

        });
      },
    );
  }
  List<Widget> buildActionButton(){
    if(_isSearched){
      return [
        IconButton(onPressed: (){
          setState(() {
            _searchControl.clear();
            Navigator.pop(context);
            //_isSearched=true;
          });

        }, icon:Icon(Icons.clear) ),
      ];

    }
    else
      {
        return
        [
          IconButton(onPressed: (){
            _isSearched=true;
            //السطر ده بيعمل كانك فتحت صفحة جديدة او رحت لراوت جديد اللى بيظهر فيها سهم الرجوع
            //المهم هى بتظهر زر رجوع فى صندوق البحث
            ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove:(){
              setState(() {

                _isSearched=false;
                _searchControl.clear();
              });

            } ));
          }, icon:Icon(Icons.search) )
        ];


      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:_isSearched?buildTextSearchField(): Text('charachter'),
      actions: buildActionButton(),),
      body: buildBlockWidegt(),

    );
  }
}
