import 'package:booknplay/Constants.dart';
import 'package:booknplay/Routes/routes.dart';
import 'package:booknplay/Screens/Dashboard/dashboard_controller.dart';
import 'package:booknplay/Utils/Colors.dart';
import 'package:booknplay/Widgets/commen_widgets.dart';
import 'package:booknplay/Widgets/custom_appbar.dart';
import 'package:booknplay/Widgets/drawer_icon_tab_widget.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  //final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DashboardController(),
      builder: (controller) =>
          SafeArea(
            child: Scaffold(
              key: _key,
              drawer: Obx(() => getDrawer(controller)),
              backgroundColor: AppColors.whit,
              body:controller.bottomIndex == 2 ? controller.pages[controller.bottomIndex] : SingleChildScrollView(child: Column(children: [


                  SizedBox(
                  height: MediaQuery
                      .sizeOf(context)
                      .height,
                  child: Stack(children: [
                      CustomAppBar(onPressedLeading: () {
                      _key.currentState!.openDrawer();
                    },
                        leadingImage: AppConstants.menuIcon,
                        index: controller.bottomIndex,
                        title: controller.bottomIndex == 0
                            ? '83, Pink city, Indore'
                            : 'Bookings',notificationIcon: AppConstants.notificationIcon),
                    Positioned(
                        top: 80,
                        left: 0,
                        right: 0,
                        child: controller.pages[controller.bottomIndex]),
                  ],),
                )
              ],),),
              bottomNavigationBar: CurvedNavigationBar(
                color: AppColors.secondary,

                backgroundColor: AppColors.whit,
                items: const [
                  CurvedNavigationBarItem(
                      child: ImageIcon(AssetImage(AppConstants.homeIcon),
                          color: AppColors.whit),
                      label: 'Home',
                      labelStyle: TextStyle(color: AppColors.whit)
                  ),
                  CurvedNavigationBarItem(
                      child: ImageIcon(AssetImage(AppConstants.calenderIcon),
                          color: AppColors.whit),
                      label: 'My Bookings',
                      labelStyle: TextStyle(color: AppColors.whit)
                  ),
                  CurvedNavigationBarItem(
                      child: ImageIcon(AssetImage(AppConstants.profileIcon),
                          color: AppColors.whit),
                      label: 'Account',
                      labelStyle: TextStyle(color: AppColors.whit)
                  ),
                ],
                onTap: (index) {
                  controller.bottomIndex = index;
                  controller.update();
                  //Handle button tap
                },
              ),
            ),

          ),);
  }

  Widget getDrawer(DashboardController controller) {
    return Drawer(
      child: ListView(children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            // border: Border(bottom: BorderSide(color: Colors.black)),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [AppColors.primary, AppColors.secondary])),
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/images/profile.png",
                ),
                radius: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Johan Deo',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    'johandeo@gmail.com',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ),
        InkWell(
            onTap: () {
              controller.currentIndex.value = 1;
              Get.back();
            },
            child: DrawerIconTab(
              titlee: 'Home',
              icon: AppConstants.homeIcon,
              tabb: 1,
              indexx: controller.currentIndex.value,
            )),
        const SizedBox(
          height: 5,
        ),
        InkWell(
            onTap: () {
              controller.currentIndex.value = 2;
            },
            child: DrawerIconTab(
                titlee: 'Wallet',
                icon: AppConstants.walletIcon,
                tabb: 2,
                indexx: controller.currentIndex.value)),
        const SizedBox(
          height: 5,
        ),
        InkWell(
            onTap: () {
              controller.currentIndex.value = 3;
              Get.toNamed(bookings, arguments: true);
            },
            child: DrawerIconTab(
                titlee: 'Booking History',
                icon: AppConstants.bookingHistoryIcon,
                tabb: 3,
                indexx: controller.currentIndex.value)),
        const SizedBox(
          height: 5,
        ),
        InkWell(
            onTap: () {
              controller.currentIndex.value = 4;
              Get.toNamed(changePasswordScreen);
            },
            child: DrawerIconTab(
              titlee: 'Change Password',
              icon: AppConstants.changePasswordIcon,
              tabb: 4,
              indexx: controller.currentIndex.value,
            )),
        const SizedBox(
          height: 5,
        ),
        InkWell(
            onTap: () {
              controller.currentIndex.value = 5;

              Get.toNamed(privacyScreen);
            },
            child: DrawerIconTab(
              titlee: 'Privacy Policy',
              icon: AppConstants.privacyPolicyIcon,
              tabb: 5,
              indexx: controller.currentIndex.value,
            )),
        const SizedBox(
          height: 5,
        ),
        InkWell(
            onTap: () {
              controller.currentIndex.value = 6;
              Get.toNamed(termConditionScreen);
            },
            child: DrawerIconTab(
              titlee: 'Term & Condition',
              icon: AppConstants.termConditionIcon,
              tabb: 6,
              indexx: controller.currentIndex.value,
            )),
        const SizedBox(
          height: 5,
        ),
        InkWell(
            onTap: () {
              controller.currentIndex.value = 7;
            },
            child: DrawerIconTab(
              titlee: 'FAQ',
              icon: AppConstants.FAQIcon,
              tabb: 7,
              indexx: controller.currentIndex.value,
            )),
        const SizedBox(
          height: 5,
        ),
        InkWell(
            onTap: () {
              controller.currentIndex.value = 8;
            },
            child: DrawerIconTab(
              titlee: 'Rate & review',
              icon: AppConstants.rateReviewIcon,
              tabb: 8,
              indexx: controller.currentIndex.value,
            )),
        const SizedBox(
          height: 5,
        ),
        InkWell(
            onTap: () {
              controller.currentIndex.value = 9;
            },
            child: DrawerIconTab(
              titlee: 'Logout',
              icon: AppConstants.logoutIcon,
              tabb: 9,
              indexx: controller.currentIndex.value,
            )),
      ]),
    );
  }

}
