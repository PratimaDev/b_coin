import 'package:b_coin/components/collection_detail_part_two.dart';
import 'package:b_coin/components/nft_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  bool isUsernameVisible = false; // For toggling username visibility
  String username = "User123456"; // Ye signup/login se aayega
  String uid = "UID123456"; // Placeholder UID
  int points = 0; // Dynamic points
  int level = 0; // Dynamic level
  String selectedAvatar = 'assets/bid_1.png'; // Default avatar
  int communityRewards = 0;
  int aEnthusiast = 1;
  int bcEnthusiast = 5;
  int orders = 0;
  int bought = 1;
  int processing = 1;
  int sold = 8;





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient Layer
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFB8860B),
                  Color(0xFFFFF5B6),
                  Color(0xFFDAA520),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
  // Mask Layer
          Container(
            color: Colors.white.withOpacity(0.28),
          ),
 // Foreground Content
          SafeArea(
            child: SingleChildScrollView(
              padding:  EdgeInsets.symmetric(horizontal: 10.0.w,vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(),
                   SizedBox(height: 6.h),
                  _buildWalletBalance(),
                   SizedBox(height: 6.h),
                  _buildMyTeamCard(),
                   SizedBox(height: 6.h),
                  _buildMyOrdersCard(),
                   SizedBox(height: 6.h),
_buildCommonFunctionsCard()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildHeader() {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _showAvatarSelectionDialog();
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Color(0xEDFFC107),
                        highlightColor: Color(0xEDFFC107),
                        // period: Duration(hours: 5),

                        direction: ShimmerDirection.ltr,
                        child: Container(
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xFFDAA520),
                              width: 3.w,
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 27.r,
                        backgroundImage: AssetImage(selectedAvatar),
                        backgroundColor: Colors.grey.shade200,
                      ),
                    ],
                  ),
                ),
                 SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          isUsernameVisible ? username : "******",
                          style:  TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17.sp,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        IconButton(
                          icon: Icon(
                            isUsernameVisible ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey.shade500,
                          ),
                          onPressed: () {
                            setState(() {
                              isUsernameVisible = !isUsernameVisible;
                            });
                          },
                        ),

                        isUsernameVisible?   SizedBox(width: 42.w,)
                        : SizedBox(width: 93.w)

                        ,IconButton(onPressed: (){},
                            icon: Icon(Icons.calendar_month,color: Colors.grey.shade500,))
                      ],

                    ),
                     SizedBox(height: 5.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "UID: ${isUsernameVisible ? uid : "******"}",
                          style:  TextStyle(color: Colors.grey, fontSize: 14.sp),
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (isUsernameVisible)
                          GestureDetector(
                            onTap: () {
                              Clipboard.setData(ClipboardData(text: uid));

                              ScaffoldMessenger.of(context).hideCurrentSnackBar(); // 👈 Yeh line add kar
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   SnackBar(
                              //     content: Text('UID copied to clipboard!'),
                              //     behavior: SnackBarBehavior.floating,
                              //     duration: Duration(seconds: 2),
                              //   ),
                              // );
                            },
                            child: Padding(
                              padding:  EdgeInsets.only(left: 4.0.w), // thoda sa gap manually
                              child: Icon(Icons.copy, size: 14.w, color: Colors.grey.shade600),
                            ),
                          ),
                      ],
                    ),

                   // SizedBox(height: 5)
                  ],
                ),
              ],
            ),
             SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildInfoButton("Level $level",(){}),
                 SizedBox(width: 10.w),
                _buildInfoButton("$points Points",(){}),
              ],
            ),SizedBox(height: 5.h,)
          ],
        ),
      ),
    );
  }

