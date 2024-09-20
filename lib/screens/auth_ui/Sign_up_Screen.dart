import 'package:e_commerece/controllers/Sign_up_controller.dart';
import 'package:e_commerece/screens/auth_ui/Sign_In_Screen.dart';
import 'package:e_commerece/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

import '../../controllers/Sign_up_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController signUpController = Get.put(SignUpController());
  TextEditingController UserName = TextEditingController();
  TextEditingController UserEmail = TextEditingController();
  TextEditingController UserPhone = TextEditingController();
  TextEditingController UserCity = TextEditingController();
  TextEditingController UserPassward = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstent.appSecondaryColor,
          title: Text("Sign up"),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Container(
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Welcome to my app",
                        style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            color: AppConstent.appSecondaryColor),
                      )),
                  SizedBox(height: Get.height / 20),
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
                              hintText: "Email",
                              prefixIcon: Icon(Icons.email),
                              contentPadding: EdgeInsets.only(top: 2, left: 8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      )),
                  SizedBox(
                    height: Get.height / 40,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: TextFormField(
                          controller: UserName,
                          cursorColor: AppConstent.appSecondaryColor,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              hintText: "UserName",
                              prefixIcon: Icon(Icons.person),
                              contentPadding: EdgeInsets.only(top: 2, left: 8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      )),
                  SizedBox(height: Get.height / 40),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: TextFormField(
                          controller: UserPhone,
                          cursorColor: AppConstent.appSecondaryColor,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              hintText: "Phone",
                              prefixIcon: Icon(Icons.phone),
                              contentPadding: EdgeInsets.only(top: 2, left: 8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      )),
                  SizedBox(height: Get.height / 40),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: TextFormField(
                          controller: UserCity,
                          cursorColor: AppConstent.appSecondaryColor,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                              hintText: "City",
                              prefixIcon: Icon(Icons.location_on_outlined),
                              contentPadding: EdgeInsets.only(top: 2, left: 8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      )),
                  SizedBox(height: Get.height / 80),
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
                                  signUpController.isPasswardVisible.value,
                              obscuringCharacter: "*",
                              decoration: InputDecoration(
                                  hintText: "Passward",
                                  prefixIcon: Icon(Icons.password),
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        signUpController.isPasswardVisible
                                            .toggle();
                                      },
                                      child: signUpController
                                              .isPasswardVisible.value
                                          ? Icon(Icons.visibility_off_rounded)
                                          : Icon(Icons.visibility)),
                                  contentPadding:
                                      EdgeInsets.only(top: 1, left: 5),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ))),
                  SizedBox(
                    height: Get.height / 30,
                  ),
                  Material(
                    child: Container(
                        height: Get.height / 18,
                        width: Get.width / 2,
                        decoration: BoxDecoration(
                            color: AppConstent.appSecondaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                          onPressed: () async {
                            String name = UserName.text.trim();
                            String email = UserEmail.text.trim();
                            String phone = UserPhone.text.trim();
                            String city = UserCity.text.trim();
                            String passward = UserPassward.text.trim();
                            String userDeviceToken = "";

                            if (name.isEmpty ||
                                email.isEmpty ||
                                phone.isEmpty ||
                                city.isEmpty ||
                                passward.isEmpty) {
                              Get.snackbar("Error", "Please enter all details",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor:
                                      AppConstent.appSecondaryColor,
                                  colorText: AppConstent.appTextColor);
                            } else {
                              UserCredential? userCredential =
                                  await signUpController.signUpMethod(
                                name,
                                email,
                                city,
                                passward,
                                phone,
                                userDeviceToken,
                              );
                              if(userCredential!=null){
                                Get.snackbar("Verification email sent", "Please check your Email",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor:
                                    AppConstent.appSecondaryColor,
                                    colorText: AppConstent.appTextColor);
                              }
                              FirebaseAuth.instance.signOut();
                              Get.offAll(()=>SignInScreen());
                            }
                          },
                          child: Text(
                            "SIGN UP",
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
                        "Already have an account?",
                        style: TextStyle(color: AppConstent.appSecondaryColor),
                      ),
                      GestureDetector(
                          onTap: () => Get.offAll(() => SignInScreen()),
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w900),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
