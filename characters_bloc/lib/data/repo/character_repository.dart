import 'package:characters_bloc/data/api/character_web_service.dart';
import 'package:characters_bloc/data/model/characters_model.dart';
import 'package:characters_bloc/data/model/quotes.dart';

class CharacterRepository {
  final CharacterWebServic characterWebServic;

  CharacterRepository(this.characterWebServic);

  Future<List<CharactersModel>> getAllChar() async {
    final characters = await characterWebServic.getAllCharacters();
    var characterTolist = characters
        .map((character) => CharactersModel.fromJson(character))
        .toList();//بحول الماب اللى جاى من اب اى الى ليست

    return characterTolist;
    print('$characterTolist[0]repoo=========');
  }
  Future<List<quotes>> getQuote(String charName)async{
    final quote=await characterWebServic.getQuoteCharacter(charName);
    var quotList=quote.map((char) => quotes.fromJson(char)).toList();
    print(quotList);
    print('===========================');
    return quotList;

  }
}
