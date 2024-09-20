import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerece/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{
  final FirebaseAuth _auth =FirebaseAuth.instance;
  final FirebaseFirestore _firestore =FirebaseFirestore.instance;

  //for passward visiblity
var isPassWardVisible =false.obs;

Future<UserCredential?> signInMethod(
    String UserEmail,
    String UserPassward) async{
  try {
    EasyLoading.show(status: "Please show");
    UserCredential userCredential =
    await _auth.signInWithEmailAndPassword(email: UserEmail,
        password: UserPassward
    );
    EasyLoading.dismiss();
    return userCredential;
  } on FirebaseAuthException catch (e) {
    EasyLoading.dismiss();
    Get.snackbar("Error", "$e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppConstent.appSecondaryColor,
        colorText: AppConstent.appTextColor);

  }
  }
}