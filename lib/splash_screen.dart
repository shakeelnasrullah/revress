import 'package:flutter/material.dart';
import 'package:revress/app_colors.dart';
import 'package:revress/dashboard/dashboard_screen.dart';
import 'package:revress/login/login_screen.dart';


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
      //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.background,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/app_icon_white.png",
                width: 300,
                height: 150,
                fit: BoxFit.fill,
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/tesla_car.png",
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
