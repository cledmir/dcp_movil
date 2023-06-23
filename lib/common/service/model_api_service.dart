import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'https://despliegue-tp2-docker.azurewebsites.net';

  Future<dynamic> predictImage(String imageUrl) async {
    final url = Uri.parse(
        '$baseUrl/predict?image_link=${Uri.encodeComponent(imageUrl)}');
    print("el url a enviar al api es $url");
    final response = await http.post(url);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return jsonResponse;
    } else {
      throw Exception(
          'Failed to predict image. Status code: ${response.statusCode}');
    }
  }
}
