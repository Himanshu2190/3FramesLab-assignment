import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonWidgets {

  // common bold text
  Widget commonTitleText({String? title}) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 70),
      child: Text(
        title ?? "",
        style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: Get.height * 0.03),
      ),
    );
  }

  // common textFormField
  Widget commonTextFormField(
      {TextEditingController? controller,
      String? hintText,
      TextInputType? keyboardType,
      String? Function(String?)? validator,
      Widget? suffixIcon,
      bool? obscureText}) {
    return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          isDense: true,
          counterText: "",
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1,
              )),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1,
              )),
          hintText: hintText,
          labelText: hintText,
          labelStyle: const TextStyle(color: Colors.black),
          hintStyle: const TextStyle(color: Colors.black),
          suffixIcon: suffixIcon,
        ),
        validator: validator);
  }

  // common button
  Widget commonSubmitButton({String? heading, void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        alignment: Alignment.center,
        width: Get.width,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        child: Text(
          heading ?? "",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: Get.height * 0.021),
        ).paddingOnly(top: 10, bottom: 10),
      ),
    );
  }

  // snackbar
  showSnackBar(String? title, String? message) {
    if (!Get.isSnackbarOpen) {
      return Get.snackbar(title ?? "", message ?? "",
          backgroundColor: Colors.black, colorText: Colors.white);
    }
  }

  // common or text
  Widget commonOrText() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Text(
        "or",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: Get.height * 0.025),
      ),
    );
  }
}
