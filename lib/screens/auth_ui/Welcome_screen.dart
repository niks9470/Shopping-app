import 'package:e_commerece/controllers/google_sign_In_Controller.dart';
import 'package:e_commerece/screens/auth_ui/Sign_In_Screen.dart';
import 'package:e_commerece/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
   WelcomeScreen({super.key});
  final GoogleSignInController _googleSignInController = Get.put(GoogleSignInController());

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: AppConstent.appSecondaryColor,
        title: Text("Welcome to my app",style: TextStyle(color: AppConstent.appTextColor),),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(child:Lottie.asset("assets/images/Animation.json"),
            ),
            Container(
              margin: EdgeInsets.only(top: 2),
              child: Text("Happy Shopping",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: Get.height/18,),
            Material(
              child: Container(
                decoration: BoxDecoration(
                  color: AppConstent.appSecondaryColor,
                  borderRadius: BorderRadius.circular(20)
                ),
                //height: 70,width: 300,
              height: Get.height/15,width: Get.width/1.2,
                child:TextButton.icon( icon:Image.asset("assets/images/GoogleIcons.png",
                  width:Get.width/8,height:Get.height/7,
                ),
                  label: Text("Sign in with google",
                    style: TextStyle(color:AppConstent.appTextColor,fontSize: 20),
                  ),
                  onPressed: (){
                    _googleSignInController.signInWithGoogle();
                  },
                )
              ),
            ),
            SizedBox(height:8,),
            Material(
              child: Container(
                  decoration: BoxDecoration(
                      color: AppConstent.appSecondaryColor,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  //height: 70,width: 300,
                  height: Get.height/15,width: Get.width/1.2,
                  child:TextButton.icon(onPressed: (){
                    Get.to(()=>SignInScreen());
                  }, label: Text("Sign in with email",
                    style: TextStyle(color:AppConstent.appTextColor,fontSize: 20),),
                   icon: Icon(Icons.email,color: Colors.white,),
              ),
            ))
        ],
      ),
      ),
    );
  }
}
