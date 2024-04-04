import 'package:flutter/material.dart';
import 'package:chatting/SlideScreen/slide_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to SlideScreen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => OnboardingView(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5, // 60% of available space
              child: Container(
                width: double.infinity,
                child: Image.asset(
                  "assets/splash02.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 1, // 15% of available space
              child: Container(
                width: double.infinity,
                child: Image.asset(
                  "assets/travl.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 2, // 25% of available space
              child: Container(
                width: double.infinity,
                child: Image.asset(
                  "assets/splas01.jpg",
                  fit: BoxFit.fitWidth, // Adjusted BoxFit to fitWidth
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
