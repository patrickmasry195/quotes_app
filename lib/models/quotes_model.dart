class QuotesModel {
  final String quote;
  final String author;

  QuotesModel({required this.quote, required this.author});

  factory QuotesModel.fromJson(Map<String, dynamic> json) {
    return QuotesModel(
      quote: json['q'],
      author: json['a'],
    );
  }

  List<dynamic> toJson() {
    return [quote, author];
  }
}
