/// Weather information.
class Weather {
  /// Cloudiness, %
  final int? clouds;

  /// Group of weather parameters (Rain, Snow, Extreme etc.)
  final String condition;

  /// Time of data calculation.
  final DateTime dateTime;

  /// Weather condition within the group. You can get the output in your language.
  final String description;

  /// Atmospheric pressure on the ground level, hPa.
  final int? groundLevel;

  /// Humidity, %.
  final int humidity;

  /// Weather icon id.
  final String? iconId;

  /// Maximum temperature.
  ///
  /// This is maximal currently observed temperature in Kelvin
  /// (within large megalopolises and urban areas).
  final double maxTemperature;

  /// Minimum temperature.
  ///
  /// This is minimal currently observed temperature in Kelvin
  /// (within large megalopolises and urban areas).
  final double minTemperature;

  /// Probability of precipitation.
  final double? pop;

  /// Atmospheric pressure (on the sea level, if there is no [seaLevel] or
  /// [groundLevel] data), in hPa (Hectopascal).
  final int pressure;

  /// Rain volume for the last 1 hour, mm.
  final double? rainLastHour;

  /// Rain volume for the last 3 hours, mm.
  final double? rainLastThreeHours;

  /// Atmospheric pressure on the sea level, hPa.
  final int? seaLevel;

  /// Temperature in Kelvin.
  final double temperature;

  /// This temperature parameter accounts for the human perception
  /// of weather in Kelvin.
  final double? temperatureFeelsLike;

  /// Average visibility, metres.
  final int? visibility;

  /// Wind direction, degrees (meteorological).
  final int? windDirection;

  /// Wind gust in meter/sec.
  final double? windGust;

  /// Wind speed in meter/sec.
  final double windSpeed;

  const Weather({
    this.clouds,
    required this.condition,
    required this.dateTime,
    required this.description,
    this.groundLevel,
    required this.humidity,
    this.iconId,
    required this.maxTemperature,
    required this.minTemperature,
    this.pop,
    required this.pressure,
    this.rainLastHour,
    this.rainLastThreeHours,
    this.seaLevel,
    required this.temperature,
    this.temperatureFeelsLike,
    this.visibility,
    this.windDirection,
    this.windGust,
    required this.windSpeed,
  });

  /// This is maximal currently observed temperature in Celsius degrees.
  double get maxTemperatureInCelsius => maxTemperature - 273.15;

  /// This is maximal currently observed temperature in Fahrenheit degrees.
  double get maxTemperatureInFahrenheit => 1.8 * maxTemperature - 459.67;

  /// This is minimal currently observed temperature in Celsius degrees.
  double get minTemperatureInCelsius => minTemperature - 273.15;

  /// This is minimal currently observed temperature in Fahrenheit degrees.
  double get minTemperatureInFahrenheit => 1.8 * minTemperature - 459.67;

  /// Returns atmospheric pressure (on the sea level, if there is no [seaLevel] or
  /// [groundLevel] data), in mmHg (Milímetros de mercurio).
  int get pressureInMillimetersOfMercury => (pressure * 0.7501).toInt();

  /// Returns atmospheric pressure (on the sea level, if there is no [seaLevel] or
  /// [groundLevel] data), in atm (Atmosphere).
  int get pressureInAtmosphere => (pressure * 0.000987).toInt();

  /// Return the temperature feels like in Celsius degrees.
  double? get temperatureFeelsLikeInCelsius => temperatureFeelsLike! - 273.15;

  /// Returns the temperature feels like in Fahrenheit degrees.
  double? get temperatureFeelsLikeInFahrenheit =>
      1.8 * temperatureFeelsLike! - 459.67;

  /// Returns the temperature in Celsius degrees.
  double get temperatureInCelsius => temperature - 273.15;

  /// Returns the temperature in Fahrenheit degrees.
  double get temperatureInFahrenheit => 1.8 * temperature - 459.67;

  /// Returns the wind speed in kilometers per hour.
  double get windSpeedInKilometersPerHour => windSpeed * 3.6;

  /// Returns the wind speed in knots.
  double get windSpeedInKnots => windSpeed * 1.9438;

  /// Returns the wind speed in miles per hour.
  double get windSpeedInMilesPerHour => windSpeed * 2.237;
}
