import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/',
          (Route<dynamic> route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Lottie.network(
                    'https://assets3.lottiefiles.com/packages/lf20_ii6qdbgz.json',
                    width: 500,
                    height: 500,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
