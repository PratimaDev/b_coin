import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NFTCarousel extends StatelessWidget {
  final List<Map<String, dynamic>> nfts = [
    {
      "image": "https://i.seadn.io/s/raw/files/65410b6197477530d22f5b5c6247b532.png?auto=format&dpr=1&w=1000", // Replace with actual NFT image URLs
      "title": "Crypto Queen",
      "bid": "201.56 USDT"
    },
    {
      "image": "https://i.seadn.io/gcs/files/a46f8e048eea703694a4fac4ccff8c63.png?auto=format&dpr=1&w=1000",
      "title": "Pixel Punk",
      "bid": "150.00 USDT"
    },
    {
      "image": "https://i.seadn.io/s/raw/files/4e28462fbd27f49c54c61c8078334969.png?auto=format&dpr=1&w=1000",
      "title": "Cyber Samurai",
      "bid": "310.25 USDT"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300.h,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1.h,
      ),
      items: nfts.map((nft) {
        return NFTCard(nft: nft);
      }).toList(),
    );
  }
}

class NFTCard extends StatelessWidget {
  final Map<String, dynamic> nft;
  NFTCard({required this.nft});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: LinearGradient(
          colors: [  Color(0xFFB8860B),
            Color(0xFFFFF5B6),
            Color(0xFFDAA520),], // Purple gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          // BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              child: Image.network(nft["image"], fit: BoxFit.cover, width: double.infinity),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nft["title"],
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Current Bid",
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      nft["bid"],
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
