import 'package:flutter/material.dart';
import 'Fan.dart';
import 'Light.dart';
import 'Temperature.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({super.key});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
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
                        ' Room',
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
                                builder: (context) => const Temperature(),
                              ),
                            );},
                         
                          title: 'Temp-Humidity', icon: 'assets/images/Temperature.png',
                          
                          // color: Color.fromRGBO(94, 97, 244, 1),
                          // fontColor: Colors.white,
                          
                        ),
                        //   _cardMenu(
                        //      onTap: () { Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => const HumidityScreen(),
                        //       ),
                        //     );},
                        //   title: 'Humidity', icon: 'assets/images/humidity.png',
                          
                        // ),
                        
            ],),
           
             const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _cardMenu(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LightScreen(),
                          ),
                        );
                      },

                      title: 'Light',
                      icon: 'assets/images/lightbulb.png',

                      // color: Color.fromRGBO(94, 97, 244, 1),
                      // fontColor: Colors.white,
                    ),
                    //   _cardMenu(
                    //      onTap: () { Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const HumidityScreen(),
                    //       ),
                    //     );},
                    //   title: 'Humidity', icon: 'assets/images/humidity.png',

                    // ),
                  ],
                ),
           
             const SizedBox(height: 30),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _cardMenu(
                           onTap: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FanScreen(),
                              ),
                            );},
                          title: 'Fan', icon: 'assets/images/fan.png',
                          
                          // color: Color.fromRGBO(94, 97, 244, 1),
                          // fontColor: Colors.white,
                          
                        ),
                        //  _cardMenu(
                        //    onTap: () { Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => const LightScreen(),
                        //       ),
                        //     );},
                        //   title: 'Light', icon: 'assets/images/lightbulb.png',
                          
                        //   // color: Color.fromRGBO(94, 97, 244, 1),
                        //   // fontColor: Colors.white,
                          
                        // ),
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
