import 'package:animeca/app/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

// Import the generated file
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(myApp());
}

class myApp extends StatelessWidget {
  final authCon = Get.put(AuthController(), permanent: true);

   myApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<User?>(
      stream: authCon.authStatus(),
      builder: (context, snapshot) {
        print(snapshot.data);
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            title: "Application",
            debugShowCheckedModeBanner: false,
            //initialRoute: snapshot.data != null && snapshot.data!.emailVerified == true ? Routes.HOME  : Routes.LOGIN ,
            initialRoute: Routes.ONBOARDING,
            getPages: AppPages.routes,
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
