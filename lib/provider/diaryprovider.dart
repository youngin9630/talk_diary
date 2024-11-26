// lib/providers/diary_provider.dart
import 'package:flutter/foundation.dart';
import '../services/api_service.dart';

class DiaryProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  String _message = '';

  String get message => _message;

  Future<void> fetchTestMessage() async {
    try {
      _message = await _apiService.getTest();
      notifyListeners();
    } catch (e) {
      print('Error: $e');
    }
  }
}
