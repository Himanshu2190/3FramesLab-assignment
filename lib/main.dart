import 'package:assignment/src/app_keys.dart';
import 'package:assignment/src/app_routes.dart';
import 'package:assignment/view/home/binding/home_binding.dart';
import 'package:assignment/view/home/view/home_view.dart';
import 'package:assignment/view/login/binding/login_binding.dart';
import 'package:assignment/view/login/view/login_view.dart';
import 'package:assignment/view/register/binding/register_binding.dart';
import 'package:assignment/view/register/view/register_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: AppKeys.apiKey,
          appId: AppKeys.appId,
          messagingSenderId: '',
          projectId: AppKeys.projectId)
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.registerView,
      getPages: [
        GetPage(
            name: AppRoutes.registerView,
            page: () => const RegisterView(),
            binding: RegisterBinding()),
        GetPage(
            name: AppRoutes.loginView,
            page: () => const LoginView(),
            binding: LoginBinding()),
        GetPage(
            name: AppRoutes.homeView,
            page: () => const HomeView(),
            binding: HomeBinding()),
      ],
    );
  }
}
