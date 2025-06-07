import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Item {
  final String level;
  final String duration;
  final String image;
  final String title;
  final String amount;
  final String income;
  final String fee;

  Item({
    required this.level,
    required this.duration,
    required this.image,
    required this.title,
    required this.amount,
    required this.income,
    required this.fee,
  });
}

final List<Map<String, dynamic>> dummyData = [
  {'level': 'LV1-LV6', 'duration': '10day', 'image': 'assets/elite_1.png', 'title': 'BumperOffer 1', 'amount': '100 - 2000', 'income': '1.3%', 'fee': '0%'},
  {'level': 'LV2-LV7', 'duration': '20day', 'image': 'assets/elite_2.png', 'title': 'DeluxeOffer 1', 'amount': '200 - 3000', 'income': '1.5%', 'fee': '1%'},
  {'level': 'LV3-LV8', 'duration': '30day', 'image': 'assets/elite_3.png', 'title': 'Evergreen 1', 'amount': '300 - 4000', 'income': '1.7%', 'fee': '2%'},
  {'level': 'LV4-LV9', 'duration': '40day', 'image': 'assets/elite_4.png', 'title': 'YieldCanvas 4', 'amount': '400 - 5000', 'income': '1.9%', 'fee': '3%'},
  {'level': 'LV5-LV10', 'duration': '50day', 'image': 'assets/elite_5.png', 'title': 'YieldCanvas 5', 'amount': '500 - 6000', 'income': '2.1%', 'fee': '4%'},
  {'level': 'LV6-LV11', 'duration': '60day', 'image': 'assets/elite_6.png', 'title': 'YieldCanvas 6', 'amount': '600 - 7000', 'income': '2.3%', 'fee': '5%'},
];

class EarnListScreen extends StatelessWidget {
  const EarnListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   ListView.builder(
          itemCount: dummyData.length,
          itemBuilder: (context, index) {
            final item = dummyData[index];
            return Padding(
              padding:  EdgeInsets.all(8.0.r),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  side: BorderSide(color: Colors.grey),

                ),
                child: Padding(
                  padding:  EdgeInsets.all(16.0.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Level: ${item['level']}', style: TextStyle(fontWeight: FontWeight.bold)),
                          Container(
                            padding: EdgeInsets.all(4.r),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(item['duration'], style: TextStyle(color: Colors.green)),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.asset(item['image'], fit: BoxFit.cover, height: 150.h),
                      ),
                      SizedBox(height: 30.h),
                      Text(item['title'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Amount: ${item['amount']}', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                              Text('Daily Income: ${item['income']}', style: TextStyle(color: Colors.grey)),
                              Text('Fee: ${item['fee']}', style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [ Color(0xFFB8860B),Color(0xFFFFF5B6),Color(0xFFDAA520)], // Gold Gradient Button
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Details",
                                style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },

    );



  }
}
