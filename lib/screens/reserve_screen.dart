// import 'package:b_coin/components/token_detail_screen.dart';
import 'package:b_coin/components/animated_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class GoldenReserveScreen extends StatefulWidget {
  @override
  _GoldenDashboardState createState() => _GoldenDashboardState();
}

class _GoldenDashboardState extends State<GoldenReserveScreen> {
  int _selectedIndex = 0;
  String selectedLevel = 'Lv0';  // For dropdown 1
  String selectedRange = '50~150';  // For dropdown 2
  List<Map<String, String>> collectedNFTs = [];

  bool isConfirmed = true;
bool isSelled = true;
// Example replaceable income map (You can modify dynamically based on wallet/userLevel)
  Map<String, String> levelIncomeData = {
    'Lv0': '1.23~1.32%',

  };

  final List<String> tabLabels = ['Today', 'Book', 'Stored'];
  void showLoadingDialog(BuildContext context, {required String expectedIncomeText, required String loaderText}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pop();
          showNFTDialog(context,
              bookingStatus: 'Booking Successful🎉!',
              nftImage: 'assets/bid_3.png',
              nftName: 'Cool_ALP123456789',
              nftPrice: '188889.9432',nftGain: '1.4%');
        });

        return Dialog(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(0xFFB8860B), width: 1.5.w, ),

              borderRadius: BorderRadius.circular(12.r),),
          child: Container(
            width: MediaQuery.of(context).size.width*0.8.w ,
            height: 310.h,
            padding: EdgeInsets.all(20.r),
            child: Padding(
              padding: EdgeInsets.only(top: 16.0.h),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [

                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFB8860B)),
                  ),
                  SizedBox(height: 25.h),
                  Container(
                    width: 180.w,
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border.all(color: Color(0xFFB8860B), width: 1.5.w),
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFB8860B).withOpacity(0.4),
                          blurRadius: 2.5.r,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),

                    child: Padding(
                      padding:  EdgeInsets.all(8.0.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Text('Expected income', style: TextStyle(fontWeight: FontWeight.w600)),

                        SizedBox(height: 2.h),

                       Row(  mainAxisAlignment: MainAxisAlignment.center,

   crossAxisAlignment: CrossAxisAlignment.center,
                         children: [

                         Image.asset('assets/usdt.png', width: 18.w, height: 18.h),
                         SizedBox(width: 6.w),
                         Text(expectedIncomeText, style: TextStyle(color: Colors.green, fontSize: 18.sp)),

                       ],)


                      ],
                                        ),
                    ),),
                  SizedBox(height: 16.h),
                  Text(loaderText, style: TextStyle(fontSize: 19.sp,fontWeight: FontWeight.bold)),
                  SizedBox(height: 20.h),


                  Padding(
        padding:  EdgeInsets.symmetric(horizontal: 6.0.w),
        child: Container(
        width: 230.w,
        decoration: BoxDecoration(
        gradient: LinearGradient(
        colors: [ Color(0xFFB8860B),Color(0xFFFFF5B6),Color(0xFFDAA520)], // Gold Gradient Button
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10.r),
        ),
        child: ElevatedButton(
        style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
        ),
        ),
        onPressed: () {
        // showLoadingDialog(context,expectedIncomeText: '18~19.5',loaderText: 'Opening...');

        // Navigator.pop(context);
        },
        child: Text(
        "Confirm",
        style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        ),
        ),
        ),
        ),
        ),



                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showNFTDialog(BuildContext context, {required nftImage,required String bookingStatus,required String nftName,required String nftPrice,required nftGain  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      contentPadding: EdgeInsets.all(30.h),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 8.h),
            Text(bookingStatus, style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600, color: Colors.grey.shade800)),

            Image.asset(nftImage, width: 150.w, height: 180.h), // dummy image
            // SizedBox(height: 2),
            Text(nftName, style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600,color: Colors.grey.shade700)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Price: ', style: TextStyle(color: Colors.green, fontSize: 14.sp)),
                Image.asset('assets/usdt.png', width: 16.w, height: 16.h),  SizedBox(width: 2.w),
                Text(nftPrice, style: TextStyle(color: Colors.green, fontSize: 14.sp)),
              ],),

            SizedBox(height: 18.h),
   Padding(
              padding:  EdgeInsets.symmetric(horizontal: 6.0.w),
              child: Container(
                width: 230.w,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [ Color(0xFFB8860B),Color(0xFFFFF5B6),Color(0xFFDAA520)], // Gold Gradient Button
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  onPressed: () {
                    // showLoadingDialog(context,expectedIncomeText: '18~19.5',loaderText: 'Opening...');
setState(() {
  isConfirmed = false;

  collectedNFTs.add({
    "image": nftImage,
    "name": nftName,
    "price": nftPrice,
    'percentagegain': nftGain
  });
print('null value of gainpercentage $nftGain');

});
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
  void showSellDialog(BuildContext context, Map<String, String> nft, String operation, double operand,String royalty) {
    double originalPrice = double.tryParse(nft['price'] ?? '0') ?? 0;
    double calculatedPrice = originalPrice;

    switch (operation) {
      case '*':
        calculatedPrice = originalPrice * operand;
        break;
      case '+':
        calculatedPrice = originalPrice + operand;
        break;
      case '-':
        calculatedPrice = originalPrice - operand;
        break;
      case '/':
        calculatedPrice = originalPrice / operand;
        break;
      default:
        calculatedPrice = originalPrice;
    }

    double sellPrice = double.parse(calculatedPrice.toStringAsFixed(2));

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          child: Container(
            padding: EdgeInsets.all(16.h),
            width: 320.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// NFT Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    nft['image']!,
                    width: 120.w,
                    height: 120.h,
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(height: 12.h),

                /// NFT Name
                Text(
                  nft['name']!,
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                ),

                SizedBox(height: 16.h),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Sell", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
                ),

                SizedBox(height: 8.h),Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Price", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500,color: Colors.grey)),
                ),

                // SizedBox(height: 8),

                /// Price Row
                Row(
                  children: [
                    /// USDT Box
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        children: [
                          Image.asset("assets/usdt.png", width: 20.w, height: 20.h),
                          SizedBox(width: 4.w),
                          Text("USDT", style: TextStyle(fontSize: 14.sp)),
                        ],
                      ),
                    ),

                    SizedBox(width: 8.w),

                    /// Non-Editable TextField
                    Expanded(
// flex: 2,
                      child: AbsorbPointer(

                        child: TextFormField(
                          initialValue: "$sellPrice",
                          readOnly: true,
                          decoration: InputDecoration(

                            contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(color: Colors.grey
                                               ,         )),
                            hintText: "Price",
                          ),
                          style: TextStyle(color: Colors.black45),
                        ),
                      ),
                    )
                  ],
                ), SizedBox(height: 10.h),

                Divider(color: Colors.grey.shade300,),
                // SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Fees", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                ),
              SizedBox(height: 5.h),
               Row(

                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                 Align(
                   alignment: Alignment.centerLeft,
                   child: Text("Royalty", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400,color: Colors.grey)),
                 ),
                 Text(royalty,style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400,color: Colors.grey ))

               ],),
                /// Sell Button
                SizedBox(height: 15.h),
                Container(
                  width: double.infinity,
                  height: 42.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFB8860B), Color(0xFFFFF5B6), Color(0xFFDAA520)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () {
                      print("Selling ${nft['name']} at $sellPrice USDT via $operation $operand");

                    Navigator.of(context).pop();

                      Future.delayed(Duration(milliseconds: 1), () {
                        if (context.mounted) {
                          showSuccessDialog(context); // Then show success dialog
                        }
                      });
                    },

                    child: Text(
                      "Completed",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
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


  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // user can tap outside to close
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 4), () {
          if (context.mounted) {
            Navigator.of(context).pop(); // Use local dialog context
          }
        });

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Container(
            padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.white,
            ),
            width:160.w, // responsive width
            height:  MediaQuery.of(context).size.width * 0.7,
           child: Center(
             child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Green Circle with Tick Icon
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green.withOpacity(0.15),
                    ),
                    padding: EdgeInsets.all(20.sp),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 60.w,
                    ),
                  ),
                   SizedBox(height: 10.h),
                   Text(
                    'Listed Successfully!!!',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   SizedBox(height: 10.h),
                ],
              ),
           ),
          ),
        );
      },
    );
  }


  Widget buildNFTCard(Map<String, String> nft, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// NFT Image
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.r), bottom: Radius.circular(12.r)),
              child: Image.asset(
                nft['image']!,
                height: 120.h,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 8.h),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nft['name']!,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Image.asset('assets/usdt.png', width: 18.w, height: 18.h),
                      SizedBox(width: 4.w),
                      Text(
                        nft['price']!,
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 13.5.sp),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Spacer(),
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 4.0.h),
                    child: Row(
                      children: [
                        Icon(Icons.show_chart_outlined, size: 14.sp, color: Colors.green, weight: 2),
                        SizedBox(width: 4.w),
                        Text(nft['percentagegain'] ?? '3.4%' ,
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 12.6.sp,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: double.infinity,
                    height: 36.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFB8860B), Color(0xFFFFF5B6), Color(0xFFDAA520)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        print("Sell NFT clicked: ${nft['name']}");

                        String operator = '*';
                        double operand = 0.8;
                        String royalty = '0.1';

                        showSellDialog(context, nft, operator, operand, '$royalty%');

                setState(() {
                  isSelled = false;
                });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                      child:isSelled?  Text(
                        "Sell",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13.5.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ) : AnimatedStatusText(
    onMatchFound: () {
    // Show dialog automatically
    showDialog(
    context: context,
    builder: (context) => AlertDialog(
    title: Text("Listed Successfully"),
    content: Text("Your NFT has been listed on the marketplace."),
    actions: [
    TextButton(
    onPressed: () => Navigator.pop(context),
    child: Text("Cool"),
    )
    ],
    ),
    );
    },
    ),

                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
        //
        //         // 2 rows of 3 containers each
        //         for (int row = 0; row < 2; row++)
        //   Row(
        //       children: [
        //       for (int col = 0; col < 3; col++)
        // Expanded(
        //     child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
        //     child: AspectRatio(
        //       aspectRatio: 0.95,
        //       child: _buildContainer(
        //       icon: icons[row * 3 + col],
        //       title: titles[row * 3 + col],
        //       value: values[row * 3 + col],
        //       borderColor: borderColors[row * 3 + col],
        //       ),
        //     ),
        //     ),
        //     ),
        //     ],
        //     )
            Padding(
              padding:  EdgeInsets.all(6.sp),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                crossAxisSpacing: 12.h,
                mainAxisSpacing: 12.w,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildContainer(
                    icon: Icons.monetization_on,
                    title: "Today's\n Gain",
                    value: '0',
                    borderColor: Color(0xFFB8860B),
                  ),
                  _buildContainer(
                    icon: Icons.savings,
                    title: "Lifetime Income",
                    value: '0',
                    borderColor: Color(0xFFB8860B),
                  ),
                  _buildContainer(
                    icon: Icons.group,
                    title: "Team Support",
                    value: '0',
                    borderColor: Color(0xFFB8860B),
                  ),
                  _buildContainer(
                    icon: Icons.timeline,
                    title: "Profit\n Range",
                    value: '1~1000',
                    borderColor: Color(0xFFB8860B),
                  ),
                  _buildContainer(
                    icon: Icons.wallet,
                    title: "Wallet Balance",
                    value: '0',
                    borderColor: Color(0xFFB8860B),
                  ),
                  _buildContainer(
                    icon: Icons.security_outlined,
                    title: "Reserve Credits",
                    value: '0',
                    borderColor: Color(0xFFB8860B),
                  ),
                ],
              ),
            ),

            SizedBox(height: 8.h,),
            _buildTabBar(),
            SizedBox(height: 10.h),
            Expanded(child: _buildTabContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer({
    required IconData icon,
    required String title,
    required String value,
    required Color borderColor,
  }) {
    return Container(
      width: 120.w, // widthy
      height: 100.h, // not too tall
      padding: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        border: Border.all(color: borderColor, width: 1.5),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: borderColor.withOpacity(0.4),
            blurRadius: 2.5.r,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          Icon(icon, color: borderColor, size: 19.w,shadows: [
            Shadow(
              color: borderColor.withOpacity(0.4),
              blurRadius: 2.r,
              offset: Offset(1, 1),)


          ],),
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.brown[800],
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.brown.shade900,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(tabLabels.length, (index) {
        final isSelected = _selectedIndex == index;
        return InkWell(
          onTap: () => setState(() => _selectedIndex = index),
          child: Column(
            children: [
              Text(
                tabLabels[index],
                style: TextStyle(
                  fontSize: isSelected ? 15.sp : 15.sp,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Color(0xFFB8860B) : Colors.grey,
                ),
              ),
              SizedBox(height: 4.h),
              if (isSelected)
                Container(
                  height: 4.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFB8860B),
                        Color(0xFFFFF5B6),
                        Color(0xFFDAA520),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }

  bool isDropdownOpen = false;

  //
  // Widget buildLevelIncomeDropdown() {
  //   return StatefulBuilder(
  //     builder: (context, setState) {
  //       return Container(
  //         width: 180,
  //         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(10),
  //           border: Border.all(color: Colors.brown.shade800),
  //         ),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             // Tappable dropdown header
  //             GestureDetector(
  //               onTap: () {
  //                 setState(() {
  //                   isDropdownOpen = !isDropdownOpen;
  //                 });
  //               },
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     selectedLevel,
  //                     style: TextStyle(color: Colors.brown.shade800, fontWeight: FontWeight.bold),
  //                   ),
  //                   Icon(
  //                     isDropdownOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
  //                     color: Colors.brown.shade800,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //
  //             if (isDropdownOpen) ...[
  //               SizedBox(height: 8),
  //
  //               // Fixed grey header row
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text('LV', style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w400,fontSize: 10)),
  //                   Text('Income(%)', style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w400,fontSize: 10)),
  //                 ],
  //               ),
  //               SizedBox(height: 6),
  //
  //               // Dynamic level list
  //               ...levelIncomeData.entries.map((entry) {
  //                 return GestureDetector(
  //                   onTap: () {
  //                     setState(() {
  //                       selectedLevel = entry.key;
  //                       isDropdownOpen = false;
  //                     });
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.symmetric(vertical: 4.0),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Text(entry.key, style: TextStyle(color: Colors.brown.shade800,fontSize: 12)),
  //                         Text(entry.value, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,fontSize: 12)),
  //                       ],
  //                     ),
  //                   ),
  //                 );
  //               }).toList(),
  //             ]
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
  //
  //


  Widget _buildTabContent() {
    switch (_selectedIndex) {
      case 0:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/no_data.png',
              height: 80.h,
              width: 80.w,
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(child: Text('No Data Available')),
            SizedBox(
              height: 10.h,
            ),
            Center(child: buildGmtDateTime()),
            SizedBox(
              height: 60.h,
            ),
          ],
        );
      case 1:
        return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 4.0.w),
                child: Row(
                  children: [
                    // Dropdown 1: Level Income
                    // Level Income Dropdown
                    Container(
                      width: 180.w,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: Colors.brown.shade800),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          value: selectedLevel,
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 180.h,direction: DropdownDirection.right,
                            width: 170.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            offset: const Offset(0, 0), // ↓ Always open downward
                          ),
                          menuItemStyleData:  MenuItemStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                          ),
                          items: [
                            // Header - Disabled
                            DropdownMenuItem<String>(
                              enabled: false,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('LV', style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w500,fontSize: 14.sp)),
                                  Text('Income(%)', style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w500,fontSize: 14.sp)),
                                ],
                              ),
                            ),
                            // Dynamic Entries
                            ...levelIncomeData.entries.map((entry) {
                              return DropdownMenuItem(
                                value: entry.key,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(entry.key, style: TextStyle(color: Colors.grey.shade800)),
                                    Text(entry.value, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,fontSize: 14.sp)),
                                  ],
                                ),
                              );
                            }).toList(),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                selectedLevel = value;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 4.w),

                    // Dropdown 2: Range
                    Expanded(
                      child: Container(
                        // height: 45,
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: Colors.brown.shade800),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            value: selectedRange,
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 180.h,
                              width: 125.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              offset: const Offset(0, 0), // always open below
                            ),
                            menuItemStyleData:  MenuItemStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                            ),
                            items: [
                              // Fixed Header
                              DropdownMenuItem<String>(
                                enabled: false,
                                child: Row(
                                  children: [
                                    Icon(Icons.info_outline, color: Colors.grey.shade600, size: 14.w),
                                    SizedBox(width: 6.w),
                                    Text("USDT Range", style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w400,fontSize: 14.sp)),
                                  ],
                                ),
                              ),
                              // Options
                              ...['50~150', ].map((range) {
                                return DropdownMenuItem(
                                  value: range,
                                  child: Row(
                                    children: [
                                      Image.asset('assets/usdt.png', width: 18.w, height: 18.h),
                                      SizedBox(width: 6.w),
                                      Text(range, style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade800)),
                                    ],
                                  ),
                                );
                              }),
                            ],
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  selectedRange = value;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ),


                    SizedBox(width: 4.w),

                    // Tooltip Icon
                    InstantTooltipIcon(),

                  ],
                ),
              ),
              SizedBox(height: 20.h),
    isConfirmed ?   Padding(
                padding:  EdgeInsets.symmetric(horizontal: 6.0.w),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [ Color(0xFFB8860B),Color(0xFFFFF5B6),Color(0xFFDAA520)], // Gold Gradient Button
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    onPressed: () {
showLoadingDialog(context,expectedIncomeText: '18~19.5',loaderText: 'Opening...');
                      },
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ):
    Container(
      width: double.infinity,
      height: 90.h,
      // padding: EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFB8860B), Color(0xFFFFF5B6), Color(0xFFDAA520)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('nextRound will be in...',style: TextStyle(color: Colors.brown.shade800.withOpacity(.7),fontSize: 12.sp),),

          SizedBox(height: 8.h,),
          Center(
        child: TimerCountdown(
          endTime: DateTime.now().add(Duration(seconds: 24)), // 🕒 24hr from now
          format: CountDownTimerFormat.hoursMinutesSeconds,
          timeTextStyle: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.brown.shade800,
            backgroundColor: Colors.amber.shade50,
            // shadows: [
            //   BoxShadow(color: Colors.brown.shade800,blurRadius: 1)
            // ]
            // decoration: TextDecoration.combine()
          ),
          colonsTextStyle: TextStyle(
            fontSize: 20.sp,
            color: Colors.brown.withOpacity(.7),
          ),
          descriptionTextStyle: TextStyle(
            fontSize: 10.sp,
            color: Colors.brown,fontStyle: FontStyle.italic
          ),
          // spacerWidth: 20,
          onEnd: () {
            setState(() {
              isConfirmed = true; // 👈 Wapas old content dikhana hai
            });
          },
        ),
      ),],)
    )
            ],
          )
        );
      case 2:
        return collectedNFTs.isEmpty
            ? Center(child: Text("No NFTs collected yet",style: TextStyle(color: Colors.grey),))
            :ListView.builder(
          itemCount: (collectedNFTs.length / 2).ceil(), // Because 2 items per row
          itemBuilder: (context, index) {
            final int firstIndex = index * 2;
            final int secondIndex = firstIndex + 1;

            return Padding(
              padding:  EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 4.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child: buildNFTCard(collectedNFTs[firstIndex], context)),

                  SizedBox(width: 12.w), // Space between two cards

                  if (secondIndex < collectedNFTs.length)
                    Expanded(child: buildNFTCard(collectedNFTs[secondIndex], context))
                  else
                    Expanded(child: Container()), // To keep alignment if odd number
                ],
              ),
            );
          },
        );


      default:
        return Container();
    }
  }
}



