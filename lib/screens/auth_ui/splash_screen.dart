import 'dart:async';

import 'package:e_commerece/screens/auth_ui/Welcome_screen.dart';
import 'package:e_commerece/screens/user_panel/main_screen.dart';
import 'package:e_commerece/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
 // const SplashScreen({super.key, required builder});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
      Get.offAll(()=>WelcomeScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
  //  final Size= MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppConstent.appSecondaryColor,
      appBar: AppBar(
        backgroundColor: AppConstent.appSecondaryColor,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Lottie.asset('assets/images/Animation.json'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              width: Get.width,
              alignment: Alignment.center,
              child: Text(AppConstent.appPoweredBy,style: TextStyle(color: AppConstent.appTextColor
              ,fontSize: 17,fontWeight: FontWeight.bold
              ),),
            )
          ],
        ),
      ),

    );
  }
}
