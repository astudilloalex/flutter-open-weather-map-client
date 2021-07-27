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
  /// This is maximal currently observed temperature
  /// (within large megalopolises and urban areas).
  /// Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
  final double maxTemperature;

  /// Minimum temperature.
  ///
  /// This is minimal currently observed temperature
  /// (within large megalopolises and urban areas).
  /// Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
  final double minTemperature;

  /// Probability of precipitation.
  final double? pop;

  /// Atmospheric pressure (on the sea level, if there is no sea_level or grnd_level data), hPa.
  final int pressure;

  /// Rain volume for the last 1 hour, mm.
  final double? rainLastHour;

  /// Rain volume for the last 3 hours, mm.
  final double? rainLastThreeHours;

  /// Atmospheric pressure on the sea level, hPa.
  final int? seaLevel;

  /// Temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
  final double temperature;

  /// Temperature. This temperature parameter accounts for the human perception
  /// of weather. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
  final double? temperatureFeelsLike;

  /// Average visibility, metres.
  final int? visibility;

  /// Wind direction, degrees (meteorological).
  final int? windDirection;

  /// Wind gust. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour
  final double? windGust;

  /// Wind speed. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour.
  final double windSpeed;

  Weather({
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
}
