import 'package:flutter/material.dart';
import 'package:home/auth.dart';
import 'package:home/motion.dart';
import 'package:home/water.dart';

// import 'Building_smoke.dart';
// import 'lab_fan.dart';
// import 'lab_fire.dart';
// import 'lab_humidity.dart';
// import 'lab_light.dart';
// import 'lab_smoke.dart';
import 'leakge.dart';

class BuildingScreen extends StatefulWidget {
  const BuildingScreen({super.key});

  @override
  State<BuildingScreen> createState() => _BuildingScreenState();
}

class _BuildingScreenState extends State<BuildingScreen> {
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
                        'Building other feature',
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
                        _CardMenu(
                           onTap: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MotionScreen(),
                              ),
                            );},
                          title: 'Motion Detection', icon: 'assets/images/motion.png',
                          
                          // color: Color.fromRGBO(94, 97, 244, 1),
                          // fontColor: Colors.white,
                          
                        ),
                          ],),
                    const SizedBox(height: 30),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          _CardMenu(
                             onTap: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WaterScreen(),
                              ),
                            );},
                          title: 'Water level', icon: 'assets/images/water-level.png',
                         
                          
                        ),
                          ],),
          
              const SizedBox(height: 30),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _CardMenu(
                           onTap: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LeakageScreen(),
                              ),
                            );},
                          title: 'Garbage Detection', icon: 'assets/images/garbage.png',
                          
                          // color: Color.fromRGBO(94, 97, 244, 1),
                          // fontColor: Colors.white,
                          
                        ),
                        ],),
                   const SizedBox(height: 30),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          _CardMenu(
                             onTap: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AuthScreen(),
                              ),
                            );},
                          title: 'RFID-Card Authentication', icon: 'assets/images/authentication.png',
                          
                        ),
                         ],),
                        
            
            
         ]
          ),
          ),
          ),
          );
  }
}

Widget _CardMenu({
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
        vertical: 30,
      ),
      width: 300,
      height: 120,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // center all children
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(icon),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: fontColor,
            ),
          )
        ],
      ),
    ),
  );
}



