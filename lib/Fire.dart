import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FireScreen extends StatefulWidget {
  const FireScreen({Key? key}) : super(key: key);

  @override
  State<FireScreen> createState() => _FireScreenState();
}

class _FireScreenState extends State<FireScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _isFireAlert = false;



  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showNotification() async {
    setState(() {
      _isFireAlert = true;
    });

    // Play sound effect

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Fire Alert'),
          content: const Text('There is a fire in the building!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  _isFireAlert = false;
                });
              },
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _isFireAlert
                            ? Colors.redAccent
                            : Color.fromRGBO(94, 97, 244, 1),
                      ),
                      child: ScaleTransition(
                        scale: _animation,
                        child: GestureDetector(
                          onTap: _showNotification,
                          child: Icon(
                            Icons.local_fire_department,
                            color: Colors.white,
                            size: 150,
                          ),
                        ),
                      ),
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
