
import 'package:b_coin/screens/login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  int page = 0;
  PageController controller = PageController();

  List<Map<String, String>> pageArr = [
    {
      "title": "Explore\nRare BCoins",
      "sub_title": "Discover and collect exclusive digital assets from top creators.",
      "img": "assets/img.png"
    },
    {
      "title": "Secure & Easy Transactions",
      "sub_title": "Buy, sell, and store BCoins securely using blockchain technology.",
      "img": "assets/secure.png"
    },
    {
      "title": "Start Your BCoin Journey!",
      "sub_title": "",
      "img": "assets/start.png"
    }
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        page = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: pageArr.length,
                itemBuilder: (context, index) {
                  var pObj = pageArr[index];
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: media.width * 0.2.h),
                        Text(
                          pObj["title"]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                         SizedBox(height: 10.h),
                        Image.asset(
                          pObj["img"]!,
                          width: media.width * 0.7.w,
                          height: media.width * 0.8.h,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(height: media.width * 0.05),
                        page == 2
                            ? Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              minimumSize: Size(double.infinity, 50.w),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                            },
                            child: Text(
                              "Let's Go ➜",
                              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700),
                            ),
                          ),
                        )
                            : Text(
                          pObj["sub_title"]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey.shade500, fontSize: 14.sp),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => LoginScreen()));

                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(pageArr.length, (index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin:  EdgeInsets.symmetric(horizontal: 4.w),
                        width: page == index ? 14.w : 10.w,
                        height: page == index ? 14.h : 10.h,
                        decoration: BoxDecoration(
                          color: page == index ? Colors.amber : Colors.black87,
                          borderRadius: BorderRadius.circular(7.5.r),
                        ),
                      );
                    }),
                  ),
                  page < 2
                      ? TextButton(
                    onPressed: () {
                      controller.nextPage(
                          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                      : SizedBox(width: 50.w),
                ],
              ),
            ),
            SizedBox(height: media.width * 0.05.h),
          ],
        ),
      ),
    );
  }
}
