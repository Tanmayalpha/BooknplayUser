import 'package:booknplay/Routes/routes.dart';
import 'package:booknplay/Routes/screen_bindings.dart';
import 'package:booknplay/Screens/Auth_Views/Forgot_Password/forgot_password_view.dart';
import 'package:booknplay/Screens/Auth_Views/Login/login_view.dart';
import 'package:booknplay/Screens/Auth_Views/Otp_Verification/otp_verify_view.dart';
import 'package:booknplay/Screens/Auth_Views/Signup/signup_view.dart';
import 'package:booknplay/Screens/Bookings/my_booking_view.dart';
import 'package:booknplay/Screens/ChnagePassword/chnage_password_view.dart';
import 'package:booknplay/Screens/Dashboard/dashboard_view.dart';
import 'package:booknplay/Screens/Home/home_view.dart';
import 'package:booknplay/Screens/Privacy_Policy/privacy_view.dart';
import 'package:booknplay/Screens/Profile/profile_controller.dart';
import 'package:booknplay/Screens/Profile/profile_view.dart';
import 'package:booknplay/Screens/Splash/splash_screen.dart';
import 'package:booknplay/Screens/Terms_Condition/terms_condition_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AllPages {
  static List<GetPage> getPages() {
    return [
      GetPage(
          name: splashScreen,
          page: () => const SplashScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: loginScreen,
          page: () => const LoginScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: forgotPasswordScreen,
          page: () => const ForgotPasswordScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: otpScreen,
          page: () => const OTPVerificationScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: signupScreen,
          page: () => const SignupScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: bottomBar,
          page: () =>  DashBoardScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: homeScreen,
          page: () => const HomeScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: privacyScreen,
          page: () => const PrivacyPolicyScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: termConditionScreen,
          page: () => const TermsAndConditionScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: bookings,
          page: () => const MyBookingsScreen(isFrom: true),
          binding: ScreenBindings()),
      GetPage(
          name: changePasswordScreen,
          page: () => const ChangePasswordScreen(),
          binding: ScreenBindings()),
      GetPage(
          name: profileScreen,
          page: () => const ProfileScreen(),
          binding: ScreenBindings()),



    ];
  }
}