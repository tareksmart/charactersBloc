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
  Future <dynamic> getError()async{
    late final response;

    try {
      //404
      response=await dio.get(apiLink);

    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        // print(e.response!.data);
        // print('=========================================');
        // print(e.response!.headers);
        // print('=========================================');
        // print(e.response!.requestOptions);
        // print('=========================================');
        response=e.message;


      } else {
        // Something happened in setting up or sending the request that triggered an Error
        // print('requestOptions================');
        // print(e.requestOptions);
        // print('${e.message} e.messege');
        response=e.message;

      }
    }
    return response;
  }
}
