import 'package:booknplay/Screens/Home/HomeController.dart';
import 'package:booknplay/Utils/Colors.dart';
import 'package:booknplay/Widgets/commen_widgets.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (controller) => Stack(
        children: [
          screenStackContainer(context),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.007),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration:  BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  // Top-left corner radius
                  topRight: Radius.circular(30),
                  // Bottom-right corner with no rounding
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      searchWidget(controller.handleOnChangedResult),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                          CarouselSlider(
                              items: controller.sliderList
                                  .map(
                                    (item) => Stack(
                                      alignment: Alignment.center,
                                        children: [
                                      ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      item.image ?? "",
                                                    ),
                                                    fit: BoxFit.fill)),
                                          )),
                                      ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.fntClr.withOpacity(0.4)),
                                          )),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                           Text(
                                            item.title ?? '',
                                            style: const TextStyle(
                                              //decoration: TextDecoration.underline,
                                              color: Colors.white,
                                              fontSize: 25,fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          const SizedBox(height: 50,),
                                          SizedBox(
                                            width: 120,
                                            height: 40,
                                            child: ElevatedButton(onPressed: (){
                                              //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Otp_Verification()));
                                            },
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 5,
                                                  backgroundColor: AppColors.secondary,shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5),
                                              )
                                              ),
                                              child:  Text(
                                                item.code ?? '',
                                                style: const TextStyle(
                                                  //decoration: TextDecoration.underline,
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ]),
                              )
                                  .toList(),
                              carouselController: controller.carouselController,
                              options: CarouselOptions(
                                  scrollPhysics: const BouncingScrollPhysics(),
                                  autoPlay: true,
                                  aspectRatio: 1.8,
                                  viewportFraction: 1,
                                  onPageChanged: (index, reason) {
                                    controller.currentIndex.value = index ;

                                  })),
                          const SizedBox(
                            height: 20,
                          ),

                            sliderPointers (controller.sliderList , controller.currentIndex.value )

                        ],),),
                      const Text('Categories',style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),),
                      getCatListView(controller),
                      const SizedBox(height: 5,),
                      sliderPointers (controller.catList , controller.catCurrentIndex.value ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Popular Ground",
                        style: TextStyle(
                            color: AppColors.fntClr,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() => groundListView(controller)),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getCatListView(HomeController catC) {

   // return catC.catList.map((e) => Card(
   //    child: Container(
   //      height: 35,
   //      width: 100,
   //      decoration: BoxDecoration(
   //        color: AppColors.whit,
   //        boxShadow: [
   //          BoxShadow(
   //            color: Colors.white.withOpacity(0.5),
   //            blurRadius: 10,
   //            spreadRadius: 0,
   //          ),
   //        ],
   //        borderRadius: BorderRadius.circular(5),
   //      ),
   //      child: Row(
   //        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
   //        children: [
   //
   //          Image.asset('assets/icons/football.png',scale:1.5),
   //          Text('Football')
   //        ],
   //      ),
   //
   //    ),
   //  )).toList();
    return  SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: List.generate(/*catC.catList.length*/4, (index) {


        return InkWell(
          onTap: (){
            catC.selectedCategory(index);
          },
          child: Card(
          child: Container(
            height: 35,
            width: 100,
            decoration: BoxDecoration(
              color: catC.catList[index].isSelected  ?? false? AppColors.greyColor.withOpacity(0.5) : AppColors.whit,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 0,
                ),
              ],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/icons/${catC.catList[index].title?.toLowerCase()}.png',scale:1.5),
                Text(catC.catList[index].title ?? '')
              ],
            ),

          ),
      ),
        );
      })),
    );

  }

Widget  groundListView(HomeController controller) {
    return controller.isGroundLoading.value 
        ? const Center(child: CircularProgressIndicator(color: AppColors.secondary,),)  
        : controller.groundList.isEmpty 
        ? const Center(
          child: Column(
      children: [SizedBox(height: 60,), Text('No ground available!')],),
        )
        : SizedBox(
      height: MediaQuery.of(context).size.height / 1.1,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 10.0, // spacing between rows
          crossAxisSpacing: 10.0, // spacing between columns
        ),
        // padding around the grid
        itemCount: controller.groundList.length, // total number of items
        itemBuilder: (context, index) {
          return Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "${controller.groundList[index].image}",
                    fit: BoxFit.fill,
                  )));
        },
      ),
    );
  }

  Widget sliderPointers (List doteList , int currentIndex ) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        doteList
            .asMap()
            .entries
            .map((entry) {
          return GestureDetector(
            // onTap:()=> controller.carouselController.animateToPage(entry.key),
            child: Container(
              width: currentIndex == entry.key ? 25 : 12,
              height: 4.0,
              margin: const EdgeInsets.symmetric(
                horizontal: 3.0,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: currentIndex == entry.key
                      ? AppColors.secondary
                      : Colors.grey
              ),
            ),
          );
        }).toList());
  }





}
