import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/voice_to_text_service.dart';

class CallerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final voiceService = Provider.of<VoiceToTextService>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Caller')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(voiceService.recognizedText.isNotEmpty
                ? voiceService.recognizedText
                : "No text recognized"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: voiceService.startListening,
              child: Text('Start Speaking'),
            ),
            ElevatedButton(
              onPressed: voiceService.stopListening,
              child: Text('Stop'),
            ),
          ],
        ),
      ),
    );
  }
}
