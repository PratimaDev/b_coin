
import 'package:b_coin/components/nft_listings.dart';
import 'package:b_coin/components/nft_search_bar.dart';

import 'package:b_coin/screens/home_screen.dart';
import 'package:b_coin/screens/market_screen.dart';
import 'package:b_coin/screens/rewards_screen.dart';
import 'package:b_coin/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/profile_screen.dart';

// 1. Define your data models
class NFTCollection {
  final String name;
  final String imagePath;
  final String creator;
  final String description;
  final String items;
  final String owners;
  final String volume;
  final String floorPrice;

  NFTCollection({
    required this.name,
    required this.imagePath,
    required this.creator,
    required this.description,
    required this.items,
    required this.owners,
    required this.volume,
    required this.floorPrice,
  });
}

class NFTItem {
  final String id;
  final double price;
  final double change;
  final double volume;

  NFTItem({
    required this.id,
    required this.price,
    required this.change,
    required this.volume,
  });
}


// 2. Create dummy data lists
final List<NFTCollection> collections = [
  NFTCollection(
    name: "PunkCat",
    imagePath: "assets/bid_1.png",
    creator: "Michelangelo Buonarroti",
    description: "Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Mhello ichelangelo di Lodovico Buonarroti Simon...",
    items: "91K",
    owners: "4.54K",
    volume: "8.35B",
    floorPrice: "32.39 ETH",
  ),NFTCollection(
    name: "Noxious Audience",
    imagePath: "assets/bid_2.png",
    creator: "Michelangelo Buonarroti",
    description: "Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Mhello ichelangelo di Lodovico Buonarroti Simon...",
    items: "91K",
    owners: "4.54K",
    volume: "8.35B",
    floorPrice: "32.39 ETH",
  ),NFTCollection(
    name: "Noxious Audience",
    imagePath: "assets/bid_3.png",
    creator: "Michelangelo Buonarroti",
    description: "Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Mhello ichelangelo di Lodovico Buonarroti Simon...",
    items: "91K",
    owners: "4.54K",
    volume: "8.35B",
    floorPrice: "32.39 ETH",
  ),NFTCollection(
    name: "Noxious Audience",
    imagePath: "assets/bid_3.png",
    creator: "Michelangelo Buonarroti",
    description: "Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Mhello ichelangelo di Lodovico Buonarroti Simon...",
    items: "91K",
    owners: "4.54K",
    volume: "8.35B",
    floorPrice: "32.39 ETH",
  ),NFTCollection(
    name: "Noxious Audience",
    imagePath: "assets/bid_3.png",
    creator: "Michelangelo Buonarroti",
    description: "Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Mhello ichelangelo di Lodovico Buonarroti Simon...",
    items: "91K",
    owners: "4.54K",
    volume: "8.35B",
    floorPrice: "32.39 ETH",
  ),NFTCollection(
    name: "Noxious Audience",
    imagePath: "assets/bid_3.png",
    creator: "Michelangelo Buonarroti",
    description: "Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Mhello ichelangelo di Lodovico Buonarroti Simon...",
    items: "91K",
    owners: "4.54K",
    volume: "8.35B",
    floorPrice: "32.39 ETH",
  ),NFTCollection(
    name: "Noxious Audience",
    imagePath: "assets/bid_3.png",
    creator: "Michelangelo Buonarroti",
    description: "Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Mhello ichelangelo di Lodovico Buonarroti Simon...",
    items: "91K",
    owners: "4.54K",
    volume: "8.35B",
    floorPrice: "32.39 ETH",
  ),NFTCollection(
    name: "Noxious Audience",
    imagePath: "assets/bid_3.png",
    creator: "Michelangelo Buonarroti",
    description: "Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Mhello ichelangelo di Lodovico Buonarroti Simon...",
    items: "91K",
    owners: "4.54K",
    volume: "8.35B",
    floorPrice: "32.39 ETH",
  ),NFTCollection(
    name: "Noxious Audience",
    imagePath: "assets/bid_3.png",
    creator: "Michelangelo Buonarroti",
    description: "Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Mhello ichelangelo di Lodovico Buonarroti Simon...",
    items: "91K",
    owners: "4.54K",
    volume: "8.35B",
    floorPrice: "32.39 ETH",
  ),NFTCollection(
    name: "Noxious Audience",
    imagePath: "assets/bid_3.png",
    creator: "Michelangelo Buonarroti",
    description: "Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Mhello ichelangelo di Lodovico Buonarroti Simon...",
    items: "91K",
    owners: "4.54K",
    volume: "8.35B",
    floorPrice: "32.39 ETH",
  ),NFTCollection(
    name: "Noxious Audience",
    imagePath: "assets/bid_3.png",
    creator: "Michelangelo Buonarroti",
    description: "Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Mhello ichelangelo di Lodovico Buonarroti Simon...",
    items: "91K",
    owners: "4.54K",
    volume: "8.35B",
    floorPrice: "32.39 ETH",
  ),NFTCollection(
    name: "Noxious Audience",
    imagePath: "assets/bid_3.png",
    creator: "Michelangelo Buonarroti",
    description: "Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Mhello ichelangelo di Lodovico Buonarroti Simon...",
    items: "91K",
    owners: "4.54K",
    volume: "8.35B",
    floorPrice: "32.39 ETH",
  ),NFTCollection(
    name: "Noxious Audience",
    imagePath: "assets/bid_3.png",
    creator: "Michelangelo Buonarroti",
    description: "Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Mhello ichelangelo di Lodovico Buonarroti Simon...",
    items: "91K",
    owners: "4.54K",
    volume: "8.35B",
    floorPrice: "32.39 ETH",
  ),NFTCollection(
    name: "Noxious Audience",
    imagePath: "assets/bid_3.png",
    creator: "Michelangelo Buonarroti",
    description: "Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Mhello ichelangelo di Lodovico Buonarroti Simon...",
    items: "91K",
    owners: "4.54K",
    volume: "8.35B",
    floorPrice: "32.39 ETH",
  ),NFTCollection(
    name: "Noxious Audience",
    imagePath: "assets/bid_3.png",
    creator: "Michelangelo Buonarroti",
    description: "Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Mhello ichelangelo di Lodovico Buonarroti Simon...",
    items: "91K",
    owners: "4.54K",
    volume: "8.35B",
    floorPrice: "32.39 ETH",
  ),NFTCollection(
    name: "Noxious Audience",
    imagePath: "assets/bid_3.png",
    creator: "Michelangelo Buonarroti",
    description: "Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Mhello ichelangelo di Lodovico Buonarroti Simon...",
    items: "91K",
    owners: "4.54K",
    volume: "8.35B",
    floorPrice: "32.39 ETH",
  ),NFTCollection(
    name: "Noxious Audience",
    imagePath: "assets/bid_3.png",
    creator: "Michelangelo Buonarroti",
    description: "Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Mhello ichelangelo di Lodovico Buonarroti Simon...",
    items: "91K",
    owners: "4.54K",
    volume: "8.35B",
    floorPrice: "32.39 ETH",
  ),NFTCollection(
    name: "Noxious Audience",
    imagePath: "assets/bid_3.png",
    creator: "Michelangelo Buonarroti",
    description: "Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Mhello ichelangelo di Lodovico Buonarroti Simon...",
    items: "91K",
    owners: "4.54K",
    volume: "8.35B",
    floorPrice: "32.39 ETH",
  ),NFTCollection(
    name: "Noxious Audience",
    imagePath: "assets/bid_3.png",
    creator: "Michelangelo Buonarroti",
    description: "Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Mhello ichelangelo di Lodovico Buonarroti Simon...",
    items: "91K",
    owners: "4.54K",
    volume: "8.35B",
    floorPrice: "32.39 ETH",
  ),NFTCollection(
    name: "Noxious Audience",
    imagePath: "assets/bid_3.png",
    creator: "Michelangelo Buonarroti",
    description: "Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Mhello ichelangelo di Lodovico Buonarroti Simon...",
    items: "91K",
    owners: "4.54K",
    volume: "8.35B",
    floorPrice: "32.39 ETH",
  ),NFTCollection(
    name: "Noxious Audience",
    imagePath: "assets/bid_3.png",
    creator: "Michelangelo Buonarroti",
    description: "Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Mhello ichelangelo di Lodovico Buonarroti Simon...",
    items: "91K",
    owners: "4.54K",
    volume: "8.35B",
    floorPrice: "32.39 ETH",
  ),NFTCollection(
    name: "Noxious Audience",
    imagePath: "assets/bid_3.png",
    creator: "Michelangelo Buonarroti",
    description: "Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Mhello ichelangelo di Lodovico Buonarroti Simon...",
    items: "91K",
    owners: "4.54K",
    volume: "8.35B",
    floorPrice: "32.39 ETH",
  ),NFTCollection(
    name: "Noxious Audience",
    imagePath: "assets/bid_3.png",
    creator: "Michelangelo Buonarroti",
    description: "Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Michelangelo di Lodovico Buonarroti Simon...Mhello ichelangelo di Lodovico Buonarroti Simon...",
    items: "91K",
    owners: "4.54K",
    volume: "8.35B",
    floorPrice: "32.39 ETH",
  ),
  // Add more collections as needed
];


