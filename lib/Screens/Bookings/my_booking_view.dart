import 'package:booknplay/Screens/Bookings/my_booking_controller.dart';
import 'package:booknplay/Utils/Colors.dart';
import 'package:booknplay/Widgets/commen_widgets.dart';
import 'package:booknplay/Widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({Key? key, this.isFrom}) : super(key: key);
final bool? isFrom ;
  @override
  Widget build(BuildContext context) {

    return GetBuilder(
        init: MyBookingController(),
        builder: (controller) => isFrom ?? false ?  SafeArea(
          child: Material(
                child: bodyWidget(context, controller),
              ),
        ) : bodyWidget2( context,  controller))  ;
  }

  Widget bodyWidget(BuildContext context, MyBookingController controller) {
    return Stack(
      children: [
        CustomAppBar(onPressedLeading: () {
          Get.back();
        },title: 'Bookings'),
        Positioned(top: 80, child: screenStackContainer(context)),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.11,),
          child: Container(
            width: MediaQuery.of(context).size.width,
            //height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: AppColors.whit,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                // Top-left corner radius
                topRight: Radius.circular(30),
                // Bottom-right corner with no rounding
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  searchWidget(controller.handleOnChangedResult),
                  const SizedBox(
                    height: 20,
                  ),
                  myBookings (),
                  myBookings (),
                  myBookings (),
                  myBookings (),
                  myBookings (),
                  myBookings (),

                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget bodyWidget2(BuildContext context, MyBookingController controller) {
    return Stack(
      children: [
        screenStackContainer(context),
        Padding(
          padding:
          EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.007,),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: AppColors.whit,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                // Top-left corner radius
                topRight: Radius.circular(30),
                // Bottom-right corner with no rounding
              ),
            ),
            child: SingleChildScrollView(
             // physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              child: Column(
                children: [
                  searchWidget(controller.handleOnChangedResult),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/1.6,
                    child: ListView.builder(
                      itemCount: 7,
                      shrinkWrap: true,
                      physics:  const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                      return myBookings ();
                    },),
                  )


                ],
              ),
            ),
          ),
        )
      ],
    );
  }


  Widget myBookings (){

    return Stack(
        children: [
          InkWell(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => Booking_details()));
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://assets.telegraphindia.com/telegraph/2021/Sep/1630669298_sky-turf.jpg',
                )),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  height: 70,
                  child:  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height:07,),
                          Text(
                            'Golf Ground',
                            style: TextStyle(
                                color: AppColors.whit, fontSize: 18),
                          ),
                          SizedBox(height: 12,),
                          Text(
                            '₹ 21000',
                            style: TextStyle(
                                color: AppColors.whit, fontSize: 18),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height:5,),

                          Text(
                            'Date',
                            style: TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                          SizedBox(height:7,),
                          Text(
                            'Friday, 04 Oct.',
                            style: TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                          SizedBox(height:7,),
                          Text(
                            '1:00PM to 2:00 PM',
                            style: TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ))),
        ]);
  }
}
