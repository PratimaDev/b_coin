import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecordScreen extends StatefulWidget {
  @override
  _RecordScreenState createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  final Random _random = Random();
  List<double> earnings = [3, 1, 4, 3, 5, 2];
  void _updateEarnings() {
    setState(() {
      earnings = List.generate(6, (_) => _random.nextDouble() * 5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(12.0.h),
        child: Column(
          children: [
            Text(
              'Earnings Overview',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(earnings.length, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: 40.w,
                    height: earnings[index] * 50.h,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      earnings[index].toStringAsFixed(1),
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: _updateEarnings,
              child: Text('Update Earnings',style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
            ),


          ],
        ),
      ),
    );
  }
}
