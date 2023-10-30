import 'package:animeca/app/controllers/auth_controller.dart';
import 'package:animeca/app/data/constraint/color_style.dart';
import 'package:animeca/app/data/constraint/text_style.dart';
import 'package:animeca/app/data/widgets/clipper.dart';
import 'package:animeca/app/data/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final AuthCon = Get.find<AuthController>();
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              ClipPath(
                clipper: ParallelogramClipper(),
                child: Container(
                  height: 260,
                  width: 411,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/images_login.png"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Text(
                "Welcome Back !",
                style: textSemibold.copyWith(fontSize: 30, color: Colors.white),
              ),
              const SizedBox(
                height: 34,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MyTextField(
                  controller: controller.emailCon,
                    hintText: "Enter Your Email",
                    obscureText: false,
                    hideSuffixIcon: RxBool(false)),
              ),
              const SizedBox(
                height: 11,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MyTextField(
                      controller: controller.passCon,
                        hintText: "Enter Your Password",
                        obscureText: true,
                        hideSuffixIcon: RxBool(true)),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                        onTap: () {
                          print("object");
                        },
                        child: Text(
                          "Forgot Password ?",
                          style:
                          textRegular.copyWith(fontSize: 11, color: color4),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: color2),
                      onPressed: () {
                        AuthCon.login(controller.emailCon.text, controller.passCon.text);
                      },
                      child: Text(
                        "Login",
                        style: textSemibold.copyWith(
                            fontSize: 20, color: Colors.white),
                      )),
                ),
              ),
              const SizedBox(height: 21,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t have an account ?", style: textRegular.copyWith(
                      fontSize: 13, color: Colors.white),),
                  InkWell(
                      onTap: () {

                      },
                      child: Text(" Sign Up", style: textRegular.copyWith(
                          fontSize: 13, color: color4),))
                ],
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color1
                  ),
                  onPressed: () {
                AuthCon.googleLogin();
              }, child: Text("Login With Google",style: textMedium.copyWith(fontSize: 12),))
            ],
          ),
        ));
  }
}
