class SecretModel {
  String _apiKey;

  SecretModel.fromJson(Map<String, dynamic> parsedJson) {
    _apiKey = parsedJson['api_key'];
  }

  String get apiKey => _apiKey;
}