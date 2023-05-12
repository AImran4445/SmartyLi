import 'package:flutter/material.dart';
import 'package:home/lab.dart';
import 'package:home/room.dart';

import 'Building.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
                children: const [
                  Text(
                    'Welcome, Boffe',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(94, 97, 244, 1),
                      fontWeight: FontWeight.bold,
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
            ]),
            Expanded(child: ListView(physics:const BouncingScrollPhysics(),
            children: [
                const SizedBox(height: 35),
              Center(child: Image.asset('assets/images/banner.png',
              scale: 1.2,),
             ),
             const SizedBox(height: 15),
                    const Center(
                      child: Text(
                        'SmartyLi',
                        style: TextStyle(
                          color: Color.fromRGBO(94, 97, 244, 1),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                      const SizedBox(height: 30),
                    const Text(
                      'SERVICES',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _cardMenu(
                           onTap: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RoomScreen(),
                              ),
                            );},
                          title: 'Room', icon: 'assets/images/cpu.png',
                  
                  
                          
                        ),
                          _cardMenu(
                             onTap: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LabScreen(),
                              ),
                            );},
                          title: 'LAB', icon: 'assets/images/lab.png',
                          
                        ),
                        
            ],),
                 const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _cardMenu(
                           onTap: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BuildingScreen(),
                              ),
                            );},
                          title: 'Building features', icon: 'assets/images/building.png',
                          
                        ),
                         _cardMenu(
                          title: 'Add Sensor', icon: 'assets/images/sensor.png',
                          
                        ),
                        
            ])
            
            ],
              )
              )
      ] ),
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
        width: 150,
       
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


