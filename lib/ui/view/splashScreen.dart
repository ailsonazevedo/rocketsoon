import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rocketsoon/ui/rocketTheme.dart';
import 'package:rocketsoon/ui/view/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

 class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushNamed('/home');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RocketTheme(),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              SpinKitFadingCircle(
                color: Color(0xFF03A9F4),
                size: 50,
              ),
                          SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: Image(
                  image: AssetImage("assets/img/rocket.png"),
                  width: 450,
                  height: 450,
                ),
              ),

              ],
              )
              ),
      ),
  );
  }


}

