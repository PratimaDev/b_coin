import 'package:b_coin/components/earn_list_screen.dart';
import 'package:b_coin/screens/reserve_screen.dart';
import 'package:b_coin/screens/total_record_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({super.key});

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {

  int selectedTab = 0;
  final List<String> mainTabs = ['Earn', 'Record', 'Reserve', ];


  Widget buildContent() {
    Widget content;

    switch (selectedTab) {
      case 0: // Elite Zone or Free Zone (combined case)
        content = EarnListScreen();
        break;

      case 1:
        content =RecordScreen();
         break;
      case 2: // No Data Available
        content = GoldenReserveScreen();
        break;



      default:
        content = Center(
          child: Text('Select a tab', style: TextStyle(color: Colors.black)),
        );
    }

    return Padding(
      padding: EdgeInsets.all(8.0.h),
      child: content,
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          buildTabBar(mainTabs, selectedTab, (index) => setState(() => selectedTab = index)),
          // if (selectedTab == 0) buildGoldenTabBar(subTabs, selectedSubTab, (index) => setState(() => selectedSubTab = index)),
          // if (selectedTab == 0 && selectedSubTab == 0) buildTabBar(zones, selectedZone, (index) => setState(() => selectedZone = index)),
          Expanded(

              child: buildContent()),
        ],
      ),
    );
  }
}


Widget buildTabBar(List<String> items, int selectedIndex, Function(int) onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: List.generate(items.length, (index) {
      return GestureDetector(
        onTap: () => onTap(index),
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            Text(
              items[index],
              style: TextStyle(
                fontSize: selectedIndex == index ? 17.sp : 15.sp,
                fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                color: selectedIndex == index ? Colors.black : Colors.grey,
              ),
            ),
            if (selectedIndex == index)
              Container(
                margin:  EdgeInsets.only(top: 4.h),
                height: 4.h,
                width: 40.w,

                decoration: BoxDecoration(
                  gradient:
                  const LinearGradient(
                    colors: [Color(0xFFB8860B),Color(0xFFFFF5B6),Color(0xFFDAA520)],
                  )
                  ,
                  borderRadius: BorderRadius.circular(8.r),
                ),

              ),
          ],
        ),
      );
    }),
  );
}



