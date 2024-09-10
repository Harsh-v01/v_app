import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter/material.dart';

class VoiceToTextService with ChangeNotifier {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _recognizedText = "";
  String _selectedLanguage = 'en_IN'; // Default language

  bool get isListening => _isListening;
  String get recognizedText => _recognizedText;
  String get selectedLanguage => _selectedLanguage;

  Future<void> initSpeech() async {
    bool available = await _speech.initialize(
      onStatus: (status) => print('Status: $status'),
      onError: (error) => print('Error: $error'),
    );

    if (available) {
      notifyListeners();
    }
  }

  void startListening() async {
    _isListening = true;
    _speech.listen(
      onResult: (val) {
        _recognizedText = val.recognizedWords;
        notifyListeners();
      },
      localeId: _selectedLanguage,
    );
  }

  void stopListening() {
    _isListening = false;
    _speech.stop();
    notifyListeners();
  }

  void changeLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners();
  }
}
