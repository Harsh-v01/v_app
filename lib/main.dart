import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/voice_to_text_service.dart';
import 'services/text_to_speech_service.dart';
import 'screens/home_screen.dart'; // Ensure this import is present

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VoiceToTextService()),
        ChangeNotifierProvider(create: (context) => TextToSpeechService()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sandesh',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), // Use the HomeScreen from home_screen.dart
    );
  }
}

// Remove this HomeScreen class
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _textController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final voiceService = Provider.of<VoiceToTextService>(context);
//     final ttsService = Provider.of<TextToSpeechService>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Nagish Indian Version'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.settings),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => SettingsScreen()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Same UI as before with Voice-to-Text and Text-to-Speech sections
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _textController.dispose(); // Dispose of the controller
//     super.dispose(); // Call super.dispose() to clean up resources
//   }
// }
