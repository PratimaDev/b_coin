import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NFTScreen extends StatelessWidget {
  final List<String> nftImages = List.generate(
    12,
        (index) => 'assets/nft_${index + 1}.png',
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0.r),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(), // No internal scrolling
        shrinkWrap: true, // Wrap content properly
        itemCount: nftImages.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 items per row
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1, // Square-shaped items
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4.r,
                  spreadRadius: 2.r,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                nftImages[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
