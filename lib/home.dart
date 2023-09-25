import 'package:carousel_slider/carousel_slider.dart';
import 'package:eclipse_ecommerce_app/catgories/electronics.dart';
import 'package:eclipse_ecommerce_app/catgories/men.dart';
import 'package:eclipse_ecommerce_app/catgories/women.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:sizer/sizer.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 1.h),
          height: 7.h,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SearchBar(
            hintText: 'Search Eclipse',
            hintStyle: MaterialStatePropertyAll(
              TextStyle(
                fontSize: 13.sp,
                fontFamily: 'Raleway-Light',
                color: const Color(0xffD4E1E8),
              ),
            ),
            shadowColor: const MaterialStatePropertyAll(Colors.black),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.w))),
            padding: MaterialStatePropertyAll(
                EdgeInsets.only(left: 2.w, right: 4.w)),
            trailing: [
              Icon(
                Icons.search,
                size: 7.w,
                color: const Color(0xffD4E1E8),
              )
            ],
            backgroundColor: const MaterialStatePropertyAll(
              Color(0xff333333),
            ),
            textStyle: MaterialStatePropertyAll(TextStyle(
                fontSize: 14.sp,
                color: Colors.white,
                fontFamily: 'Raleway-Regular')),
          ),
        ),
        Container(
          height: 24.h,
          margin: const EdgeInsets.only(top: 8.0),
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    width: 100.w,
                    child: CarouselSlider(
                      items: imageSliders,
                      carouselController: _controller,
                      options: CarouselOptions(
                          // autoPlay: true,
                          // autoPlayInterval: const Duration(seconds: 6),
                          // enlargeCenterPage: true,
                          viewportFraction: 1.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 100.w / 60,
                        height: 100.h / 120,
                        margin: const EdgeInsets.only(
                            left: 4.0, right: 4.0, top: 16.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == entry.key
                                ? const Color(0xff3797C9)
                                : Colors.white),
                      ),
                    );
                  }).toList(),
                ),
              ]),
        ),
        Container(
          height: 12.h,
          margin: const EdgeInsets.only(top: 24.0),
          // color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 100.h,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.w))),
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xff3C3C3C)),
                    ),
                    onPressed: () {
                      Get.to(() => const MenCategory());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'For Men',
                          style: TextStyle(fontSize: 7.sp),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 100.h,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.w))),
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xff3C3C3C)),
                    ),
                    onPressed: () {
                      Get.to(() => const WomenCategory());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'For Women',
                          style: TextStyle(fontSize: 7.sp),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 100.h,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.w))),
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xff3C3C3C)),
                    ),
                    onPressed: () {
                      Get.to(() => const ElectronicsCategory());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Electronics',
                          style: TextStyle(fontSize: 7.sp),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              )
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 18.h,
          margin: EdgeInsets.only(left: 8.w, right: 8.w, top: 4.h, bottom: 2.h),
          padding: EdgeInsets.only(bottom: 1.h),
          decoration: BoxDecoration(
              color: const Color(0xff3C3C3C),
              borderRadius: BorderRadius.circular(4.w)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 4.w, bottom: 1.2.h),
                    child: Text(
                      'Deals for You',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Raleway-SemiBold',
                          fontSize: 10.sp),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 3.w, bottom: 1.2.h),
                    child: Icon(
                      Icons.navigate_next_outlined,
                      color: Colors.white,
                      size: 6.w,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 10.h,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(20, 0, 0, 0),
                              blurRadius: 4,
                              spreadRadius: 4,
                              offset: Offset(0, 4))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2.w)),
                    width: 20.w,
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.5.w, vertical: 0.5.h),
                          child: Image.network(
                              'https://th.bing.com/th/id/OIP.d-7UFbAaPsT2y3dYpaKm1AHaFb?pid=ImgDet&rs=1'),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 1.h),
                          padding: EdgeInsets.only(
                              top: 0.6.w,
                              bottom: 0.6.w,
                              right: 1.2.w,
                              left: 1.2.w),
                          decoration: BoxDecoration(
                              color: const Color(0xff3797C9),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(2.w),
                                  bottomRight: Radius.circular(2.w))),
                          child: Text(
                            '15% Off',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 9.sp,
                                letterSpacing: 0.2,
                                fontFamily: 'Raleway-Bold'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 10.h,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(20, 0, 0, 0),
                              blurRadius: 4,
                              spreadRadius: 4,
                              offset: Offset(0, 4))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2.w)),
                    width: 20.w,
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 0.5.h),
                          alignment: Alignment.center,
                          child: Image.network(
                              'https://cdn.shoplightspeed.com/shops/633289/files/24484145/apple-beats-by-dre-studio3-wireless-over-ear-headp.jpg'),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 1.h),
                          padding: EdgeInsets.only(
                              top: 0.6.w,
                              bottom: 0.6.w,
                              right: 1.2.w,
                              left: 1.2.w),
                          decoration: BoxDecoration(
                              color: const Color(0xff3797C9),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(2.w),
                                  bottomRight: Radius.circular(2.w))),
                          child: Text(
                            '5% Off',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 9.sp,
                                letterSpacing: 0.2,
                                fontFamily: 'Raleway-Bold'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 10.h,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(20, 0, 0, 0),
                              blurRadius: 4,
                              spreadRadius: 4,
                              offset: Offset(0, 4))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2.w)),
                    width: 20.w,
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image.network(
                              'https://i.pinimg.com/originals/a9/2d/5b/a92d5bf8e104850125c7b9950fca5efc.jpg'),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 1.h),
                          padding: EdgeInsets.only(
                              top: 0.6.w,
                              bottom: 0.6.w,
                              right: 1.2.w,
                              left: 1.2.w),
                          decoration: BoxDecoration(
                              color: const Color(0xff3797C9),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(2.w),
                                  bottomRight: Radius.circular(2.w))),
                          child: Text(
                            '10% Off',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 9.sp,
                                letterSpacing: 0.2,
                                fontFamily: 'Raleway-Bold'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ImageSliderDemo extends StatelessWidget {
  const ImageSliderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(),
      items: imgList
          .map((item) => Center(
              child: Image.network(item, fit: BoxFit.cover, width: 100.w)))
          .toList(),
    );
  }
}

final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        margin: EdgeInsets.only(
          top: 1.h,
        ),
        child: ClipRRect(
          child: Container(
            alignment: Alignment.centerLeft,
            width: 100.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    // padding: const EdgeInsets.only(top: 80.0),
                    alignment: Alignment.center,
                    // color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 4.w),
                          child: Text(
                            "50% OFF",
                            style: TextStyle(
                                fontFamily: 'Raleway-Bold',
                                color: Colors.white,
                                fontSize: 28.sp),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3.h),
                          child: Text(
                            "ASUS\nVIVOBOOK",
                            maxLines: 2,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: 'Raleway-Regular',
                              color: Colors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      // padding: const EdgeInsets.all(24.0),
                      alignment: Alignment.center,
                      // color: Colors.green,
                      child: SimpleShadow(
                        opacity: 0.25, // Default: 0.5
                        color: const Color.fromARGB(
                            255, 0, 0, 0), // Default: Black
                        offset: Offset(0, 1.h), // Default: Offset(2, 2)
                        sigma: 4,
                        child: Image.asset('images/asuslaptop.png',
                            scale: 1.4.w), // Default: 2
                      )),
                )
              ],
            ),
          ),
          // Image.network(item, fit: BoxFit.cover, width: 1000.0),
        ),
      ),
    )
    .toList();
