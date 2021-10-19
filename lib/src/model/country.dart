import 'package:open_weather_map_client/src/common/constants.dart';

/// Country information.
class Country {
  /// Country ISO 3166-1 code
  final String code;

  /// Country english name
  final String name;

  /// Define a Country class with code and name.
  const Country({
    required this.code,
    required this.name,
  });

  /// Factory that initializes the Country class by its ISO 3166-1 [code].
  factory Country.fromCode(String code) {
    return Country(
      code: code.toUpperCase(),
      name: kCountries[code.toUpperCase()] ?? 'NOT FOUND',
    );
  }
}
