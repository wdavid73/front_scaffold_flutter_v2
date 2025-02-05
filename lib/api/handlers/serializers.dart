Map<String, dynamic> serializerQueryParams(Map<String, dynamic>? queryParams) {
  Map<String, dynamic> validatedParams = {};

  if (queryParams == null) return validatedParams;

  queryParams.forEach((key, value) {
    if (value != null && value.toString().trim().isNotEmpty) {
      validatedParams[key] = value;
    }
  });

  return validatedParams;
}