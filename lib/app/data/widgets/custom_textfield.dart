import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextField extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final RxBool showSuffixIcon = false.obs;
  final RxBool hideSuffixIcon;
  TextEditingController controller ;

  MyTextField({
    Key? key,
    required this.hintText,
    required this.obscureText,
    required this.hideSuffixIcon,
    required this.controller,
  }) : super(key: key);

  void toggleSuffixIcon() {
    showSuffixIcon.value = !showSuffixIcon.value;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: Color(0xFF777777)),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: hideSuffixIcon.value
              ? IconButton(
                  icon: Icon(showSuffixIcon.value
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: toggleSuffixIcon,
                )
              : null, // Return null when hideSuffixIcon is true.
        ),
        obscureText: obscureText && !showSuffixIcon.value,
      );
    });
  }
}
