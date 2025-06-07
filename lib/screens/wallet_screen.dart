import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // for Clipboard functionality
import 'package:flutter_screenutil/flutter_screenutil.dart';
class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  // Fake real-time values (replace these later with your live data)
  double walletBalance = 123.45;
  double totalEarnings = 0;
  double withdrawnAmount = 0;
  double availableBalance = 123.45;
  String depositAddress = "0xB4D5c9f98B.TGFJKFgfnhf djff..E5f1e0A"; // truncated for design

  List<Map<String, dynamic>> transactions = [
    {
      'type': 'Deposit',
      'amount': 123.45,
      'date': '2024-04-28 14:58:05',
    },
    {
      'type': 'Withdraw',
      'amount': -100.00,
      'date': '2024-04-27 12:30:00',
    }, {
      'type': 'Deposit',
      'amount': 123.45,
      'date': '2024-04-28 14:58:05',
    },
    {
      'type': 'Withdraw',
      'amount': -100.00,
      'date': '2024-04-27 12:30:00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration:  BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFB8860B),
                  Color(0xFFFFF5B6),
                  Color(0xFFDAA520),
                ],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
          // White Mask Layer
          Padding(
            padding: EdgeInsets.only(top: 200.0.w),
            child: Container(
              decoration:  BoxDecoration(
                color: Colors.white60,
    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
            ),
          ),
          // Foreground Content
          SafeArea(
            child: SingleChildScrollView(
              padding:  EdgeInsets.symmetric(horizontal: 13.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h,),
                  Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white.withOpacity(0.8.w),size: 25.w,weight: 0.3.h,),
                 SizedBox(height: 8.h,),
                  // Card 1 - Wallet Balance
                  Container(
                    width: double.infinity,
                    height: 230.h,
                    margin: EdgeInsets.symmetric(vertical: 6.h),
                    padding:  EdgeInsets.all(20.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14.r),
                      border: Border.all(color: Colors.white.withOpacity(0.4.r)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10.r,
                          spreadRadius: 2.r,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                         Text(
                          "My wallet balance(USDT)",
                          style: TextStyle(
                            fontSize: 13.h,
                            fontWeight: FontWeight.w400,
                            color: 	Color(0xFF757575),
                          ),
                        ),
                         SizedBox(height: 25.h),
                         Text(
                          "123.45",
                          style: TextStyle(
                            fontSize: 34.h,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                         SizedBox(height: 35.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _walletInfo("Net Gains", 0),
                            _walletInfo("Extracted", 0),
                            _walletInfo("Leftover", 0),
                          ],
                        ),
                      ],
                    ),
                  ),
/////\$${walletBalance.toStringAsFixed(2)}
//                   const SizedBox(height: 20),

                  // Card 2 - Deposit Address
                  Card(
                    margin: EdgeInsets.zero,color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h,width: 10.w,),
                        Row(
                          children: [
                            SizedBox(width: 15.w,),
                            Center(
                              child:  Text(
                                "Deposit Address USDT(TRC-20)",
                                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                         SizedBox(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 15.w,),
                            Expanded(
                              child: Text(
                                depositAddress,
                                style: TextStyle(color: Colors.grey),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Clipboard.setData(ClipboardData(text: depositAddress));

                              },
                              icon: Icon(Icons.copy,color: Colors.grey,size: 20.w,),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                   SizedBox(height: 6.h),

                  // Card 3 - Action Buttons
                  Card(
                    margin: EdgeInsets.zero,color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
  child: Padding(
    padding:  EdgeInsets.all(12.0.r),
    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          _actionButton(Icons.call_made, "Withdraw",(){

                          }),
                          _actionButton(Icons.call_received, "Deposit",(){

                          }),
                          _actionButton(Icons.settings, "Settings",(){

                          }),
                        ],
                      ),
  ),
                  ),

                  // const SizedBox(height: 6),

                  // History Title

                  // Transaction List
                  Container(
                    width: double.infinity,
                    margin:  EdgeInsets.only(top: 6.h),
                    // padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14.r),
                      border: Border.all(color: Colors.white.withOpacity(0.4)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10.r,
                          spreadRadius: 2.r,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [SizedBox(height: 15.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0.r),
                              child: Text(
                                "Transaction History",
                                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600,color: Colors.black87),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 12.0.r),
                              child: InkWell(child: Text("View All >",style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500,color: Colors.grey[700]),
                              )),
                            ),
                            // SizedBox(height: 0,),
                          ],
                        ),SizedBox(height: 5.sp,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.r),
                          child: Divider(),
                        ),
                        ListView.builder(
                          itemCount: transactions.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final transaction = transactions[index];
                            bool isCredit = transaction['amount'] >= 0;
                            return Card(
                              shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white10)),
                              margin: EdgeInsets.zero.h,
                      elevation: 0,
                      color: Colors.white,
                              child: ListTile(
                                // leading: Image.asset('assets/usdt.png', height: 30),
                                title: Text(
                                  "${transaction['type']} USDT",
                                  style:  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                                ),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                    Text(transaction['date'],style: TextStyle(color: Colors.grey),),
                    // SizedBox(height: 0,)
Divider()
                                  ],
                                ),
                                trailing: Text(
                                  "${isCredit ? '+' : ''}${transaction['amount'].toStringAsFixed(2)}",
                                  style: TextStyle(
                                    color: isCredit ? Colors.green : Colors.red,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.sp,

                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 20.h,)
                      ],
                    ),

                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _walletInfo(String label, double amount) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Row(children: [ Image.asset('assets/usdt.png', height: 16.h),
          SizedBox(width: 4.w),
         Text(
           "${amount.toStringAsFixed(2)}",
           style:  TextStyle(fontWeight: FontWeight.w500,fontSize: 15.sp),
         ),
          SizedBox(height: 2.h),],),
        Text(
          label,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey[500]),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _actionButton(IconData icon, String label,VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
        onTap: onTap,
        child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 3.h,),
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
    icon,
    size: 27.w, // Proper icon size
    color: Colors.white, // Must be white for gradient
    ),
    ),
    ),
    // const SizedBox(height: 4),
    Text(
    label,
    textAlign: TextAlign.center,
    style: TextStyle( fontSize:13.sp,color: Colors.grey),
    )
      ],
        ) ),  SizedBox(height: 5.h,),],
    )
    ;
  }
}
