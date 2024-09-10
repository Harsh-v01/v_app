import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/voice_to_text_service.dart';

class VoiceToTextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final voiceService = Provider.of<VoiceToTextService>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Voice to Text')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              voiceService.recognizedText,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: voiceService.isListening
                  ? voiceService.stopListening
                  : voiceService.startListening,
              child: Text(voiceService.isListening ? 'Stop' : 'Start'),
            ),
          ],
        ),
      ),
    );
  }
}
