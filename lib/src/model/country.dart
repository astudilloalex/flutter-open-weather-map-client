import 'package:open_weather_map_client/src/constants.dart';

/// Country information.
class Country {
  /// Country ISO 3166-1 code
  final String code;

  /// Country english name
  final String name;

  Country({
    required this.code,
    required this.name,
  });

  /// Constructor that initializes the Country class by its ISO 3166-1 [code].
  Country.fromCode(String code)
      : code = code.toUpperCase(),
        name = countries[code.toUpperCase()]!;
}
