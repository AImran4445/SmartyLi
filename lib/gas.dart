import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LabGasScreen extends StatefulWidget {
  const LabGasScreen({Key? key}) : super(key: key);

  @override
  State<LabGasScreen> createState() => _LabGasScreenState();
}

class _LabGasScreenState extends State<LabGasScreen> {
  bool _gasDetected = false;

  void _getGasStatus() async {
    final clientId =
        '2KrIiqA6NUlLdlLSKU8tTG8HsFJxATzV'; // replace with your client ID
    final clientSecret =
        'ecbUa0FTs2xgcSxOSLkXafhrNFz2bVAYMHs0jzWO3XwRCkcLE1WWZNRWiLdKLZkr';
    final thingId = 'e6433034-e9ee-4c85-a4ba-15d25966ed85';
    final url =
        'https://api2.arduino.cc/iot/v2/things/e6433034-e9ee-4c85-a4ba-15d25966ed85/properties/{21212}?show_deleted=true';
    final auth =
        'Basic ' + base64Encode(utf8.encode('$clientId:$clientSecret'));

    final response =
        await http.get(Uri.parse(url), headers: {'Authorization': auth});

    if (response.statusCode == 200) {
      final gasStatus = jsonDecode(response.body)['value'];
      setState(() {
        _gasDetected = gasStatus == 'detected';
      });
    } else {
      // Handle error response
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Color.fromRGBO(94, 97, 244, 1),
                    ),
                  ),
                  const RotatedBox(
                    quarterTurns: 135,
                    child: Icon(
                      Icons.bar_chart_rounded,
                      color: Color.fromRGBO(94, 97, 244, 1),
                      size: 28,
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(height: 80),
                    Center(
                      child: Icon(
                        Icons.local_gas_station,
                        size: 170,
                        color: Colors.grey[300],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: Text(
                        _gasDetected
                            ? 'Gas Leakage Detected'
                            : 'No Gas Leakage Detected',
                        style: TextStyle(
                          color: _gasDetected
                              ? Colors.red
                              : Color.fromRGBO(94, 97, 244, 1),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getGasStatus,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
