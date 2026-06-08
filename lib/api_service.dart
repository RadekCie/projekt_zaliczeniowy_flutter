import 'dart:convert';
import 'package:http/http.dart' as http;
import 'character_model.dart';

class ApiService {
  static const String baseUrl = 'https://hp-api.onrender.com/api';

  Future<List<Character>> fetchCharacters() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/characters'));

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        return body.map((dynamic item) => Character.fromJson(item)).toList();
      } else {
        throw Exception('Błąd serwera: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Nie udało się pobrać danych. Sprawdź połączenie internetowe.');
    }
  }

  Future<Character> fetchCharacterDetails(String id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/character/$id'));

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        if (body.isNotEmpty) {
          return Character.fromJson(body[0]);
        } else {
          throw Exception('Nie znaleziono postaci.');
        }
      } else {
        throw Exception('Błąd serwera: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Nie można załadować szczegółów postaci.');
    }
  }
}