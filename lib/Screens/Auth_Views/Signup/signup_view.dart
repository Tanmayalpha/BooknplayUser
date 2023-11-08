import 'package:booknplay/Routes/routes.dart';
import 'package:booknplay/Screens/Auth_Views/Login/login_view.dart';
import 'package:booknplay/Screens/Auth_Views/Signup/signup_controller.dart';
import 'package:booknplay/Utils/Colors.dart';
import 'package:booknplay/Utils/extentions.dart';
import 'package:booknplay/Widgets/app_button.dart';
import 'package:booknplay/Widgets/auth_custom_design.dart';
import 'package:booknplay/Widgets/commen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SignupController(),
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: [
                      customAuthDegine(context, 'Sign Up'),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 3.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              // Top-left corner radius
                              topRight: Radius.circular(
                                  30), // Top-right corner radius
                              // Bottom-right corner with no rounding
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 20, left: 20, top: 30),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  textField(
                                      title: 'Name',
                                      prefixIcon: Icons.person,
                                      controller: nameController),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  textField(
                                      title: 'Email',
                                      prefixIcon: Icons.email,
                                      controller: emailController),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  textField(
                                      title: 'Mobile Number',
                                      prefixIcon: Icons.phone,
                                      inputType: TextInputType.phone,
                                      maxLength: 10,
                                      controller: mobileController),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  textField(
                                      title: 'Password',
                                      prefixIcon: Icons.lock,
                                      controller: passwordController),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Obx(
                                    () => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        child: controller.isLoading.value
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                            : AppButton(
                                                title: 'Sign Up',
                                                onTap: () {

                                                  if(_formKey.currentState!.validate()) {
                                                    controller.registerUser(
                                                        email: emailController
                                                            .text,
                                                        mobile: mobileController
                                                            .text,
                                                        password:
                                                            passwordController
                                                                .text,
                                                        name: nameController
                                                            .text);
                                                  }
                                                },
                                              )),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.asset(
                                              'assets/images/facebook (4).png'),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.asset(
                                              'assets/images/google.png'),
                                        )
                                      ]),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Already have an account?",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Get.toNamed(loginScreen);
                                          },
                                          child: const Text(
                                            'Log In',
                                            style: TextStyle(
                                                color: AppColors.secondary,
                                                fontSize: 16),
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
