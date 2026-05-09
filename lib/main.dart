import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get_storage/get_storage.dart';
import 'package:magic_app/routes/app_routes.dart';
import 'package:magic_app/routes/app_routes_file.dart';

void main() async {
  // 👇 THIS IS THE FIX FOR THE CRASH ("Could not create root isolate")
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize storage after the binding
  await GetStorage.init();

  runApp(const MyApp());
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
        initialRoute: AppRoutes.signInScreen,
        // 👇 THIS IS THE FIX FOR NAVIGATION
        getPages: AppRoutesFile.routes,

        /// Smooth fade transition globally
        defaultTransition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 400),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
      ),
    );
  }
}
