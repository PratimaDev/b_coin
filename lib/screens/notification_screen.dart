import 'package:b_coin/screens/home_screen.dart';
import 'package:b_coin/screens/market_screen.dart';
import 'package:b_coin/screens/profile_screen.dart';
import 'package:b_coin/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BcoinNotificationScreen extends StatelessWidget {
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
                    blurRadius: 0.5,
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
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BcoinNotificationScreen()));
            },
          ),
          PopupMenuButton<String>(
            icon:  Icon(Icons.menu, size: 32.w),
            onSelected: (String value) {},
            itemBuilder: (BuildContext context) {
              return [
                _buildPopupMenuItem("Home", Icons.home, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                }),
                _buildPopupMenuItem("Market", Icons.attach_money, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MarketScreen()));


                }),
                _buildPopupMenuItem("Wallet", Icons.lock, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WalletScreen()));

                }),
                _buildPopupMenuItem("Rewards", Icons.trending_up, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

                }),
                _buildPopupMenuItem("Profile", Icons.person, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));

                }),
              ];
            },
            elevation: 10,
            color: Colors.white,
          ),
           SizedBox(width: 10.w),
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0.h),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.h),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: ListTile(
                leading: Icon(Icons.notifications, color: Colors.amber[700]),
                title: Text(
                  'Notification Title $index',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'This is a description of the notification. Details about the update or message will be shown here.',
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              ),
            );
          },
        ),
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
