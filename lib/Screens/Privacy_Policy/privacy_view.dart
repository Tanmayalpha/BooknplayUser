import 'package:booknplay/Screens/Privacy_Policy/privacy_controller.dart';
import 'package:booknplay/Utils/Colors.dart';
import 'package:booknplay/Widgets/commen_widgets.dart';
import 'package:booknplay/Widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PrivacyController(),
      builder: (controller) => SafeArea(
        child: /*Scaffold(
          //appBar: AppBar(forceMaterialTransparency: true),
          backgroundColor: Colors.amber,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    CustomAppBar(onPressedLeading: () {}),
                    Positioned(top: 80,  child: bodyWidget(context)),

                  ],
                ),

              ],
            ),
          ),
        )*/Material(child: bodyWidget(context, controller)),
      ),
    );
  }

  Widget bodyWidget(context, PrivacyController controller) {
    return Stack(
        children: [
          CustomAppBar(onPressedLeading: () {}),
          /*CustomAppBar(onPressedLeading: () {}),*/
          Positioned(top: 80,  child: screenStackContainer(context)),
          Padding(padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.11),   child: Container(
              width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height,
              decoration:   const BoxDecoration(
                color: AppColors.whit,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  // Top-left corner radius
                  topRight: Radius.circular(30),
                  // Bottom-right corner with no rounding
                ),
              ),
            child:
            Column(children: [

                  controller.data == null || controller.data == "" ? const Center(child: CircularProgressIndicator(color: AppColors.secondary,)) :
                  /*Html(
                      data:"${controller.data}"
                  ),*/
                  SizedBox(),

              //Container(height: 400,width: 400,color: Colors.amber,)
            ],),

          ))
      
      ,



    ]);
  }
}
