/// Weather condition
class Condition {
  /// Define a [Condition] class.
  const Condition({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
    required this.iconId,
  });

  /// Weather condition ID.
  final int id;

  /// Group of weather parameters (Rain, Snow, Extreme etc.).
  final String main;

  /// Weather condition within the group. You can get the output in your language.
  final String description;

  /// Weather image icon URL.
  final String icon;

  /// Weather image icon ID from API.
  final String iconId;

  /// Factory that returns a [Weather] class from [json] Map.
  factory Condition.fromJson(Map<String, dynamic> json) {
    final String iconId = json['icon'] as String;
    return Condition(
      id: json['id'] as int,
      main: json['main'] as String,
      description: json['description'] as String,
      icon: 'https://openweathermap.org/img/wn/$iconId@4x.png',
      iconId: iconId,
    );
  }

  /// Returns a map of the class.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': iconId,
    };
  }
}
