import 'package:assignment/src/app_routes.dart';
import 'package:assignment/src/app_strings.dart';
import 'package:assignment/src/common_widgets.dart';
import 'package:assignment/view/register/controller/register_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/validations.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Container(
                height: Get.height,
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(20, Get.height * 0.2, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CommonWidgets()
                        .commonTitleText(title: AppStrings.registerHere),
                    emailView(),
                    passwordView(),
                    confirmPasswordView(),
                    submitButtonView(),
                    CommonWidgets().commonOrText(),
                    googleButtonView()
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: goToSignInView(),
          ),
        ),
      ),
    );
  }

  Widget emailView() {
    return CommonWidgets().commonTextFormField(
        controller: controller.emailEditController,
        hintText: AppStrings.email,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          return Validation.validateEmail(value!);
        });
  }

  Widget passwordView() {
    return Obx(
      () => CommonWidgets()
          .commonTextFormField(
              controller: controller.passwordEditController,
              hintText: AppStrings.password,
              keyboardType: TextInputType.visiblePassword,
              obscureText: controller.isPasswordVisible.value,
              suffixIcon: GestureDetector(
                  onTap: () {
                    controller.isPasswordVisible.toggle();
                  },
                  child: controller.isPasswordVisible.value
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off)),
              validator: (value) {
                return Validation.validatePassword(value!);
              })
          .paddingOnly(top: 20, bottom: 20),
    );
  }

  Widget confirmPasswordView() {
    return Obx(() => CommonWidgets().commonTextFormField(
        controller: controller.confirmPasswordEditController,
        hintText: AppStrings.confirmPassword,
        keyboardType: TextInputType.visiblePassword,
        obscureText: controller.isConfirmPasswordVisible.value,
        suffixIcon: GestureDetector(
            onTap: () {
              controller.isConfirmPasswordVisible.toggle();
            },
            child: controller.isConfirmPasswordVisible.value
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off)),
        validator: (value) {
          return Validation.validateConfirmPassword(
              value!, controller.passwordEditController.text);
        }));
  }

  Widget submitButtonView() {
    return CommonWidgets().commonSubmitButton(
        heading: AppStrings.continueButton,
        onTap: () {
          if (controller.formKey.currentState?.validate() == true) {
            CommonWidgets().showSnackBar(AppStrings.success, AppStrings.validationDone);
            debugPrint("Validation Passed");
          }
        });
  }


  Widget googleButtonView() {
    return CommonWidgets().commonSubmitButton(
        heading: AppStrings.googleButton,
        onTap: () {
          controller.signInWithGoogle();
        });
  }

  Widget goToSignInView() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: RichText(
        text: TextSpan(
          text: AppStrings.already,
          style: const TextStyle(color: Colors.black),
          children: <TextSpan>[
            TextSpan(
                text: AppStrings.signIn,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.delete<RegisterController>();
                    Get.toNamed(AppRoutes.loginView);
                  }),
          ],
        ),
      ),
    );
  }
}
