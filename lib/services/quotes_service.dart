import 'package:dio/dio.dart';
import 'package:quotes_app/constants.dart';
import 'package:quotes_app/models/quotes_model.dart';

class QuotesService {
  Dio dio = Dio();

  Future<List<QuotesModel>> getQuote() async {
    try {
      Response response = await dio.get(baseUrl);

      if (response.data is List) {
        List<dynamic> jsonList = response.data;

        List<QuotesModel> quotes = jsonList.map((dynamic item) {
          return QuotesModel.fromJson(item);
        }).toList();

        return quotes;
      } else {
        throw Exception('Unexpected response format');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
