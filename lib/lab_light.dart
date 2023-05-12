import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'constant/style.dart';

class LabLightScreen extends StatefulWidget {
  const LabLightScreen({Key? key}) : super(key: key);

  @override
  _LabLightScreenState createState() => _LabLightScreenState();
}

class _LabLightScreenState extends State<LabLightScreen> {
  bool _isLightOn = false;

  Future<void> _updateLedButton(bool isOn) async {
    final clientId =
        '2KrIiqA6NUlLdlLSKU8tTG8HsFJxATzV'; // replace with your client ID
    final clientSecret =
        'ecbUa0FTs2xgcSxOSLkXafhrNFz2bVAYMHs0jzWO3XwRCkcLE1WWZNRWiLdKLZkr'; // replace with your client secret
    final baseUrl = 'https://api2.arduino.cc/iot/v2';
    final temp =
        'https://api2.arduino.cc/iot/v2/things/e6433034-e9ee-4c85-a4ba-15d25966ed85/properties/{21212}?show_deleted=true';
    final thingId =
        'e6433034-e9ee-4c85-a4ba-15d25966ed85'; // replace with your thing ID
    final thingPropertyId =
        '<YOUR_LED_PROPERTY_ID>'; // replace with your LED property ID

    final url = '$baseUrl/things/$thingId/properties/$thingPropertyId';

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $clientId $clientSecret',
    };

    final body = {'value': isOn ? '1' : '0'};
    print('r');
    final response = await http.put(Uri.parse(temp),
        headers: headers, body: jsonEncode(body));
    print(response.body);

    if (response.statusCode == 200) {
      print('LED button updated on the dashboard!');
    } else {
      print('Failed to update LED button on the dashboard!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
          color: Color.fromRGBO(94, 97, 244, 1),
        ),
        title: Text(
          'Room Light',
          style: TextStyle(
            color: Color.fromRGBO(94, 97, 244, 1),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    // color: _isLightOn ? Colors.white : Colors.grey.shade700,
                    shape: BoxShape.circle,
                  ),
                ),
                Icon(
                  _isLightOn ? Icons.lightbulb : Icons.lightbulb_outline,
                  size: 120,
                  color: _isLightOn ? Colors.white : Colors.grey.shade600,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          Colors.white.withOpacity(0.4),
                          Colors.transparent
                        ],
                        stops: [0.2, 1],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              _isLightOn ? 'Light is on' : 'Light is off',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(94, 97, 244, 1),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.wb_sunny),
                  color: Color.fromRGBO(94, 97, 244, 1),
                  iconSize: 32,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.color_lens),
                  color: Color.fromRGBO(94, 97, 244, 1),
                  iconSize: 32,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.timer),
                  color: Color.fromRGBO(94, 97, 244, 1),
                  iconSize: 32,
                ),
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _updateLedButton(true);
                  _isLightOn = !_isLightOn;
                });
                // _updateLedButton(true);
              },
              child: Text(
                _isLightOn ? 'Turn off' : 'Turn on',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: _isLightOn
                    ? Color.fromRGBO(94, 97, 244, 1)
                    : Colors.grey.shade700,
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
