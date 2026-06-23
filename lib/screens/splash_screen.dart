import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/utils/asset_path.dart';
import 'package:task_manager/widget/screen_bg.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      moveToNextScreen();
    });
  }

  Future<void>moveToNextScreen()async {
    Future.delayed(Duration(seconds: 10));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(child: Center(child: Image.asset(AssetPath.logoPNG))
      ),
    );
  }
}
