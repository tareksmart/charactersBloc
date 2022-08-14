import 'package:characters_bloc/Routes_method/routes.dart';
import 'package:characters_bloc/bloc/cubit/characters_cubit.dart';
import 'package:characters_bloc/data/api/character_web_service.dart';
import 'package:characters_bloc/data/model/characters_model.dart';
import 'package:characters_bloc/data/repo/character_repository.dart';
import 'package:characters_bloc/presentaion/screens/characters_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentaion/screens/characeters_details.dart';

class SPecialRouter {
  late CharacterRepository characterRepository;
  late CharactersCubit charactersCubit;
  //late CharacterWebServic characterWebServic;عملت مشكلة
  SPecialRouter() {
    //حطهم هنا عشان هيستخدمهم لما يمرر
    //blockprovider لشاشة تانبه
    //عن طريق blockporvider.value
    characterRepository = CharacterRepository(CharacterWebServic());
    charactersCubit = CharactersCubit(characterRepository);
    
  }
  Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.characters:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => CharactersCubit(characterRepository),
                  child: CharacterScreen(),
                ));
    /*
لو عايز امرر ال cubit المعرف فوق فى ال constructor اللى هو ده
 charactersCubit = CharactersCubit(characterRepository);
يبقى هاعمل
BlockProvider.value(
كده معناه ان البلوك مش فوق الشاشة بتاعت details هو فوق شاشة
characterScreen
واللى تحتها.
بكده انا بمرر بلوك من شاشة الى شاشة اخرى لاتمت بصلة او مش موجوده فى نفس شجرى ال character Screen
*/
       
      case Routes.charactersDetail:
        final character=setting.arguments as CharactersModel;
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (BuildContext cont)=>CharactersCubit(characterRepository),
            child: Charactersdetails(character: character,)));
    }
  }
}
