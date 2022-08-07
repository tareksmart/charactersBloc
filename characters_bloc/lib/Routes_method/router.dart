import 'package:characters_bloc/Routes_method/routes.dart';
import 'package:characters_bloc/bloc/cubit/characters_cubit.dart';
import 'package:characters_bloc/data/api/character_web_service.dart';
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

       
      case Routes.charactersDetail:
        return MaterialPageRoute(builder: (_) => Charactersdetails());
    }
  }
}
