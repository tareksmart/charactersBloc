import 'package:characters_bloc/data/model/characters_model.dart';
import 'package:characters_bloc/links.dart';
import 'package:dio/dio.dart';

class CharacterWebServic {
  late Dio dio; //بدل مكتبة http

  CharacterWebServic() {
    BaseOptions options = BaseOptions(
        baseUrl: apiLink,
        receiveDataWhenStatusError: true,
        connectTimeout: 20 * 1000,
        receiveTimeout: 20 * 1000);
    dio = Dio(options);
  }
//هنا الداتا الراجعه على هيئة ليست من نوع characterModel
  Future<List<dynamic>> getAllCharacters() async {
    try {
      var response = await dio.get(
          'characters'); //بمرر الطلب او request//https://www.breakingbadapi.com/api/characters
      return response.data;
      print('${response.data[0]}========web');
    } on Exception catch (e) {
      print('$e');
      return [];
    }
  }

  Future<List<dynamic>> getQuoteCharacter(String character)async{
    try
        {
          var response=await dio.get('quotes',queryParameters: {'author':character});
          return response.data;
        } on Exception catch(e){
      print('$e');
      return [];
    }
  }
}
