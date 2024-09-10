import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/voice_to_text_service.dart';
import '../../services/text_to_speech_service.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the services using Provider
    final voiceService = Provider.of<VoiceToTextService>(context);
    final ttsService = Provider.of<TextToSpeechService>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Language:', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: voiceService.selectedLanguage,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  voiceService.changeLanguage(newValue);
                  ttsService.changeLanguage(newValue);
                }
              },
              items: <String>['en_IN', 'hi_IN', 'ta_IN', 'te_IN']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Divider(),
            SwitchListTile(
              title: Text('Enable Data Privacy'),
              value: true, // Example value
              onChanged: (bool value) {
                // Implement privacy settings change
              },
            ),
          ],
        ),
      ),
    );
  }
}
