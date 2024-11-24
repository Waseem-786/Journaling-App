import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:journaling_app/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenStartState();
}

class _SplashScreenStartState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
      () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginScreen()))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image: AssetImage("assets/images/splash_screen_background.jpeg"),
                  fit: BoxFit.fitHeight
              ),
            ),
            child: Center(
              child: AnimatedTextKit(
                isRepeatingAnimation: false,
                pause: Duration(seconds: 2),
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Save Your Thoughts',
                    textStyle: GoogleFonts.protestStrike(
                      textStyle: GoogleFonts.protestStrike(
                        fontSize: 40,
                        color: Colors.purple,
                      ),
                    ),
                    speed: Duration(milliseconds: 60),
                  ),
                  TypewriterAnimatedText(
                    'Journaling...',
                    textStyle: GoogleFonts.protestStrike(
                      textStyle: GoogleFonts.protestStrike(
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                    speed: Duration(milliseconds: 80),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
