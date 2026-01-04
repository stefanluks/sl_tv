import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://apinotas-ubn4.onrender.com/';

  // GET simples
  static Future<List<dynamic>> get(String rota) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/$rota'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Erro ${response.statusCode}');
    }
  }

  // GET Objetos
  static Future<Map<String, dynamic>> getObject(String rota) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/$rota'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Erro ${response.statusCode}');
    }
  }
}
