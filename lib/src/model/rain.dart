/// Rain information.
class Rain {
  /// Define a [Rain] class
  const Rain({this.lastHour, this.lastThreeHours});

  /// Rain volume for the last 1 hour, mm.
  final double? lastHour;

  /// Rain volume for the last 3 hours, mm.
  final double? lastThreeHours;

  /// Factory that returns a [Rain] class from [json] Map.
  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(
      lastHour: double.tryParse(json['1h'].toString()),
      lastThreeHours: double.tryParse(json['3h'].toString()),
    );
  }

  /// Returns a map of the class.
  Map<String, dynamic> toJson() {
    return {'1h': lastHour, '3h': lastThreeHours};
  }
}
