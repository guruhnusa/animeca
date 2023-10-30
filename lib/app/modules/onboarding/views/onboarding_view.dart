import 'package:animeca/app/data/constraint/color_style.dart';
import 'package:animeca/app/data/constraint/text_style.dart';
import 'package:animeca/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset("assets/images/bg_onboarding.png"),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("ANIMECA.",
                  style: textBold.copyWith(fontSize: 48, color: color3),),
                Container(
                  width: 143,
                  child: Text("Watch your favorite anime for free",style: textRegular.copyWith(fontSize: 14,color: Colors.white),textAlign: TextAlign.center,)
                ),
                SizedBox(height: 25,),
                Container(
                  height: 42,
                  width: 159,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        backgroundColor: color2
                      ),
                      onPressed: () {
                        Get.offAllNamed(Routes.LOGIN);
                  }, child: Text("Start",style: textSemibold.copyWith(fontSize: 20,color: Colors.white),)),
                )
                  ],
            ),
          ],
        ));
  }
}
