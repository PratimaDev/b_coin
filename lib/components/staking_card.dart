import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StakingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Current Staked', style: TextStyle(color: Colors.white70)),
          SizedBox(height: 5.h),
          Text('1,500 BCoin', style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Earnings: +\$150', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
              Text('APR: 12%', style: TextStyle(color: Colors.white70)),
            ],
          ),
        ],
      ),
    );
  }
}
