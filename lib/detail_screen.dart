import 'package:flutter/material.dart';
import 'api_service.dart';
import 'character_model.dart';

class DetailScreen extends StatelessWidget {
  final String characterId;
  final String characterName;

  const DetailScreen({super.key, required this.characterId, required this.characterName});

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();

    return Scaffold(
      appBar: AppBar(
        title: Text(characterName),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<Character>(
        future: apiService.fetchCharacterDetails(characterId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.deepPurple));
          }

          if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}', style: const TextStyle(color: Colors.red)));
          }

          final character = snapshot.data;
          if (character == null) {
            return const Center(child: Text('Brak danych o postaci.'));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  character.image.isNotEmpty
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(character.image, height: 300, fit: BoxFit.cover),
                  )
                      : const Icon(Icons.person, size: 150),
                  const SizedBox(height: 20),
                  Text(character.name, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Dom'),
                    subtitle: Text(character.house),
                  ),
                  ListTile(
                    leading: const Icon(Icons.auto_fix_high),
                    title: const Text('Patronus'),
                    subtitle: Text(character.patronus),
                  ),
                  ListTile(
                    leading: const Icon(Icons.movie),
                    title: const Text('Aktor'),
                    subtitle: Text(character.actor),
                  ),
                  ListTile(
                    leading: Icon(character.alive ? Icons.favorite : Icons.heart_broken, color: character.alive ? Colors.green : Colors.grey),
                    title: const Text('Status'),
                    subtitle: Text(character.alive ? 'Żyje' : 'Zmarł(a)'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}