final List<NFTItem> nftItems = [
  NFTItem(
    id: "NoxiousAudience_01006481",
    price: 0,
    change: 0,
    volume: 0.1,
  ),
  NFTItem(
    id: "NoxiousAudience_803025",
    price: 0,
    change: 0.1,
    volume: 0.1,
  ),
  // Add more items as needed
];

// 3. Main Collection Screen
class CollectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView.builder(
        padding: EdgeInsets.all(16.r),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.h,
          mainAxisSpacing: 16.w,
          childAspectRatio: 0.8.h,
        ),
        itemCount: collections.length,
        itemBuilder: (context, index) {
          final collection = collections[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CollectionDetailScreen(collection: collection),
              ),
            ),
            child: CollectionCard(collection: collection),
          );
        },
      ),
    );
  }
}

// 4. Collection Card Widget
class CollectionCard extends StatelessWidget {
  final NFTCollection collection;

  const CollectionCard({required this.collection});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
            child: Image.asset(
              collection.imagePath,
              height: 120.h,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: Colors.grey[200],
                height: 120.h,
                child: Icon(Icons.image, size: 50.w),
              ),
            ),
          ),

          // Details
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  collection.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  collection.creator,
                  style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStat("Items", collection.items),
                    _buildStat("Owners", collection.owners),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStat("Volume", collection.volume),
                    _buildStat("Floor", collection.floorPrice),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 10.sp, color: Colors.grey)),
        Text(value, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

// 5. Collection Detail Screen
class CollectionDetailScreen extends StatefulWidget {
  final NFTCollection collection;

  const CollectionDetailScreen({required this.collection});

  @override
  State<CollectionDetailScreen> createState() => _CollectionDetailScreenState();
}

class _CollectionDetailScreenState extends State<CollectionDetailScreen> {
  bool _isDescriptionExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset('assets/logo.png', height: 40.h),
             SizedBox(width: 10.w),
             Text(
              "B Coin",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                shadows: [
                  Shadow(
                    blurRadius: 0.5.r,
                    color: Colors.amber,
                    offset: Offset(1, 0),
                  )
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon:  Icon(Icons.notifications_active_outlined, size: 28.w, color: Colors.black87),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            icon:  Icon(Icons.menu, size: 32.w),
            onSelected: (String value) {},
            itemBuilder: (BuildContext context) {
              return [
              _buildPopupMenuItem("Home", Icons.home,(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

              }),
              _buildPopupMenuItem("Market", Icons.attach_money,(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MarketScreen()));

              }),
              _buildPopupMenuItem("Wallet", Icons.lock,(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>WalletScreen()));

              }),
              _buildPopupMenuItem("Rewards", Icons.trending_up,(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>RewardsScreen()));

              }),
              _buildPopupMenuItem("Profile", Icons.person,(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));

              }),];
            },
            elevation: 10,
            color: Colors.white,
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Center(
            child: Column(
              children: [
        // Image with gradient overlay
        Stack(
        children: [
        Container(
        height: 350.h,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.collection.imagePath),
            fit: BoxFit.cover,

          ),
            color: Colors.transparent,
            // borderRadius:BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
        ),
      ),
      // Gradient overlay
      Container(
        height: 350.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.8),
            ],
          ),
        ),
      ),
      IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
      // Content over image
      Positioned(
        bottom: 20.h,
        left: 0.w,
        right: 0.w,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Owner row with blue tick
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.r,
                    backgroundImage: AssetImage('assets/bid_2.png',),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    widget.collection.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Image.asset('assets/blue_tick.png', width: 21.w),
                  SizedBox(width: 4.w),
                  Image.network('https://cdn3d.iconscout.com/3d/premium/thumb/polygon-3d-icon-download-in-png-blend-fbx-gltf-file-formats--bitcoin-logo-sign-office-coin-cryptocurrency-symbol-crypto-coins-pack-science-technology-icons-5650860.png?f=webp',
                      width: 17.w),
                ],
              ),
              SizedBox(height: 16.h),
              // Description with expand/collapse
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Description with expand/collapse
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.collection.description,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                          maxLines: _isDescriptionExpanded ? null : 2,
                          overflow: _isDescriptionExpanded ? null : TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isDescriptionExpanded = !_isDescriptionExpanded;
                          });
                        },
                        child: Icon(
                          _isDescriptionExpanded
                              ? Icons.expand_less
                              : Icons.expand_more,
                          color: Colors.white,
                          size: 21.w,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              // Stats row
              _buildStatsRow(),
            ],
          ),
        ),
      ),
              ],
            ),




          SizedBox(height: 16.h),



          // Rest of the content
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Column(
          //     children: [
          //       // Your other content goes here
          //       // Search and filter section
          //       _buildSearchFilterSection(),
          //       SizedBox(height: 20),
          //       // NFT items list
          //       ...nftItems.map((item) => _buildItemCard(item)).toList(),
          //     ],
          //   ),
          // ),
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 13.0.w),
        child: NFTSearchBar(),
      ),
                SizedBox(height: 10.h,),

