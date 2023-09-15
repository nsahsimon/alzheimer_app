import 'package:alheimer/bindings/appBindings.dart';
import 'package:alheimer/controllers/get_storage/get_storage_controller.dart';
import 'package:alheimer/views/home/start_analyze_screen.dart';
import 'package:alheimer/views/splash/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';


main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ///Initialize firebase application
  await Firebase.initializeApp();
  ///Enable offline persistence
  FirebaseFirestore.instance.settings = const Settings(persistenceEnabled: true);
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Get.put(GetStorageController().initStorage());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        title: 'Alhaimer',
        initialBinding: InitializingControllers(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff7300E6),
          fontFamily: GoogleFonts.hindMadurai().fontFamily
        ),
        home: const SplashScreen(),
        // defaultTransition: Transition.cupertino,
      ),
    );
  }
}
