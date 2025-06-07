
import 'package:b_coin/screens/home_screen.dart';
import 'package:b_coin/screens/market_screen.dart';
import 'package:b_coin/screens/profile_screen.dart';
import 'package:b_coin/screens/rewards_screen.dart';
import 'package:b_coin/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl/intl.dart';



class ListingsDetail extends StatelessWidget {
  const ListingsDetail({super.key});

  String getCurrentTime() {
    return DateFormat('HH:mm:ss').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset('assets/logo.png', height: 40.h),
             SizedBox(width: 10.w),
            Text(
              "B Coin",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                shadows: [
                  Shadow(
                    blurRadius: 0.5.r,
                    color: Colors.amber,
                    offset: Offset(1, 0),
                  )
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon:  Icon(Icons.notifications_active_outlined, size: 28.w, color: Colors.black87),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            icon:  Icon(Icons.menu, size: 32.w),
            onSelected: (String value) {},
            itemBuilder: (BuildContext context) {
              return [
                _buildPopupMenuItem("Home", Icons.home,(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

                }),
                _buildPopupMenuItem("Market", Icons.attach_money,(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MarketScreen()));

                }),
                _buildPopupMenuItem("Wallet", Icons.lock,(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WalletScreen()));

                }),
                _buildPopupMenuItem("Rewards", Icons.trending_up,(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RewardsScreen()));

                }),
                _buildPopupMenuItem("Profile", Icons.person,(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));

                }),
              ];
            },
            elevation: 10,
            color: Colors.white,
          ),
           SizedBox(width: 10.w),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child:Stack(children: [ Image.asset(
              'assets/bid_3.png',
              height: 360.h,
              width: double.infinity,

            ),
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
            ],

            )
          ),
           SizedBox(height: 24.h),
          Padding(
            padding:  EdgeInsets.only(left: 16.0.w),
            child: Text(
              'Noxious Community_67916345',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
           SizedBox(height: 8.h),
          Padding(
            padding:  EdgeInsets.only(left: 16.0.w),
            child: Row(
              children: [
                 Text('Contract Address: '),
                TextButton(
                  onPressed: () {},
                  child:  Text(
                    '0xd7bf...abf5',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),

         Padding(
           padding:  EdgeInsets.only(left: 16.0.w),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [

             Text('Owner:   kimberley', style: TextStyle(fontSize: 15.sp,color: Colors.grey)),
                SizedBox(height: 4.h),   Text('Price:   🪙 1.008', style: TextStyle(fontSize: 15.sp,color: Colors.grey)),
                SizedBox(height: 4.h),  Text('Resale Profit:   🪙 0.043344', style: TextStyle(fontSize: 15.sp,color: Colors.grey)),
                SizedBox(height: 4.h),  Text('Chain:   Polygon', style: TextStyle(fontSize: 15.sp,color: Colors.grey)),
              SizedBox(height: 4.h),
             Text('Time zone:   GMT +03:00 ${getCurrentTime()}',
                 style: TextStyle(fontSize: 15.sp,color: Colors.grey)),

           ],),
         )
        ],
      ),
    );
  }
}



PopupMenuItem<String> _buildPopupMenuItem(String title, IconData icon, VoidCallback onTap) {
  return PopupMenuItem(
    value: title.toLowerCase(),
    child: Row(
      children: [
        IconButton(
          icon: Icon(icon, color: Colors.black87, size: 22.w),
          onPressed: onTap,
        ),
         SizedBox(width: 10.w),
        Text(title, style:  TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
      ],
    ),
  );
}
