class Episodes{
  int? episode_id;
  String? title;
  String? season;
  String? air_date;
  List<String>? characters;

  Episodes(this.episode_id, this.title, this.season, this.air_date,
      this.characters);

  Episodes.fromJason(Map<String,dynamic>json){
    episode_id=json['episode_id'];
    title=json['title'];
    season=json['season'];
    air_date=json['air_date'];
    characters=json['characters'];

  }
}
