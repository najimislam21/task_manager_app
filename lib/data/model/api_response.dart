class ApiResponse {


  final int responseCode;
  final dynamic responseDate;
  final bool isSuccess;
  final String? errorMassage;

  ApiResponse({
    required this.responseCode,
    required this.responseDate,
    required this.isSuccess,
    this.errorMassage,
  });
}
