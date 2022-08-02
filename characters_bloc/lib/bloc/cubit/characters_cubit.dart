import 'package:bloc/bloc.dart';
import 'package:characters_bloc/data/api/character_web_service.dart';
import 'package:characters_bloc/data/model/characters_model.dart';
import 'package:characters_bloc/data/repo/character_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';
/*
cubit class his job is to send state to ui
her we intend نحضر data or state from repo and passing it to characterloaded state
and return list of characters
*/ 
class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepository characterRepository;
  late List<CharactersModel> charactersList;
  CharactersCubit(this.characterRepository)
      : super(CharactersInitial());

  List<CharactersModel> getAllCharacter() {
    characterRepository.getAllChar().then((value) {
      emit(CharacterLoaded(value));//هنا ارسلنا ال state
      this.charactersList = value;
    });
    return charactersList;
  }
}
