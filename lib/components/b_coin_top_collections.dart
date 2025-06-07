import 'package:b_coin/screens/market_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BCoinTopCollections extends StatelessWidget {
  final List<Map<String, dynamic>> collectionData;

  const BCoinTopCollections({
    Key? key,
    required this.collectionData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'B COIN HOT COLLECTIBLES',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Last 24 Hours',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MarketScreen()),
                  );
                },
                child: Row(
                  children: [
                    Text(
                      'More',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 18.sp,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: collectionData.length,
          itemBuilder: (context, index) {
            final item = collectionData[index];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0.w),
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        item['imageUrl'] ??
                            'https://cdn.pixabay.com/photo/2023/01/04/01/37/nft-7695648_1280.jpg',
                      ),
                      radius: 25.r,
                    ),
                  ],
                ),
                title: Text(
                  item['name'] ?? 'Unknown name',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
                subtitle: Text(
                  '💸 ${item['volume'] ?? 'N/A'}',
                  style: TextStyle(fontSize: 12.sp),
                ),
                trailing: Text(
                  '${item['percentageChange'] ?? '+0.00'}%',
                  style: TextStyle(
                    color: (item['percentageChange'] ?? '').toString().startsWith('+')
                        ? Colors.green
                        : Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
