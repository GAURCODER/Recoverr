import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lost_found/core/secrets/base_url.dart';

Future<String> getItemLabel(String imageUrl) async {
  String apiUrl = BaseUrl.apiUrl;

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'imageUrl': imageUrl,
      }),
    );

    final data = json.decode(response.body);
    var label = data['predicted_label'];

    return label;
  } catch (e) {
    throw Exception(e.toString());
  }
}
