import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/yugioh_card_model.dart';

class YugiohApiService {
  Future<List<YugiohCardModel>> fetchYugiohData() async {
    final url = Uri.parse('https://db.ygoprodeck.com/api/v7/cardinfo.php');

    final response = await http.get(url).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      final List list = body['data'];

      return list.map((e) => YugiohCardModel.fromJson(e)).toList();
    } else {
      throw Exception('Error ${response.statusCode}');
    }
  }
}
