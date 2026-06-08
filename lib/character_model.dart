class Character {
  final String id;
  final String name;
  final String house;
  final String image;
  final String actor;
  final String patronus;
  final bool alive;

  Character({
    required this.id,
    required this.name,
    required this.house,
    required this.image,
    required this.actor,
    required this.patronus,
    required this.alive,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Nieznane imię',
      house: json['house'] != null && json['house'].toString().isNotEmpty
          ? json['house']
          : 'Brak Domu',
      image: json['image'] ?? '',
      actor: json['actor'] ?? 'Nieznany aktor',
      patronus: json['patronus'] != null && json['patronus'].toString().isNotEmpty
          ? json['patronus']
          : 'Brak',
      alive: json['alive'] ?? true,
    );
  }
}