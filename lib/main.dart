import 'package:e_commerece/firebase_options.dart';
import 'package:e_commerece/screens/auth_ui/Sign_up_Screen.dart';
import 'package:e_commerece/screens/auth_ui/Welcome_screen.dart';
import 'package:e_commerece/screens/auth_ui/splash_screen.dart';
import 'package:e_commerece/screens/user_panel/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'screens/auth_ui/Sign_In_Screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  SplashScreen(),
      builder:EasyLoading.init(),
      );

  }
}
