part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}
//هنا فى كلاس كيبوبيت ستيت باعمل ستيت للبيانات اللى هاشتغل عليها 
//تحت مثلا عامل كاراكتر لوديد  ستيت على اساس ان فى حالة استقبال البيانات على شكل ليست من الكاراكتر
//وبتتخزن فى متغير كاراكتر ليست
//بمررها فى characterLoaded state to emit data or state to ui
class CharacterLoaded extends CharactersState {
  final List<CharactersModel> charactersList;

  CharacterLoaded(this.charactersList);
}
//ممكن نعمل state تانى و cubit تانى
class QuoteLoaded extends CharactersState{
  final List<quotes> quoteList;
  QuoteLoaded(this.quoteList);
}
class CharacterLoadedError extends CharactersState {
  final dynamic charactersError;

  CharacterLoadedError(this.charactersError);
}
