import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dcp_movil/common/widgets/flutter_toast.dart';

class ApiService {
  static const String baseUrl = 'https://dcp-api-docker.azurewebsites.net';

  Future<dynamic> predictImage(String imageUrl) async {
    final url =
        Uri.parse('$baseUrl/predict?url=${Uri.encodeComponent(imageUrl)}');
    final response = await http.post(url);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      toastInfo(msg: 'Error al crear el diagnóstico: ${response.statusCode}');
      throw Exception(
          'Failed to predict image. Status code: ${response.statusCode}');
    }
  }
}
