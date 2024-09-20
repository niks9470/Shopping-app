import 'package:e_commerece/controllers/Sign_in_Controller.dart';
import 'package:e_commerece/screens/auth_ui/Sign_up_Screen.dart';
import 'package:e_commerece/screens/user_panel/main_screen.dart';
import 'package:e_commerece/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController signInController = Get.put(SignInController());
  TextEditingController UserEmail = TextEditingController();
  TextEditingController UserPassward = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstent.appSecondaryColor,
          title: Text("Sign in"),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                isKeyboardVisible
                    ? Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          "welcome to my app",
                          style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              color: AppConstent.appSecondaryColor),
                        ),
                      )
                    : Column(
                        children: [
                          Lottie.asset("assets/images/Animation.json")
                        ],
                      ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: TextFormField(
                        controller: UserEmail,
                        cursorColor: AppConstent.appSecondaryColor,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: "Enter your email",
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email),
                            contentPadding: EdgeInsets.only(top: 2, left: 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: Get.width,
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Obx(
                          () => TextFormField(
                            controller: UserPassward,
                            cursorColor: AppConstent.appSecondaryColor,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText:
                                signInController.isPassWardVisible.value,
                            obscuringCharacter: "*",
                            decoration: InputDecoration(
                                labelText: "Passward",
                                hintText: "Passward",
                                prefixIcon: Icon(Icons.password),
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      signInController.isPassWardVisible
                                          .toggle();
                                    },
                                    child:
                                        signInController.isPassWardVisible.value
                                            ? Icon(Icons.visibility_off_rounded)
                                            : Icon(Icons.visibility)),
                                contentPadding:
                                    EdgeInsets.only(top: 1, left: 5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ))),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot passward?",
                    style: TextStyle(
                        color: AppConstent.appSecondaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Material(
                  child: Container(
                      height: Get.height / 18,
                      width: Get.width / 2,
                      decoration: BoxDecoration(
                          color: AppConstent.appSecondaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      //height: 70,width: 300,
                      //height: Get.height/15,width: Get.width/1.2,
                      child: TextButton(
                        onPressed: () async {
                          String email = UserEmail.text.trim();
                          String passward = UserPassward.text.trim();
                          if (email.isEmpty || passward.isEmpty) {
                            Get.snackbar("Error", "Please enter all details",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstent.appSecondaryColor,
                                colorText: AppConstent.appTextColor);
                          } else {
                            UserCredential? userCredential =
                                await signInController.signInMethod(
                                    email, passward);
                            if (userCredential != null) {
                              if (userCredential.user!.emailVerified) {
                                Get.snackbar("Sucess", "Login Sucessfully!",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor:
                                        AppConstent.appSecondaryColor,
                                    colorText: AppConstent.appTextColor);
                                Get.off(()=>MainScreen());
                              } else {
                                Get.snackbar("Error",
                                    "Please verify your email before login",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor:
                                        AppConstent.appSecondaryColor,
                                    colorText: AppConstent.appTextColor
                                );
                              }
                            }else{
                              Get.snackbar("Error", "Please try again", snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor:
                                  AppConstent.appSecondaryColor,
                                  colorText: AppConstent.appTextColor);
                            }
                          }
                        },
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(
                              color: AppConstent.appTextColor, fontSize: 20),
                        ),
                      )),
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: AppConstent.appSecondaryColor),
                    ),
                    GestureDetector(
                        onTap: () => Get.offAll(() => SignUpScreen()),
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.w900),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
