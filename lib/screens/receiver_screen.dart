import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/text_to_speech_service.dart';

class ReceiverScreen extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ttsService = Provider.of<TextToSpeechService>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Receiver')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Transcribed Text Here'), // Replace with actual text
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: 'Type your response'),
            ),
            ElevatedButton(
              onPressed: () {
                ttsService.speak(_textController.text);
                // Send the response back to the caller
              },
              child: Text('Send Response'),
            ),
          ],
        ),
      ),
    );
  }
}
