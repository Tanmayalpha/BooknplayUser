import 'dart:convert';

import 'package:booknplay/Controllers/app_base_controller/app_base_controller.dart';
import 'package:booknplay/Local_Storage/shared_pre.dart';
import 'package:booknplay/Services/api_services/apiStrings.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class OTPVerifyController extends AppBaseController{




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    data = Get.arguments ;
  }

RxBool isLoading = false.obs ;
  List data = [] ;
  String otp = '' ;


  Future<void> verifyOTP() async {
    isLoading.value = true ;

    var param = {
      'contact': data[0].toString(),
      'otp': otp,
    };
    apiBaseHelper.postAPICall(verifyOTPAPI, param).then((getData) {
      bool error = getData['status'];
      String msg = getData['message'];

      if (error) {

        SharedPre.setValue('userData', jsonEncode(getData['user']));
        SharedPre.setValue('userId', getData['user']['id'].toString());
        Fluttertoast.showToast(msg: msg);



      } else {

        Fluttertoast.showToast(msg: msg);

      }
      isLoading.value = false ;
    });
  }
}