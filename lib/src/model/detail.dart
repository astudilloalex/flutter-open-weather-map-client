/// Main information of the weather.
class Detail {
  /// Define a [Detail] class.
  const Detail({
    this.groundLevel,
    this.humidity,
    required this.maxTemperature,
    required this.minTemperature,
    this.pressure,
    this.seaLevel,
    required this.temperature,
    required this.temperatureFeelsLike,
  });

  /// Atmospheric pressure on the ground level, in hPa.
  final int? groundLevel;

  /// Humidity, in % (percentage).
  final int? humidity;

  /// Maximum temperature at the moment. This is maximal currently observed
  /// temperature (within large megalopolises and urban areas) in Kelvin degrees.
  final double maxTemperature;

  /// Minimum temperature at the moment. This is minimal currently observed
  /// temperature (within large megalopolises and urban areas) in Kelvin degrees.
  final double minTemperature;

  /// Atmospheric pressure (on the sea level, if there is no sea_level or
  /// grnd_level data), in hPa.
  final int? pressure;

  /// Atmospheric pressure on the sea level, in hPa.
  final int? seaLevel;

  /// Temperature in Kelvin degrees.
  final double temperature;

  /// Temperature. This temperature parameter accounts for the human perception
  /// of weather in Kelvin degrees.
  final double temperatureFeelsLike;

  /// Factory that returns [Detail] class from [json] map.
  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      groundLevel: int.tryParse(json['grnd_level'].toString()),
      humidity: int.tryParse(json['humidity'].toString()),
      maxTemperature: double.parse(json['temp_max'].toString()),
      minTemperature: double.parse(json['temp_min'].toString()),
      pressure: int.tryParse(json['pressure'].toString()),
      seaLevel: int.tryParse(json['sea_level'].toString()),
      temperature: double.parse(json['temp'].toString()),
      temperatureFeelsLike: double.parse(json['feels_like'].toString()),
    );
  }

  /// Returns a map of the class.
  Map<String, dynamic> toJson() {
    return {
      'grnd_level': groundLevel,
      'humidity': humidity,
      'temp_max': maxTemperature,
      'temp_min': minTemperature,
      'pressure': pressure,
      'sea_level': seaLevel,
      'temp': temperature,
      'feels_like': temperatureFeelsLike,
    };
  }

  /// Convert Kelvin degrees to Celsius degrees.
  double _celsius(double temperature) => temperature - 273.15;

  /// Convert Kelvin degrees to Fahrenheit degrees.
  double _fahrenheit(double temperature) => 1.8 * temperature - 459.67;

  /// Convert hPa (hectopascals) to mmHg (Millimeters of mercury).
  double _millimetersOfMercury(int pressure) => pressure * 0.7501;

  /// Convert hPa (hectopascals) to atm (Atmosphere).
  double _atmosphere(int pressure) => pressure * 0.000987;

  /// Returns [groundLevel] in atm (Atmosphere).
  double? get groundLevelAtmosphere {
    if (pressure != null) return _atmosphere(groundLevel!);
  }

  /// Returns [groundLevel] in mmHg (Millimeters Of Mercury).
  double? get groundLevelMillimetersOfMercury {
    if (groundLevel != null) return _millimetersOfMercury(groundLevel!);
  }

  /// Returns [maxTemperature] in Celsius degrees.
  double get maxTemperatureCelsius => _celsius(maxTemperature);

  /// Returns [maxTemperature] in Fahrenheit degrees.
  double get maxTemperatureFahrenheit => _fahrenheit(maxTemperature);

  /// Returns [minTemperature] in Celsius degrees.
  double get minTemperatureCelsius => _celsius(minTemperature);

  /// Returns [minTemperature] in Fahrenheit degrees.
  double get minTemperatureFahrenheit => _fahrenheit(minTemperature);

  /// Returns [pressure] in atm (Atmosphere).
  double? get pressureAtmosphere {
    if (pressure != null) return _atmosphere(pressure!);
  }

  /// Returns [pressure] in mmHg (Millimeters Of Mercury).
  double? get pressureMillimetersOfMercury {
    if (pressure != null) return _millimetersOfMercury(pressure!);
  }

  /// Returns [seaLevel] in atm (Atmosphere).
  double? get seaLevelAtmosphere {
    if (seaLevel != null) return _atmosphere(seaLevel!);
  }

  /// Returns [seaLevel] in mmHg (Millimeters Of Mercury).
  double? get seaLevelMillimetersOfMercury {
    if (seaLevel != null) return _millimetersOfMercury(seaLevel!);
  }

  /// Returns [temperatureFeelsLike] in Celsius degrees.
  double get temperatureFeelsLikeCelsius => _celsius(temperatureFeelsLike);

  /// Returns [temperatureFeelsLike] in Fahrenheit degrees.
  double get temperatureFeelsLikeFahrenheit =>
      _fahrenheit(temperatureFeelsLike);

  /// Returns [temperature] in Celsius degrees.
  double get temperatureCelsius => _celsius(temperature);

  /// Returns [temperature] in Fahrenheit degrees.
  double get temperatureFahrenheit => _fahrenheit(temperature);
}
