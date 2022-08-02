import 'package:characters_bloc/data/api/character_web_service.dart';
import 'package:characters_bloc/data/model/characters_model.dart';

class CharacterRepository {
  final CharacterWebServic characterWebServic;

  CharacterRepository(this.characterWebServic);

  Future<List<CharactersModel>> getAllChar() async {
    final characters = await characterWebServic.getAllCharacters();
    var characterToMap = characters
        .map((character) => CharactersModel.fromJson(character))
        .toList();//بحول الماب اللى جاى من اب اى الى ليست

    return characterToMap;
  }
}
