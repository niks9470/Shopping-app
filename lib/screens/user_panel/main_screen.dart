import 'package:e_commerece/screens/auth_ui/Welcome_screen.dart';
import 'package:e_commerece/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppConstent.appSecondaryColor,
          statusBarIconBrightness: Brightness.light
        ),
        backgroundColor: AppConstent.AppMainColor,
        title:Text(AppConstent.appMainName),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: ()async{
            GoogleSignIn googleSignIn =GoogleSignIn();
            FirebaseAuth _auth =FirebaseAuth.instance;
            await _auth.signOut();
            await googleSignIn.signOut();
            Get.offAll(()=>WelcomeScreen());
          },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.logout),
            ),
          )
        ],
      ),

    );
  }
}
