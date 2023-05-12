import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WaterScreen extends StatefulWidget {
  const WaterScreen({Key? key}) : super(key: key);

  @override
  _WaterScreenState createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  bool _isTankFull = false;

  Future<void> _checkTankLevel() async {
    // Replace the API endpoint, client ID, and client secret with your own
    final String endpoint ='https://api2.arduino.cc/iot/v2';
    final String clientId = '2KrIiqA6NUlLdlLSKU8tTG8HsFJxATzV';
    final String clientSecret = 'ecbUa0FTs2xgcSxOSLkXafhrNFz2bVAYMHs0jzWO3XwRCkcLE1WWZNRWiLdKLZkr';

    final response = await http.get(
      Uri.parse('$endpoint?client_id=$clientId&client_secret=$clientSecret'),
    );

    final decodedResponse = json.decode(response.body);

    setState(() {
      _isTankFull = decodedResponse['is_tank_full'];
    });
  }

  @override
  void initState() {
    super.initState();
    _checkTankLevel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Water Tank'),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.blue[50],
            border: Border.all(width: 5, color: Colors.blue[900]!),
          ),
          child: Stack(
            children: [
              Positioned(
                top: _isTankFull ? 20 : 380,
                left: 20,
                right: 20,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  height: _isTankFull ? 360 : 20,
                  decoration: BoxDecoration(
                    color: _isTankFull ? Colors.blue[900] : Colors.blue[300],
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                      bottom: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  _isTankFull ? 'Tank Full' : 'Tank Not Full',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
