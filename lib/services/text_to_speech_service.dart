import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';

class TextToSpeechService with ChangeNotifier {
  final FlutterTts _flutterTts = FlutterTts();
  String _selectedLanguage = 'en-IN'; // Default language

  String get selectedLanguage => _selectedLanguage;

  Future<void> speak(String text) async {
    await _flutterTts.setLanguage(_selectedLanguage);
    await _flutterTts.setPitch(1.0);
    await _flutterTts.speak(text);
  }

  Future<void> stop() async {
    await _flutterTts.stop();
  }

  void changeLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners();
  }
}
