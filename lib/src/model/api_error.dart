/// Errors information when the data cannot be obtained.
class ApiError {
  /// Define a [ApiError] class.
  const ApiError({required this.code, required this.message});

  /// Error code, check https://openweathermap.org/faq#api-errors for all errors.
  final int code;

  /// Error resume. check https://openweathermap.org/faq#api-errors for all errors.
  final String message;

  /// Factory that returns [ApiError] class from [json] Map.
  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      code: int.parse(json['cod'].toString()),
      message: json['message'] as String,
    );
  }

  /// Returns a map of the class.
  Map<String, dynamic> toJson() {
    return {'cod': code, 'message': message};
  }
}
