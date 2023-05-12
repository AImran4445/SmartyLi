import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MotionScreen extends StatefulWidget {
  const MotionScreen({Key? key}) : super(key: key);

  @override
  _MotionScreenState createState() => _MotionScreenState();
}

class _MotionScreenState extends State<MotionScreen> {
  bool _motionDetected = false;
  bool _isLoading = false;
  List<String> _log = [];

  @override
  void initState() {
    super.initState();
    _checkMotion();
  }

  Future<void> _checkMotion() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final response = await http.get(
        Uri.parse(
            'https://api2.arduino.cc/iot/v2/things/<your-thing-id>/properties/motion-detected/latest'),
        headers: {
          'Content-Type': 'application/json',
          'X-Auth-Token': '<your-client-id>',
          'X-Auth-Token-Secret': '<your-client-secret>',
        },
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        setState(() {
          _motionDetected = json['value'] == 1;
          _isLoading = false;
          _log.insert(
              0, '${DateTime.now()} - Motion detected: $_motionDetected');
        });
        if (_motionDetected) {
          _showNotification();
        }
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print(e);
    }
  }

  Future<void> _showNotification() async {
    // TODO: Implement notification display
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: _motionDetected ? 100 : 0,
              child: Icon(
                Icons.warning,
                color: Colors.red,
                size: 72,
              ),
            ),
            const SizedBox(height: 32),
            if (_isLoading)
              const CircularProgressIndicator()
            else
              Text(
                _motionDetected ? 'Motion detected!' : 'No motion detected.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _isLoading ? null : _checkMotion,
              child: Text(_isLoading ? 'Checking...' : 'Refresh'),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView.builder(
                itemCount: _log.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_log[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
