/// Wind information.
class Wind {
  /// Define a [Wind] class.
  const Wind({
    this.direction,
    this.gust,
    this.speed = 0.0,
  });

  /// Wind direction, degrees (meteorological).
  final int? direction;

  /// Wind gust. (meter/sec).
  final double? gust;

  /// Wind speed, default is 0.0. (meter/sec).
  final double speed;

  /// Factory that returns a [Wind] class from [json] Map.
  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: double.tryParse(json['speed'].toString()) ?? 0.0,
      direction: int.tryParse(json['deg'].toString()),
      gust: double.tryParse(json['gust'].toString()),
    );
  }

  /// Returns the wind [gust] in kilometers per hour, if not null.
  double? get gustInKilometersPerHour => gust == null ? gust : gust! * 3.6;

  /// Returns the wind [gust] in knots, if not null.
  double? get gustInKnots => gust == null ? gust : gust! * 1.9438;

  /// Returns the wind [gust] in miles per hour, if not null.
  double? get gustInMilesPerHour => gust == null ? gust : gust! * 2.237;

  /// Returns the wind [speed] in kilometers per hour.
  double get speedInKilometersPerHour => speed * 3.6;

  /// Returns the wind [speed] in knots.
  double get speedInKnots => speed * 1.9438;

  /// Returns the wind [speed] in miles per hour.
  double get speedInMilesPerHour => speed * 2.237;
}