//

        ],
      ),
            ),
          Expanded(child: NftListings()),

         ]));
  }

  Widget _buildStatsRow() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('Items', widget.collection.items),
          _buildStatItem('Owner', widget.collection.owners),
          _buildStatItem('Volume', widget.collection.volume),
          _buildStatItem('Floor', widget.collection.floorPrice),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 12.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }

  // Widget _buildSearchFilterSection() {
  //   return Column(
  //     children: [
  //       TextField(
  //         decoration: InputDecoration(
  //           hintText: "Enter name to search",
  //           prefixIcon: Icon(Icons.search),
  //           border: OutlineInputBorder(),
  //           contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
  //         ),
  //       ),
  //       SizedBox(height: 12.h),
  //       Row(
  //         children: [
  //           Expanded(
  //             child: DropdownButtonFormField<String>(
  //               value: "Price",
  //               items: ["Price", "Recently Added", "Most Viewed"]
  //                   .map((e) => DropdownMenuItem(
  //                 value: e,
  //                 child: Text(e),
  //               ))
  //                   .toList(),
  //               decoration: InputDecoration(
  //                 border: OutlineInputBorder(),
  //                 contentPadding: EdgeInsets.symmetric(horizontal: 12),
  //               ),
  //               onChanged: (value) {},
  //               isExpanded: true,
  //             ),
  //           ),
  //           SizedBox(width: 12.w),
  //           Expanded(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Padding(
  //                   padding: EdgeInsets.only(left: 4.w),
  //                   child: Text("Price", style: TextStyle(fontSize: 14)),
  //                 ),
  //                 Slider(
  //                   value: 0.5,
  //                   min: 0,
  //                   max: 1,
  //                   divisions: 10,
  //                   onChanged: (value) {},
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  Widget _buildItemCard(NFTItem item) {
    return Card(
      margin: EdgeInsets.only(bottom: 12.w),
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Row(
          children: [
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: Text("#${item.id.split('_').last}"),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.id,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text("${item.price} ETH"),
                      SizedBox(width: 8.w),
                      Icon(
                        item.change >= 0 ? Icons.arrow_upward : Icons.arrow_downward,
                        color: item.change >= 0 ? Colors.green : Colors.red,
                        size: 16.w,
                      ),
                      Text(
                        "${item.change.abs().toStringAsFixed(1)}%",
                        style: TextStyle(
                          color: item.change >= 0 ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text("Volume", style: TextStyle(fontSize: 12.sp)),
                Text("${item.volume} ETH",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



PopupMenuItem<String> _buildPopupMenuItem(String title, IconData icon, VoidCallback onTap) {
  return PopupMenuItem(
    value: title.toLowerCase(),
    child: Row(
      children: [
        IconButton(
          icon: Icon(icon, color: Colors.black87, size: 22.w),
          onPressed: onTap,
        ),
         SizedBox(width: 10.w),
        Text(title, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
      ],
    ),
  );
}
