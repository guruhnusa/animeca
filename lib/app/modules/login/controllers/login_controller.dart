import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailCon = TextEditingController(text: "test@gmail.com");
  TextEditingController passCon = TextEditingController(text:"123123" );

  @override
  void dispose() {
    emailCon.dispose();
    passCon.dispose();
    super.dispose();
  }
}
