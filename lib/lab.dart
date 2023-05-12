import 'package:flutter/material.dart';
import 'package:home/gas.dart';
import 'Fire.dart';
import 'lab_fan.dart';
import 'lab_fire.dart';
import 'lab_light.dart';
import 'lab_smoke.dart';
import 'lab_temperature.dart';

class LabScreen extends StatefulWidget {
  const LabScreen({super.key});

  @override
  State<LabScreen> createState() => _LabScreenState();
}

class _LabScreenState extends State<LabScreen> {
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
                     RotatedBox(
                       quarterTurns: 135,
                       child: Icon(
                       Icons.bar_chart_rounded,
                        color:Color.fromRGBO(94, 97, 244, 1),
                      size: 28,
                    ),
                  )
                   ],
              ),
               const SizedBox(height: 50),
                    const Center(
                      child: Text(
                        'LAB',
                        style: TextStyle(
                          color: Color.fromRGBO(94, 97, 244, 1),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _cardMenu(
                           onTap: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LabTemperature(),
                              ),
                            );},
                          title: 'Temp-Humidity', icon: 'assets/images/Temperature.png',
                          
                          // color: Color.fromRGBO(94, 97, 244, 1),
                          // fontColor: Colors.white,
                          
                        ),
                          _cardMenu(
                             onTap: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LabGasScreen(),
                              ),
                            );},
                          title: 'Gas leakage', icon: 'assets/images/leakage.png',
                          
                        ),
                        
            ],),
              const SizedBox(height: 30),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _cardMenu(
                           onTap: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LabSmokeScreen(),
                              ),
                            );},
                          title: 'Smoke', icon: 'assets/images/smoke.png',
                          
                          // color: Color.fromRGBO(94, 97, 244, 1),
                          // fontColor: Colors.white,
                          
                        ),
                          _cardMenu(
                             onTap: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FireScreen(),
                              ),
                            );},
                          title: 'Fire', icon: 'assets/images/fire.png',
                          
                        ),
                        
            ],),
             const SizedBox(height: 30),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _cardMenu(
                           onTap: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LabFanScreen(),
                              ),
                            );},
                          title: 'Fan', icon: 'assets/images/fan.png',
                          
                          // color: Color.fromRGBO(94, 97, 244, 1),
                          // fontColor: Colors.white,
                          
                        ),
                         _cardMenu(
                           onTap: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LabLightScreen(),
                              ),
                            );},
                          title: 'Light', icon: 'assets/images/lightbulb.png',
                          
                          // color: Color.fromRGBO(94, 97, 244, 1),
                          // fontColor: Colors.white,
                          
                        ),
                        ],),
         ]
          ),
          ),
          ),
          );
  }
}

Widget _cardMenu({
    required String title,
    required String icon,
    VoidCallback? onTap,
    Color color = Colors.white,
    Color fontColor = Colors.grey,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 36,
        ),
        width: 140,
       
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
           Container(
           height: 50,
           width: 50,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(icon),
            fit: BoxFit.cover,
          ),
        ),

      ),
            const SizedBox(height: 1),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, color: fontColor),
            )
          ],
        ),
      ),
    );
  }
