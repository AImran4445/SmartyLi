import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
class LabSmokeScreen extends StatefulWidget {
  const LabSmokeScreen({super.key});

  @override
  State<LabSmokeScreen> createState() => _LabSmokeScreenState();
}

class _LabSmokeScreenState extends State<LabSmokeScreen> {
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
                      color:Color.fromRGBO(94, 97, 244, 1) ,
                      size: 28,
                    ),
                  )
                ],
              ),
               Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: 
                  [
                  
                    const SizedBox(height: 40),
                     CircularPercentIndicator(
                      radius: 120,
                      lineWidth: 14,
                      percent: 0.30,
                      progressColor: Color.fromRGBO(94, 97, 244, 1),
                      center: const Text(
                        '10\u00B0',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Center(
                      child: Text(
                        'SMOKE IN AIR',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black54),
                      ),
                    ),
                  ]  )
               ),
            ]
       ),
       ) ,
    ),
    );
  }
}