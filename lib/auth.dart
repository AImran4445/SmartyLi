import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  List<List<dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final url = 'https://docs.google.com/spreadsheets/d/1Ql2mTg8metRkqiK8zjmJW_20Dac_pP7PdxxtJZ7CytA/edit#gid=0';
    final response = await http.get(Uri.parse(url));
    final List<List<dynamic>> csvData =
        CsvToListConverter().convert(response.body);
    setState(() {
      data = csvData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RFID Authentic Person'),
      ),
      body: data.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final row = data[index];
                return ListTile(
                  title: Text(row[0]),
                  subtitle: Text(row[1]),
                );
              },
            ),
    );
  }
}
