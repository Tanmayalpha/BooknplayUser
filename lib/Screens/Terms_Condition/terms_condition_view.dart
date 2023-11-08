import 'package:booknplay/Screens/Terms_Condition/terms_condition_controller.dart';
import 'package:booknplay/Widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: TermsAndConditionController(),
      builder:(controller) =>  SafeArea(
        child: Scaffold(

          body: Column(children: [
            CustomAppBar(onPressedLeading: (){



            }, title: "Terms & Condition",)
          ],),

        ),
      ),
    );
  }
}
