import 'package:flutter/material.dart';

class LeakageScreen extends StatefulWidget {
  const LeakageScreen({super.key});

  @override
  State<LeakageScreen> createState() => _LeakageScreenState();
}

class _LeakageScreenState extends State<LeakageScreen> {
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
                  //
                ],
              ),
                Expanded(child: ListView(physics:const BouncingScrollPhysics(),
            children: [
                const SizedBox(height: 80),
              Center(child: Image.asset('assets/images/bell.png',
              width: 170,
              height: 170,
              scale: 1.2,),
                 ),
                  const SizedBox(height: 40),
                    const Center(
                      child: Text(
                        'Alarm Notification',
                        style: TextStyle(
                          color: Color.fromRGBO(94, 97, 244, 1),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                 ]
                  ),
                ), 
       ] )
        )
        )
        );
  }
}