import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:magic_app/firebase_options.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:magic_app/routes/app_routes.dart';
import 'package:magic_app/routes/app_routes_file.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.signOut(); // temporary - test করার পর remove করো
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Magic',
        initialRoute: AppRoutes.splashScreen,
        getPages: AppRoutesFile.routes,
        defaultTransition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 400),
        theme: ThemeData(
          fontFamily: 'SFPro',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF2D1454),
            brightness: Brightness.dark,
          ),
          scaffoldBackgroundColor: const Color(0xFF2D1454),
        ),
      ),
    );
  }
}