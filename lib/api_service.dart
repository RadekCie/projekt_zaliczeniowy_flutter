import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'character_model.dart';

class ApiService {
  static const String baseUrl = 'https://hp-api.onrender.com/api';

  final Box _cacheBox = Hive.box('hp_cache');

  Future<List<Character>> fetchCharacters() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/characters'));

      if (response.statusCode == 200) {
        await _cacheBox.put('characters_list', response.body);

        List<dynamic> body = jsonDecode(response.body);
        return body.map((dynamic item) => Character.fromJson(item)).toList();
      } else {
        throw Exception('Błąd serwera: ${response.statusCode}');
      }
    } catch (e) {
      if (_cacheBox.containsKey('characters_list')) {
        String cachedData = _cacheBox.get('characters_list');
        List<dynamic> body = jsonDecode(cachedData);
        return body.map((dynamic item) => Character.fromJson(item)).toList();
      } else {
        throw Exception('Brak połączenia z internetem i brak zapisanych danych offline.');
      }
    }
  }

  Future<Character> fetchCharacterDetails(String id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/character/$id'));

      if (response.statusCode == 200) {
        await _cacheBox.put('character_$id', response.body);

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
      if (_cacheBox.containsKey('character_$id')) {
        String cachedData = _cacheBox.get('character_$id');
        List<dynamic> body = jsonDecode(cachedData);
        return Character.fromJson(body[0]);
      } else {
        throw Exception('Jesteś offline. Szczegóły tej postaci nie były wcześniej przeglądane.');
      }
    }
  }
}