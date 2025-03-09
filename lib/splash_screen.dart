import 'package:bloc_state_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
      Future.delayed(Duration(seconds: 3), () {
     Navigator.pushReplacementNamed(context,AppRoutes.ROUTE_TODO);
  });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand, children: [
          Container(
            color: Colors.white,
          ),
          Center(
            child: Image.asset(
              'assets/images/bloc_image.png',
              height: 200,
              width: 200,
            ),
          ),
        ]),
      ),
    );
  }
}
