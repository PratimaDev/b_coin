import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NFTBidDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NFTCard(
          imageUrl: 'assets/bid_1.png',
          profileUrl: 'assets/img.png',
          name: 'GiffgaffApeClub_6807',
          bid: '280 USDT',
          rank: '43',
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: NFTSmallCard(
                imageUrl: 'assets/bid_2.png',
                profileUrl: 'assets/secure.png',
                name: 'GiffgaffApeClub_671024',
                bid: '279',
              ),
            ),

            SizedBox(width: 8.w),
            Expanded(
              child: NFTSmallCard(
                imageUrl: 'assets/bid_3.png',
                profileUrl: 'assets/start.png',
                name: 'GiffgaffApeClub_530237',
                bid: '391',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class NFTCard extends StatelessWidget {
  final String imageUrl;
  final String profileUrl;
  final String name;
  final String bid;
  final String rank;

  NFTCard({required this.imageUrl, required this.profileUrl, required this.name, required this.bid, required this.rank});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4.r)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(imageUrl, fit: BoxFit.cover),
          ),
          SizedBox(height: 18.h),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(profileUrl),
                backgroundColor: Colors.transparent,
                radius: 16.r,
              ),
              SizedBox(width: 8.w),
              Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Rank: $rank'),
              Text('Highest Bid: $bid', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
            ],
          ),
        ],
      ),
    );
  }
}

class NFTSmallCard extends StatelessWidget {
  final String imageUrl;
  final String profileUrl;
  final String name;
  final String bid;

  NFTSmallCard({required this.imageUrl, required this.profileUrl, required this.name, required this.bid});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4.r)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(imageUrl, fit: BoxFit.fill, height: 100.h, width: double.infinity),
          ),
          SizedBox(height: 18.h),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(profileUrl),
                backgroundColor: Colors.transparent,
                radius: 14.r,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis, // to add "..." if the text is too long
                  maxLines: 1, // limits to a single line
                  softWrap: false, // avoids breaking text into multiple lines
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),
          Text(' $bid', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: Colors.green)),
        ],
      ),
    );
  }
}