Widget buildGmtDateTime() {
  DateTime now = DateTime.now().toUtc(); // Convert to UTC
  String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

  return Text(
    'GMT Time: $formattedDate',
    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
  );
}


class InstantTooltipIcon extends StatefulWidget {
  @override
  _InstantTooltipIconState createState() => _InstantTooltipIconState();
}

class _InstantTooltipIconState extends State<InstantTooltipIcon> {
  OverlayEntry? _overlayEntry;
  final GlobalKey _iconKey = GlobalKey();

  void _showTooltip() {
    if (_overlayEntry != null) return;

    final RenderBox renderBox = _iconKey.currentContext!.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    // Calculate safe position within screen
    double left = offset.dx;
    double top = offset.dy - 70; // Show above the icon
    if (left + 200 > screenWidth) left = screenWidth - 210;
    if (top < 0) top = offset.dy + size.height + 10;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: left,
        top: top,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 200.w,
            padding: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              'This platform may involve risk. Please invest carefully.',
              style: TextStyle(color: Colors.white, fontSize: 13.sp),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);

    // Auto-hide after 2 seconds
    Future.delayed(Duration(seconds: 1), () {
      _hideTooltip();
    });
  }

  void _hideTooltip() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _showTooltip(),
      child: GestureDetector(
        onTap: _showTooltip,
        child: Icon(Icons.info_outline_rounded, key: _iconKey, color: Colors.brown.shade800),
      ),
    );
  }
}
