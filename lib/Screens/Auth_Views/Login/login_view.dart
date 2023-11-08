import 'package:booknplay/Constants.dart';
import 'package:booknplay/Routes/routes.dart';
import 'package:booknplay/Screens/Auth_Views/Login/login_controller.dart';
import 'package:booknplay/Utils/Colors.dart';
import 'package:booknplay/Utils/extentions.dart';
import 'package:booknplay/Widgets/app_button.dart';
import 'package:booknplay/Widgets/auth_custom_design.dart';
import 'package:booknplay/Widgets/commen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginController(),
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  customAuthDegine(context, 'Login'),
                  Padding(
                    // padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3.1),
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
                          topRight: Radius.circular(30),
                          // Top-right corner radius
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio(
                                  value: 'Email',
                                  groupValue: controller.login,
                                  onChanged: (value) {
                                    controller.updateLoginType(value ?? '');
                                  },
                                  activeColor: AppColors.secondary,
                                ),
                                const Text(
                                  "Email",
                                  style: TextStyle(
                                      color: AppColors.fntClr, fontSize: 20),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Radio(
                                  value: 'Mobile no.',
                                  groupValue: controller.login,
                                  onChanged: (value) {
                                    controller.updateLoginType(value ?? '');
                                  },
                                  activeColor: AppColors.secondary,
                                ),
                                const Text(
                                  'Mobile No',
                                  style: TextStyle(
                                      color: AppColors.fntClr, fontSize: 20),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),

                              Form(
                                key: _formkey,
                                child: Column(
                                  children: [
                                    if (controller.num == 0)   Column(children: [
                                      textField(
                                          title: 'Email',
                                          prefixIcon: Icons.email,
                                          controller: _email),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      textField(
                                          title: 'Password',
                                          prefixIcon: Icons.lock,
                                          controller: _password),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                              onPressed: () {
                                                Get.toNamed(forgotPasswordScreen);
                                                //Get.toNamed(signupScreen);
                                              },
                                              child: const Text(
                                                'Forgot Password?',
                                                style: TextStyle(
                                                    color: AppColors.secondary,
                                                    fontSize: 15),
                                              ))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],) else textField(
                                        title: 'Mobile Number',
                                        prefixIcon: Icons.phone,
                                        inputType: TextInputType.phone,
                                        maxLength: 10,
                                        controller: _mobile),
                                    controller.num == 1 ? const SizedBox(height: 100,) : const SizedBox.shrink(),
                                    Obx(
                                      () =>  Padding(
                                        padding: const EdgeInsets.only(left: 25, right: 25),
                                        child: controller.isLoading.value ? const Center(child: CircularProgressIndicator(),) : AppButton(title: controller.num != 0 ? 'Send OTP' : 'Login',onTap: (){
                                          if(controller.num != 0){
                                            controller.sendOtp(mobile: _mobile.text);
                                          }else {
                                            controller.loginUser(email: _email.text, password: _password.text);
                                          }
                                        }),
                                      ),
                                    ),
                                      const SizedBox(
                                      height: 80,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                           const Text(
                                          "Don't have an account?",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.fntClr),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              Get.toNamed(signupScreen);
                                            },
                                            child: const Text(
                                              'Sign Up',
                                              style: TextStyle(
                                                  color: AppColors.secondary,
                                                  fontSize: 15),
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
