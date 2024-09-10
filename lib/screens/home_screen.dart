import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/voice_to_text_service.dart';
import '../services/text_to_speech_service.dart';
import 'dialer_screen.dart'; // Import the DialerScreen
import 'caller_screen.dart'; // Import the CallerScreen
import 'receiver_screen.dart'; // Import the ReceiverScreen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final voiceService = Provider.of<VoiceToTextService>(context);
    final ttsService = Provider.of<TextToSpeechService>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Nagish Indian Version')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Language Selection Dropdown
            DropdownButton<String>(
              value: voiceService.selectedLanguage,
              onChanged: (String? newValue) {
                voiceService.changeLanguage(newValue!);
                ttsService.changeLanguage(newValue);
              },
              items: <String>['en_IN', 'hi_IN', 'ta_IN', 'te_IN']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CallerScreen()),
                );
              },
              child: Text('Caller'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReceiverScreen()),
                );
              },
              child: Text('Receiver'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DialerScreen()),
                );
              },
              child: Text('Open Dialer'),
            ),
          ],
        ),
      ),
    );
  }
}
