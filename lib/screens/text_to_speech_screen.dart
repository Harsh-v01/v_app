import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/text_to_speech_service.dart';

class TextToSpeechScreen extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ttsService = Provider.of<TextToSpeechService>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Text to Speech')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _textController,
                decoration: InputDecoration(labelText: 'Enter text to speak'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => ttsService.speak(_textController.text),
                child: Text('Speak'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
