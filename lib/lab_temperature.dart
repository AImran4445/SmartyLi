// import 'package:flutter/material.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
// class LabTemperature extends StatefulWidget {
//   const LabTemperature({super.key});

//   @override
//   State<LabTemperature> createState() => _LabTemperatureState();
// }

// class _LabTemperatureState extends State<LabTemperature> {
//   @override
//   Widget build(BuildContext context) {
//      return Scaffold(
//       backgroundColor: Colors.indigo.shade50,
//       body: SafeArea(
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
//                Expanded(
//                 child: ListView(
//                   physics: const BouncingScrollPhysics(),
//                   children:
//                   [

//                     const SizedBox(height: 40),
//                      CircularPercentIndicator(
//                       radius: 120,
//                       lineWidth: 14,
//                       percent: 0.55,
//                       progressColor: Color.fromRGBO(94, 97, 244, 1),
//                       center: const Text(
//                         '23\u00B0',
//                         style: TextStyle(
//                           fontSize: 32,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 25),
//                     const Center(
//                       child: Text(
//                         'TEMPERATURE',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, color: Colors.black54),
//                       ),
//                     ),
//                   ]  )
//                ),
//             ]
//        ),
//        ) ,
//     ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:home/weather_service.dart';

class LabTemperature extends StatefulWidget {
  const LabTemperature({Key? key}) : super(key: key);

  @override
  State<LabTemperature> createState() => _LabTemperatureState();
}

class _LabTemperatureState extends State<LabTemperature> {
  double _temperature = 0.0;

  @override
  void initState() {
    super.initState();
    _fetchTemperature();
  }

  Future<void> _fetchTemperature() async {
    try {
      final temperature = await WeatherService.getCurrentTemperature();
      setState(() {
        _temperature = temperature;
      });
    } catch (e) {
      print(e);
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
                    const SizedBox(height: 40),
                    CircularPercentIndicator(
                      radius: 110,
                      lineWidth: 13,
                      percent: _temperature / 100,
                      progressColor: Color.fromRGBO(94, 97, 244, 1),
                      center: Text(
                        '${_temperature.toStringAsFixed(1)}°C',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Center(
                      child: Text(
                        'TEMPERATURE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black54),
                      ),
                    ),
                    const SizedBox(height: 40),
                    CircularPercentIndicator(
                      radius: 110,
                      lineWidth: 13,
                      percent: _temperature / 100,
                      progressColor: Color.fromRGBO(94, 97, 244, 1),
                      center: Text(
                        '${_temperature.toStringAsFixed(1)}%',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Center(
                      child: Text(
                        'HUMIDITY',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black54),
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
