class quotes {

  String? quote;


  quotes({ this.quote, });

  quotes.fromJson(Map<String, dynamic> json) {

    quote = json['quote'];

  }


}