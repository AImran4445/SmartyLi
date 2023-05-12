// import 'package:flutter/material.dart';
// class LabFireScreen extends StatefulWidget {
//   const LabFireScreen({super.key});

//   @override
//   State<LabFireScreen> createState() => _LabFireScreenState();
// }

// class _LabFireScreenState extends State<LabFireScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.indigo.shade50,
//        body: SafeArea(
//         child: Container(
//           margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Icon(
//                       Icons.arrow_back_ios,
//                       color: Color.fromRGBO(94, 97, 244, 1),
//                     ),
//                   ),
//                   const RotatedBox(
//                     quarterTurns: 135,
//                     child: Icon(
//                       Icons.bar_chart_rounded,
//                       color:Color.fromRGBO(94, 97, 244, 1) ,
//                       size: 28,
//                     ),
//                   )
//                 ],
//               ),
//                 Expanded(child: ListView(physics:const BouncingScrollPhysics(),
//             children: [
//                 const SizedBox(height: 80),
//               Center(child: Image.asset('assets/images/bell.png',
//               width: 170,
//               height: 170,
//               scale: 1.2,),
//                  ),
//                   const SizedBox(height: 40),
//                     const Center(
//                       child: Text(
//                         'Alarm Notification',
//                         style: TextStyle(
//                           color: Color.fromRGBO(94, 97, 244, 1),
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                  ]
//                   ),
//                 ),
//        ] )
//         )
//         )
//         );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LabFireScreen extends StatefulWidget {
  const LabFireScreen({super.key});

  @override
  State<LabFireScreen> createState() => _LabFireScreenState();
}

class _LabFireScreenState extends State<LabFireScreen> {
  bool _isAlarmActive = false;

  @override
  void initState() {
    super.initState();
    _checkAlarmStatus();
  }

  Future<void> _checkAlarmStatus() async {
    final clientId = '2KrIiqA6NUlLdlLSKU8tTG8HsFJxATzV'; // replace with your client ID
    final clientSecret = 'ecbUa0FTs2xgcSxOSLkXafhrNFz2bVAYMHs0jzWO3XwRCkcLE1WWZNRWiLdKLZkr'; 

    final String apiUrl ='https://api2.arduino.cc/iot/v2/things/e6433034-e9ee-4c85-a4ba-15d25966ed85/properties/{21212}?show_deleted=true';
    final Uri apiUri = Uri.parse(apiUrl);

    final Map<String, String> headers = {
      'content-type': 'application/json',
      'authorization': 'Bearer $clientId:$clientSecret',
    };

    final http.Response response = await http.get(apiUri, headers: headers);
    final dynamic data = jsonDecode(response.body);

    setState(() {
      _isAlarmActive = data['alarm_active'];
    });

    if (_isAlarmActive) {
      // Generate a notification
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
                      child: Image.asset(
                        'assets/images/bell.png',
                        width: 170,
                        height: 170,
                        scale: 1.2,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: Text(
                        'Alarm Notification',
                        style: TextStyle(
                          color: Color.fromRGBO(94, 97, 244, 1),
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
    );
  }
}
