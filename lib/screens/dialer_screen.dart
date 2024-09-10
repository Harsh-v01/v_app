import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class DialerScreen extends StatefulWidget {
  @override
  _DialerScreenState createState() => _DialerScreenState();
}

class _DialerScreenState extends State<DialerScreen> {
  String _dialedNumber = '';

  void _addToDialedNumber(String number) {
    setState(() {
      _dialedNumber += number;
    });
  }

  void _callNumber() async {
    if (_dialedNumber.isNotEmpty) {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: _dialedNumber,
      );
      if (await canLaunch(launchUri.toString())) {
        await launch(launchUri.toString());
      } else {
        _showError('Could not launch $launchUri');
      }
    } else {
      _showError('Please enter a number to call.');
    }
  }

  void _clearNumber() {
    setState(() {
      _dialedNumber = '';
    });
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dialer')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _dialedNumber.isEmpty ? 'Enter Number' : _dialedNumber,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              children: List.generate(10, (index) {
                return ElevatedButton(
                  onPressed: () => _addToDialedNumber(
                      (index + 1) % 10 == 0 ? '0' : '${index + 1}'),
                  child: Text((index + 1) % 10 == 0 ? '0' : '${index + 1}'),
                );
              }),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _callNumber,
              child: Text('Call'),
            ),
            ElevatedButton(
              onPressed: _clearNumber,
              child: Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }
}
