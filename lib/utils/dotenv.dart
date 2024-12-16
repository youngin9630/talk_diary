import 'package:flutter_dotenv/flutter_dotenv.dart';

class Dotenv {
  Dotenv._internal();

  static final Dotenv _instance = Dotenv._internal();

  factory Dotenv() => _instance;

  Future<void> load() async {
    if (dotenv.isInitialized) return;
    try {
      await dotenv.load(fileName: '.env');
    } catch (e) {
      throw Exception('Failed to find .env file.');
    }
  }

  static String get baseUrl => _get('BASE_URL');
  static String get apiUrl => _get('API_URL');
  static String get apiKey => _get('API_KEY');

  static String _get(String key) {
    final value = dotenv.env[key];
    if (value == null) {
      throw Exception('The environment variable "$key" is not set.');
    }
    return value;
  }
}