// Aur ye dialog box function bana:
  void _showAvatarSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
          child: Padding(
            padding:  EdgeInsets.all(20.0.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Edit", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500)),
                    IconButton(
                      icon: Icon(Icons.close,color: Colors.black87,),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
                // const SizedBox(height: 5),

                Divider(color: Colors.grey.shade300,),
                 SizedBox(height: 10.h),
                Wrap(
                  spacing: 10.w,
                  runSpacing: 10.w,
                  children: [
                    for (var avatar in [
                      'assets/bid_1.png',
                      'assets/bid_2.png',
                      'assets/bid_3.png',
                      'assets/bid_2.png',
                      'assets/bid_1.png',
                      'assets/bid_3.png',
                      'assets/bid_2.png',
                      'assets/bid_1.png',
                      'assets/bid_3.png',
                    ])
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedAvatar = avatar;
                          });
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          radius: 30.r,
                          backgroundImage: AssetImage(avatar),
                        ),
                      ),
                  ],
                ),
                 SizedBox(height: 20.h),
                InkWell(
                  radius: 30.r,
                  onTap: (){
                    Navigator.pop(context);

                  },
                  child: Container(
                    // width: double.infinity,
                    alignment: Alignment.center,
                    padding:  EdgeInsets.symmetric(vertical: 14.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      gradient: LinearGradient(
                        colors: [Color(0xFFB8860B), Color(0xFFFFF5B6), Color(0xFFDAA520)]
                      ),
                    ),
                    child: Text(
                      "Confirm",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }


  Widget _buildInfoButton(String text, VoidCallback onTap) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(children: [

          Text(
            text,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 2.w,),
          Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey.shade600,size: 16.w,)
        ],),
      )
    );
  }

  Widget _buildWalletBalance() {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 16.h,horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "Wallet Balance",
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 13.sp, color: Colors.grey),
            ),
 SizedBox(height: 3.h),
            Row(
              children: [
                Image.asset('assets/usdt.png', width: 21.w, height: 21.h),
                Text(" 0",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22.w,
                        fontWeight: FontWeight.w600)),
              ],
            ),
            Divider(
                thickness: 1, color: Colors.grey.shade200
            ),
            Padding(
              padding:  EdgeInsets.only(right: 8.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                   Text("Daily income",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Colors.black87)),
                  SizedBox(width: 12.w),
                   Text("Total income",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Colors.black87)),
                ],
              ),
            ),
            Divider(thickness: 1, color: Colors.grey.shade200),
            Column(
              children: [
                _buildFixedRow("Cumulative Earnings", "2.12", "1000.13"),
                _buildFixedRow("Reserve", "3.43", "100.00"),
                _buildFixedRow("Team", "43.50", "0.30"),
                _buildFixedRow("Action Bonus", "0.00", "0.4"),
                _buildFixedRow("Stake", "0.50", "0.5"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFixedRow(String title, String value1, String value2) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 4.0.h),
      child: Row(
        children: [
          Container(
            width: 130.w, // <-- Fixed width for title
            child: Text(
              title,
              style:  TextStyle(
                  color: Colors.black87, fontSize: 12.sp, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIncomeRow(value1),
                // SizedBox(width: 2,),
                _buildIncomeRow(value2),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildIncomeRow(String value) {
    return Row(
      children: [
        Container(
          width: 86.w, // fix icon+value block ki width
          child: Row(
            children: [
              Image.asset('assets/usdt.png', width: 20.w, height: 20.h),
               SizedBox(width: 4.w),
              Flexible(
                child: Text(
                  value,
                  overflow: TextOverflow.fade,

                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMyTeamCard() {
    return Card(
      elevation: 2,

      // margin: EdgeInsets.symmetric(),
      shadowColor: Colors.black87,
      // surfaceTintColor: Color(0xFFB8860B),
      color: Colors.white,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r),
           ),
      child: Padding(
        padding:  EdgeInsets.all(16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text("My Team",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp)),
            Divider(color: Colors.grey.shade200,),
             SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(children: [
                  _buildTeamColumn("Community\nRewards", communityRewards),

                  _buildTeamColumnFeatures(Icons.group, 'Community\nenthusiasts',(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NFTScreenRealTime()));
                  },0),


                ],),
                Column(children: [
                  _buildTeamColumn("Valid\nMembers",aEnthusiast + bcEnthusiast),
                  _buildTeamColumnFeatures(Icons.card_giftcard, 'Community\ncontribution',(){},0),



                ],),   Column(children: [

                  _buildTeamColumn("A\nenthusiast", aEnthusiast),
                  _buildTeamColumnFeatures(Icons.event_note_outlined, 'Community\norders',(){},0),


                ],
                )
                ,   Column(children: [

                  _buildTeamColumn("B+C\nenthusiasts", bcEnthusiast),
                  _buildTeamColumnFeatures(Icons.share, 'Referral',(){},15.h)


                ],),



              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildTeamColumn(String title, int value) {
    return Column(
      children: [
        // Icon(icon, size: 32, color: Colors.teal),
         SizedBox(height: 6.h),
        Text(
          '$value',
          style:  TextStyle(
              fontSize: 17.sp, fontWeight: FontWeight.bold, color: Colors.black),
        ),
         SizedBox(height: 4.h),
        Text(
          title,
          textAlign: TextAlign.center,
          style:  TextStyle(fontSize: 11.sp, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildTeamColumnFeatures(IconData iconData, String value, VoidCallback onTap,double referral) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w, // fix width
            height: 40.h, // fix height
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [
                  Color(0xFFB8860B),// Pure Gold
                  // Color(0xFFFFA500), // Light Orange Gold,
                  Color(0xFFDAA520)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Icon(
                iconData,
                size: 30.w, // Proper icon size
                color: Colors.white, // Must be white for gradient
              ),
            ),
          ),
           SizedBox(height: 4.h),
          Text(
            value,
            textAlign: TextAlign.center,
            style:  TextStyle(fontSize: 11.sp, color: Colors.black54),
          ),SizedBox(height: referral,)
        ],
      ),
    );
  }

  Widget _buildMyOrdersCard() {
    return Card(
      elevation: 2,
      // margin: EdgeInsets.symmetric(),
      shadowColor: Colors.black87,
      // surfaceTintColor: Color(0xFFB8860B),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Text("My Orders",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp)),
// _buildInfoButton('Check Orders', (){})
                InkWell(
                  onTap: (){},
                  child: Row(children: [
                    Text(
                      'Check Orders',
                      style:  TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 2.w,),
                    Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey.shade600,size: 16.w,)
                  ],),
                )

            ],)
            ,Divider(color: Colors.grey.shade200,),
            // const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(children: [
                  _buildTeamColumn("Orders", orders),SizedBox(height: 2.h,),
                  _buildTeamColumnFeatures(Icons.person, 'BCoins',(){},0),

                ],),Column(children: [
                  _buildTeamColumn("Processing",processing),SizedBox(height: 2.h,),
                  // _buildTeamColumnFeatures(Icons.person, 'BCoins',(){},0),
                  _buildTeamColumnFeatures(Icons.description_outlined, 'Details',(){},0),

                ],),Column(children: <Widget>[
                  // _buildTeamColumn("Orders", orders),
                  // _buildTeamColumnFeatures(Icons.person, 'BCoins',(){},0),
                  _buildTeamColumn("Bought", bought),SizedBox(height: 2.h,),
                  _buildTeamColumnFeatures(Icons.credit_card_rounded, 'Deposit',(){},0),

                ],),Column(children: [
                  // _buildTeamColumn("Orders", orders),
                  // _buildTeamColumnFeatures(Icons.person, 'BCoins',(){},0),

                  _buildTeamColumn("Sold", sold),SizedBox(height: 2.h,),
                  _buildTeamColumnFeatures(Icons.exit_to_app, 'Withdraw',(){},0)

                ],),



              ],
            ),

          ],
        ),
      ),
    );
  }


  Widget _buildCommonFunctionsCard() {
    return Card(
      elevation: 2,
      // margin: EdgeInsets.symmetric(),
      shadowColor: Colors.black87,
      // surfaceTintColor: Color(0xFFB8860B),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding:  EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text("Common Functions",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp)),
            Divider(color: Colors.grey.shade200,),
             SizedBox(height: 10.h),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     _buildTeamColumn("Orders", orders),
            //     _buildTeamColumn("Processing",processing),
            //     _buildTeamColumn("Bought", bought),
            //     _buildTeamColumn("Sold", sold),
            //   ],
            // ),SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                _buildTeamColumnFeatures(Icons.settings, 'Settings',(){},0),
                _buildTeamColumnFeatures(Icons.collections_bookmark, 'Collection',(){},0),
                _buildTeamColumnFeatures(Icons.border_color_outlined, 'Guide',(){},0),
                _buildTeamColumnFeatures(Icons.update, 'Updates',(){},0)
              ],)
          ],
        ),
      ),
    );
  }



}
