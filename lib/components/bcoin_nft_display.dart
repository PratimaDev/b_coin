import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BCoinNFTCard extends StatelessWidget {
  final String nftName;
  final String ownerName;
  final String totalItems;
  final String mainImage;
  final List<String> sideImages;
  final String ownerImage;

  const BCoinNFTCard({
    Key? key,
    required this.nftName,
    required this.ownerName,
    required this.totalItems,
    required this.mainImage,
    required this.sideImages,
    required this.ownerImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 15.h),
      child: Container(

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.amber.shade100, Colors.amber.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),


        child: Padding(
          padding:  EdgeInsets.all(8.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h,),

              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.asset(
                        mainImage,
                        fit: BoxFit.fill,
                        height: 230.h,
                        width: 150.w,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    children: sideImages.map((image) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 6.5.h),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: Image.asset(
                            image,
                            fit: BoxFit.fill,
                            height: 70.h,
                            width: 90.w,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 10.h),
                child: Text(
                  nftName,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundImage: AssetImage(ownerImage),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        ownerName,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),),
                    onPressed: () {},
                    child: Text(
                      'Volume: $totalItems',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
SizedBox(height: 10.h,)
            ],
          ),
        ),
      ),
    );
  }
}

