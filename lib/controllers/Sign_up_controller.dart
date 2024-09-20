import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerece/models/user_model.dart';
import 'package:e_commerece/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //For passward Visiblity
  var isPasswardVisible = false.obs;

  Future<UserCredential?> signUpMethod(
    String UserName,
    String UserEmail,
    String UserPhone,
    String UserCity,
    String UserPassward,
    String UserDeviceToken,
  ) async {
    try {
      EasyLoading.show(status: "Please wait...");

      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: UserEmail, password: UserPassward);
      //Send  verification to the email
      await userCredential.user!.sendEmailVerification();

      UserModel uSerModel = UserModel(
        uId: userCredential.user!.uid,
        username: UserName,
        email: UserEmail,
        phone: UserPhone,
        userImg: "",
        userDeviceToken: UserDeviceToken,
        country: "",
        userAddress: "",
        street: "",
        isAdmin: false,
        isActive: true,
        city: UserCity,
        createOn: DateTime.now(),
      );

      // add data into database

      _firestore
          .collection("users")
          .doc(userCredential.user!.uid)
          .set(uSerModel.toMap());
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
