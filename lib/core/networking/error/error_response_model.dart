class ErrorResponseModel {
  final bool success;
  final String message;
  final String? details;

  ErrorResponseModel({
    required this.success,
    required this.message,
    this.details,
  });

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) {
    return ErrorResponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? 'Something went wrong.',
      details: json['details'],
    );
  }
}
