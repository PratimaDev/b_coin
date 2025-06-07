import 'package:b_coin/components/listings_detail.dart';
// import 'package:b_coin/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

class NftListings extends StatelessWidget {
  final List<Map<String, dynamic>> _nftItems = [
    {'name': 'NoxiousAudience_0106481', 'price': 0.1, 'change': 0.0, 'image': 'assets/bid_3.png'},
    {'name': 'NoxiousAudience_803025', 'price': 0.1, 'change': 0.1, 'image': 'assets/bid_3.png'},
    {'name': 'NoxiousAudience_989898123864', 'price': 0.3, 'change': -0.05, 'image': 'assets/bid_3.png'},
    {'name': 'NoxiousAudience_11234561223', 'price': 0.5, 'change': 0.2, 'image': 'assets/bid_3.png'},
 {'name': 'NoxiousAudience_0106481', 'price': 0.1, 'change': 0.0, 'image': 'assets/bid_3.png'},
    {'name': 'NoxiousAudience_803025', 'price': 0.1, 'change': 0.1, 'image': 'assets/bid_3.png'},
    {'name': 'NoxiousAudience_989898123864', 'price': 0.3, 'change': -0.05, 'image': 'assets/bid_3.png'},
    {'name': 'NoxiousAudience_11234561223', 'price': 0.5, 'change': 0.2, 'image': 'assets/bid_3.png'},
 {'name': 'NoxiousAudience_0106481', 'price': 0.1, 'change': 0.0, 'image': 'assets/bid_3.png'},
    {'name': 'NoxiousAudience_803025', 'price': 0.1, 'change': 0.1, 'image': 'assets/bid_3.png'},
    {'name': 'NoxiousAudience_989898123864', 'price': 0.3, 'change': -0.05, 'image': 'assets/bid_3.png'},
    {'name': 'NoxiousAudience_11234561223', 'price': 0.5, 'change': 0.2, 'image': 'assets/bid_3.png'},
 {'name': 'NoxiousAudience_0106481', 'price': 0.1, 'change': 0.0, 'image': 'assets/bid_3.png'},
    {'name': 'NoxiousAudience_803025', 'price': 0.1, 'change': 0.1, 'image': 'assets/bid_3.png'},
    {'name': 'NoxiousAudience_989898123864', 'price': 0.3, 'change': -0.05, 'image': 'assets/bid_3.png'},
    {'name': 'NoxiousAudience_11234561223', 'price': 0.5, 'change': 0.2, 'image': 'assets/bid_3.png'},
 {'name': 'NoxiousAudience_0106481', 'price': 0.1, 'change': 0.0, 'image': 'assets/bid_3.png'},
    {'name': 'NoxiousAudience_803025', 'price': 0.1, 'change': 0.1, 'image': 'assets/bid_3.png'},
    {'name': 'NoxiousAudience_989898123864', 'price': 0.3, 'change': -0.05, 'image': 'assets/bid_3.png'},
    {'name': 'NoxiousAudience_11234561223', 'price': 0.5, 'change': 0.2, 'image': 'assets/bid_3.png'},
  ];

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      padding:  EdgeInsets.all(8.0.r),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 6.r,
        mainAxisSpacing: 8.w,
        childAspectRatio: 0.9.sh,
      ),
      itemCount: _nftItems.length,
      itemBuilder: (context, index) {
        final item = _nftItems[index];
        return InkWell(

          onTap: (){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>ListingsDetail()));},
          child: Card(
                 elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                    child: Image.asset(
                      item['image'],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 3.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(Icons.attach_money, size: 16.w, color: Colors.green),
                          Text('${item['price']}'),
                          Spacer(),
                          Icon(
                            item['change'] >= 0 ? Icons.arrow_upward : Icons.arrow_downward,
                            color: item['change'] >= 0 ? Colors.green : Colors.red,
                            size: 16.w,
                          ),
                          Text(
                            '${item['change']}',
                            style: TextStyle(
                              color: item['change'] >= 0 ? Colors.green : Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
