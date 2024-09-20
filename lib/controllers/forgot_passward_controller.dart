import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerece/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ForgotPasswardController extends GetxController{
  final FirebaseAuth _auth =FirebaseAuth.instance;
  final FirebaseFirestore _firestore =FirebaseFirestore.instance;



  Future<void> ForgotPasswardMethod(
      String UserEmail,
     )async{
    try {
      EasyLoading.show(status: "Please show");
      EasyLoading.dismiss();

    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Error", "$e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstent.appSecondaryColor,
          colorText: AppConstent.appTextColor);

    }
  }
}