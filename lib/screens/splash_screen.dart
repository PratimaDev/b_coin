import 'dart:async';
import 'package:b_coin/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Color _backgroundColor;
  bool showFinalScreen = false;

  @override
  void initState() {
    super.initState();

    // Fade Animation Controller
    _fadeController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_fadeController);

    // Scale Animation Controller (for growing effect)
    _scaleController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.2).animate(_scaleController);

    // Initial White Screen
    _backgroundColor = Colors.white;

    // Start Animations
    Timer(const Duration(seconds: 1), () {
      setState(() {
        _backgroundColor = Colors.black;
      });
      _fadeController.forward();
      _scaleController.forward();
    });

    // Transition back to White screen
    Timer(const Duration(seconds: 4), () {
      setState(() {
        showFinalScreen = true;
        _backgroundColor = Colors.white;
      });
    });

    // Move to next screen
    Timer(const Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) =>  OnboardingScreen()));
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
        color: _backgroundColor,
        child: Center(
          child: showFinalScreen
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Final Logo
              Image.asset('assets/logo.png', width: 120.w, height: 120.h),
               SizedBox(height: 15.h),
              // Final Text with Stroke
              Text(
                "B Coin",
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 0.5.r,
                      color: Colors.amber.shade700 ,
                      offset: Offset(2, 2) ,
                    )
                  ],
                ),
              )
            ],
          )
              : FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Image.asset('assets/logo.png', width: 120.w, height: 120.h),
            ),
          ),
        ),
      ),
    );
  }
}


