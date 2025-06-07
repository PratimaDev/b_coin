// import 'package:b_coin/components/animated_text.dart';
import 'package:b_coin/components/token_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});
  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class ZoneData {
  final int zoneNumber;
  final String imagePath;
  final String priceRange;
  final String rewardRate;
  final String platformFee;
  final bool isOpen;
  ZoneData({
    required this.zoneNumber,
    required this.imagePath,
    required this.priceRange,
    required this.rewardRate,
    required this.platformFee,
    required this.isOpen,
  });
}

// Define an NFT model class
class NFT {
  final String name;
  final String imageUrl;

  final String ownerAvatarUrl;

  NFT({
    required this.name,
    required this.imageUrl,
    required this.ownerAvatarUrl,
  });
}

// Dummy data list
final List<NFT> nfts = [
  NFT(
    name: 'PunkCat',
    imageUrl: 'assets/bid_1.png', // Replace with actual image URLs

    ownerAvatarUrl: 'assets/logo.png',
  ),
  NFT(
    name: 'Noxious Audience',
    imageUrl: 'assets/bid_2.png',
    ownerAvatarUrl: 'assets/no_data.png',
  ),
  NFT(
    name: 'Wild Girl',
    imageUrl: 'assets/bid_3.png',
    ownerAvatarUrl: 'assets/secure.png',
  ),
];

final List<NFT> art_nfts = [
  NFT(
    name: 'Digital Dreams',
    imageUrl: 'assets/bid_1.png', // Replace with actual image URLs

    ownerAvatarUrl: 'assets/bid_2.png',
  ),
  NFT(
    name: 'Noxious Audience',
    imageUrl: 'assets/bid_2.png',
    ownerAvatarUrl: 'assets/no_data.png',
  ),
  NFT(
    name: 'Wild Girl....',
    imageUrl: 'assets/bid_3.png',
    ownerAvatarUrl: 'assets/secure.png',
  ),
  NFT(
    name: 'Digital Dreams',
    imageUrl: 'assets/bid_1.png', // Replace with actual image URLs

    ownerAvatarUrl: 'assets/bid_2.png',
  ),
  NFT(
    name: 'Noxious Audience',
    imageUrl: 'assets/bid_2.png',
    ownerAvatarUrl: 'assets/no_data.png',
  ),
  NFT(
    name: 'Wild Girl....',
    imageUrl: 'assets/bid_3.png',
    ownerAvatarUrl: 'assets/secure.png',
  ),
  NFT(
    name: 'Digital Dreams',
    imageUrl: 'assets/bid_1.png', // Replace with actual image URLs

    ownerAvatarUrl: 'assets/bid_2.png',
  ),
  NFT(
    name: 'Noxious Audience',
    imageUrl: 'assets/bid_2.png',
    ownerAvatarUrl: 'assets/no_data.png',
  ),
  NFT(
    name: 'Wild Girl....',
    imageUrl: 'assets/bid_3.png',
    ownerAvatarUrl: 'assets/secure.png',
  ),
  NFT(
    name: 'Digital Dreams',
    imageUrl: 'assets/bid_1.png', // Replace with actual image URLs

    ownerAvatarUrl: 'assets/bid_2.png',
  ),
  NFT(
    name: 'Noxious Audience',
    imageUrl: 'assets/bid_2.png',
    ownerAvatarUrl: 'assets/no_data.png',
  ),
  NFT(
    name: 'Wild Girl....',
    imageUrl: 'assets/bid_3.png',
    ownerAvatarUrl: 'assets/secure.png',
  ),
  NFT(
    name: 'Digital Dreams',
    imageUrl: 'assets/bid_1.png', // Replace with actual image URLs

    ownerAvatarUrl: 'assets/bid_2.png',
  ),
  NFT(
    name: 'Noxious Audience',
    imageUrl: 'assets/bid_2.png',
    ownerAvatarUrl: 'assets/no_data.png',
  ),
  NFT(
    name: 'Wild Girl....',
    imageUrl: 'assets/bid_3.png',
    ownerAvatarUrl: 'assets/secure.png',
  ),
  NFT(
    name: 'Digital Dreams',
    imageUrl: 'assets/bid_1.png', // Replace with actual image URLs

    ownerAvatarUrl: 'assets/bid_2.png',
  ),
  NFT(
    name: 'Noxious Audience',
    imageUrl: 'assets/bid_2.png',
    ownerAvatarUrl: 'assets/no_data.png',
  ),
  NFT(
    name: 'Wild Girl....',
    imageUrl: 'assets/bid_3.png',
    ownerAvatarUrl: 'assets/secure.png',
  ),
  NFT(
    name: 'Digital Dreams',
    imageUrl: 'assets/bid_1.png', // Replace with actual image URLs

    ownerAvatarUrl: 'assets/bid_2.png',
  ),
  NFT(
    name: 'Noxious Audience',
    imageUrl: 'assets/bid_2.png',
    ownerAvatarUrl: 'assets/no_data.png',
  ),
  NFT(
    name: 'Wild Girl....',
    imageUrl: 'assets/bid_3.png',
    ownerAvatarUrl: 'assets/secure.png',
  ),
];
final List<NFT> treasure_nfts = [
  NFT(
    name: 'Wild Girl....',
    imageUrl: 'assets/bid_3.png',
    ownerAvatarUrl: 'assets/secure.png',
  ),
  NFT(
    name: 'Digital Dreams',
    imageUrl: 'assets/bid_1.png', // Replace with actual image URLs

    ownerAvatarUrl: 'assets/bid_2.png',
  ),
  NFT(
    name: 'Digital Dreams',
    imageUrl: 'assets/bid_1.png', // Replace with actual image URLs
    ownerAvatarUrl: 'assets/bid_2.png',
  ),
  NFT(
    name: 'Noxious Audience',
    imageUrl: 'assets/bid_2.png',
    ownerAvatarUrl: 'assets/no_data.png',
  ),
  NFT(
    name: 'Wild Girl....',
    imageUrl: 'assets/bid_3.png',
    ownerAvatarUrl: 'assets/secure.png',
  ),
  NFT(
    name: 'Digital Dreams',
    imageUrl: 'assets/bid_1.png', // Replace with actual image URLs

    ownerAvatarUrl: 'assets/bid_2.png',
  ),
  NFT(
    name: 'Noxious Audience',
    imageUrl: 'assets/bid_2.png',
    ownerAvatarUrl: 'assets/no_data.png',
  ),
  NFT(
    name: 'Noxious Audience',
    imageUrl: 'assets/bid_2.png',
    ownerAvatarUrl: 'assets/no_data.png',
  ),
  NFT(
    name: 'Digital Dreams',
    imageUrl: 'assets/bid_1.png', // Replace with actual image URLs

    ownerAvatarUrl: 'assets/bid_2.png',
  ),
  NFT(
    name: 'Noxious Audience',
    imageUrl: 'assets/bid_2.png',
    ownerAvatarUrl: 'assets/no_data.png',
  ),
  NFT(
    name: 'Wild Girl....',
    imageUrl: 'assets/bid_3.png',
    ownerAvatarUrl: 'assets/secure.png',
  ),
  NFT(
    name: 'Digital Dreams',
    imageUrl: 'assets/bid_1.png', // Replace with actual image URLs

    ownerAvatarUrl: 'assets/bid_2.png',
  ),
  NFT(
    name: 'Noxious Audience',
    imageUrl: 'assets/bid_2.png',
    ownerAvatarUrl: 'assets/no_data.png',
  ),
  NFT(
    name: 'Wild Girl....',
    imageUrl: 'assets/bid_3.png',
    ownerAvatarUrl: 'assets/secure.png',
  ),
  NFT(
    name: 'Digital Dreams',
    imageUrl: 'assets/bid_1.png', // Replace with actual image URLs

    ownerAvatarUrl: 'assets/bid_2.png',
  ),
  NFT(
    name: 'Noxious Audience',
    imageUrl: 'assets/bid_2.png',
    ownerAvatarUrl: 'assets/no_data.png',
  ),
  NFT(
    name: 'Wild Girl....',
    imageUrl: 'assets/bid_3.png',
    ownerAvatarUrl: 'assets/secure.png',
  ),
  NFT(
    name: 'Digital Dreams',
    imageUrl: 'assets/bid_1.png', // Replace with actual image URLs

    ownerAvatarUrl: 'assets/bid_2.png',
  ),
  NFT(
    name: 'Noxious Audience',
    imageUrl: 'assets/bid_2.png',
    ownerAvatarUrl: 'assets/no_data.png',
  ),
  NFT(
    name: 'Wild Girl....',
    imageUrl: 'assets/bid_3.png',
    ownerAvatarUrl: 'assets/secure.png',
  ),
  NFT(
    name: 'Digital Dreams',
    imageUrl: 'assets/bid_1.png', // Replace with actual image URLs

    ownerAvatarUrl: 'assets/bid_2.png',
  ),
  NFT(
    name: 'Noxious Audience',
    imageUrl: 'assets/bid_2.png',
    ownerAvatarUrl: 'assets/no_data.png',
  ),
  NFT(
    name: 'Wild Girl....',
    imageUrl: 'assets/bid_3.png',
    ownerAvatarUrl: 'assets/secure.png',
  ),
];

class _MarketScreenState extends State<MarketScreen> {
  int selectedTab = 0;
  int selectedSubTab = 0;
  int selectedZone = 0;
  bool _onclicked = false;
  int selectedZoneIndex = 0;



  final List<String> mainTabs = [
    'Equity',
    'BCoin Token',
    'Gallery',
    'Treasure'
  ];
  final List<String> subTabs = ['Equity', 'Collection', 'My Vault'];
  final List<String> zones = ['Elite Zone', 'Free Zone'];
  final List<ZoneData> eliteZones = [
    ZoneData(
        zoneNumber: 1,
        imagePath: 'assets/elite_1.png',
        priceRange: '\$199-\$1000',
        rewardRate: '2.5%',
        platformFee: '1.0%',
        isOpen: true),
    ZoneData(
        zoneNumber: 2,
        imagePath: 'assets/elite_2.png',
        priceRange: '\$499-\$2000',
        rewardRate: '3.0%',
        platformFee: '1.2%',
        isOpen: false),
    ZoneData(
        zoneNumber: 3,
        imagePath: 'assets/elite_3.png',
        priceRange: '\$799-\$3000',
        rewardRate: '3.5%',
        platformFee: '1.4%',
        isOpen: true),
    ZoneData(
        zoneNumber: 4,
        imagePath: 'assets/elite_4.png',
        priceRange: '\$999-\$4000',
        rewardRate: '4.0%',
        platformFee: '1.6%',
        isOpen: false),
    ZoneData(
        zoneNumber: 5,
        imagePath: 'assets/elite_5.png',
        priceRange: '\$1499-\$5000',
        rewardRate: '4.5%',
        platformFee: '1.8%',
        isOpen: true),
    ZoneData(
        zoneNumber: 6,
        imagePath: 'assets/elite_6.png',
        priceRange: '\$1999-\$6000',
        rewardRate: '5.0%',
        platformFee: '  2%',
        isOpen: false),
  ];
  final List<ZoneData> freeZones = [
    ZoneData(
        zoneNumber: 1,
        imagePath: 'assets/free_1.png',
        priceRange: '\$200-\$499',
        rewardRate: '1.2%',
        platformFee: '3 ~ 30',
        isOpen: true),
    ZoneData(
        zoneNumber: 2,
        imagePath: 'assets/free_2.png',
        priceRange: '\$500-\$799',
        rewardRate: '3.0%',
        platformFee: '3 ~ 30',
        isOpen: false),
    ZoneData(
        zoneNumber: 3,
        imagePath: 'assets/free_3.png',
        priceRange: '\$800-\$1200',
        rewardRate: '3.5%',
        platformFee: '3 ~ 30',
        isOpen: true),
  ];

  Widget buildEliteZoneCard(ZoneData zone, int index, BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 8.h),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
            side: BorderSide(color: Colors.grey)),
        color: Colors.amber[50],
        margin:  EdgeInsets.all(8.r),
        child: Padding(
          padding:  EdgeInsets.all(12.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Elite Zone ${zone.zoneNumber}',
                  style:  TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold)),
               SizedBox(height: 5.h),
              Text('LV2 - LV6',
                  style:  TextStyle(
                      color: Colors.green,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700)),
               SizedBox(height: 8.h),
              Container(
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: DecorationImage(
                    image: AssetImage(zone.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
               SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text('Staking Status:',
                      style: TextStyle(color: Colors.black)),
                  Container(
                    padding:  EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      color: zone.isOpen ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Text(zone.isOpen ? 'Open' : 'Closed',
                        style:  TextStyle(color: Colors.white)),
                  ),
                ],
              ),
               SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const SizedBox(height: 19),
                  Text('Price Range:',
                      style: TextStyle(color: Colors.black)),
                   SizedBox(width: 125.w),
                  Container(
                      child: Text(zone.priceRange,
                          style:  TextStyle(color: Colors.black))),
                ],
              ),
               SizedBox(height: 8.h),
              Row(
                children: [
                   SizedBox(height: 15.h),
                  Text('Reward Rate:',
                      style: const TextStyle(color: Colors.black)),
                   SizedBox(width: 180.h),
                  Text(zone.rewardRate,
                      style:  TextStyle(color: Colors.black)),
                ],
              ),
               SizedBox(height: 8.h),
              Row(
                children: [
                   SizedBox(height: 15.h),
                  Text('Platform Fee:',
                      style: const TextStyle(color: Colors.black)),
                   SizedBox(width: 180.h),
                  Text(zone.platformFee,
                      style:  TextStyle(color: Colors.black)),
                ],
              ),
               SizedBox(height: 10.h),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFB8860B),
                        Color(0xFFFFF5B6),
                        Color(0xFFDAA520)
                      ], // Gold Gradient Button
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 60.w, vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                    onPressed: () {
                      switch (index) {
                        case 0:
                        case 1:
                        case 2:
                        case 3: // ... jitne bhi zones hain
                        case 4:
                          setState(() {
                            selectedZoneIndex = index;
                            _onclicked = true;
                          });
                          break;
                        default:
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Coming Soon!")),
                          );
                      }
                    },
                    child: Text(
                      "Go to zone",
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFreeZoneCard(ZoneData zone, int index, BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 8.0.h),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
            side: BorderSide(color: Colors.grey)),
        color: Colors.amber[50],
        margin:  EdgeInsets.all(8.r),
        child: Padding(
          padding:  EdgeInsets.all(12.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Free Zone ${zone.zoneNumber}',
                  style:  TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold)),
               SizedBox(height: 5.h),
              Text('LV1 - LV6',
                  style:  TextStyle(
                      color: Colors.green,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700)),
 SizedBox(height: 8.h),
              Container(
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: DecorationImage(
                    image: AssetImage(zone.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
               SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text('Staking Status:',
                      style: TextStyle(color: Colors.black)),
                  Container(
                    padding:  EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      color: zone.isOpen ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Text(zone.isOpen ? 'Open' : 'Closed',
                        style:  TextStyle(color: Colors.white)),
                  ),
                ],
              ),
               SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   SizedBox(height: 15.h),
                  Text('Price Range:',
                      style:  TextStyle(color: Colors.black)),
                   SizedBox(width: 134.w),
                  Container(
                      child: Text(zone.priceRange,
                          style:  TextStyle(color: Colors.black))),
                ],
              ),
               SizedBox(height: 8.h),
              Row(
                children: [
                   SizedBox(height: 15.h),
                  Text('Reward Rate:',
                      style:  TextStyle(color: Colors.black)),
                   SizedBox(width: 180.w),
                  Text(zone.rewardRate,
                      style:  TextStyle(color: Colors.black)),
                ],
              ),
               SizedBox(height: 8.h),
              Row(
                children: [
                   SizedBox(height: 15.h),
                  Text('Staking Days:',
                      style: const TextStyle(color: Colors.black)),
                   SizedBox(width: 167.w),
                  Text(zone.platformFee,
                      style: const TextStyle(color: Colors.black)),
                ],
              ),
               SizedBox(height: 10.h),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFB8860B),
                        Color(0xFFFFF5B6),
                        Color(0xFFDAA520)
                      ], // Gold Gradient Button
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      switch (index) {
                        case 0:
                        case 1:
                        case 2:
                        case 3: // ... jitne bhi zones hain
                        case 4:
                          setState(() {
                            selectedZoneIndex = index;
                            _onclicked = true;
                          });
                          break;
                        default:
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Coming Soon!")),
                          );
                      }
                    },
                    child: Text(
                      "Go to zone",
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildEliteZoneContent() {
  //   return Expanded(
  //     child: GridView.builder(
  //       padding: const EdgeInsets.all(8),
  //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 2,
  //         childAspectRatio: 1,
  //         crossAxisSpacing: 8,
  //         mainAxisSpacing: 8,
  //       ),
  //       itemCount: eliteZones.length,
  //       itemBuilder: (context, index) {
  //         return buildEliteZoneCard(eliteZones[index]);
  //       },
  //     ),
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTabBar(mainTabs, selectedTab,
            (index) => setState(() => selectedTab = index)),
        if (selectedTab == 0)
          buildGoldenTabBar(subTabs, selectedSubTab,
              (index) => setState(() => selectedSubTab = index)),
        if (selectedTab == 0 && selectedSubTab == 0)
          buildTabBar(zones, selectedZone,
              (index) => setState(() => selectedZone = index)),
        Expanded(child: buildContent()),
      ],
    );
  }

  Widget buildGoldenTabBar(
      List<String> items, int selectedIndex, Function(int) onTap) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding:  EdgeInsets.only(right: 100.w),
        child: Container(
          margin: const EdgeInsets.only(top: 25, left: 8, right: 8, bottom: 8),
          width: 343,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.amber,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(items.length, (index) {
                bool isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () => onTap(index),
                  child: Container(
                    padding:  EdgeInsets.symmetric(
                        vertical: 12.h, horizontal: 27.w),
                    decoration: BoxDecoration(
                      gradient: isSelected
                          ? const LinearGradient(
                              colors: [
                                Color(0xFFB8860B),
                                Color(0xFFFFF5B6),
                                Color(0xFFDAA520)
                              ],
                            )
                          : null,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      items[index],
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTabBar(
      List<String> items, int selectedIndex, Function(int) onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(items.length, (index) {
        return GestureDetector(
          onTap: () => onTap(index),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                items[index],
                style: TextStyle(
                  fontSize: selectedIndex == index ? 17.sp : 15.sp,
                  fontWeight: selectedIndex == index
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: selectedIndex == index ? Colors.black : Colors.grey,
                ),
              ),
              if (selectedIndex == index)
                Container(
                  margin:  EdgeInsets.only(top: 4.h),
                  height: 4.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    gradient:  LinearGradient(
                      colors: [
                        Color(0xFFB8860B),
                        Color(0xFFFFF5B6),
                        Color(0xFFDAA520)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }

  Widget buildContent() {
    Widget content;

    if (selectedTab == 0) {
      switch (selectedSubTab) {
        case 0:
          if (selectedZone == 0) {
            content = _onclicked
                ? ZoneScreen(
                    zoneId: selectedZoneIndex,
                    onBack: () {
                      setState(() {
                        _onclicked = false; // 👈 elite card wapas aa jayega
                      });
                    },
                  )
                : ListView.builder(
                    itemCount:
                        eliteZones.length, // Replace with real-time data length
                    itemBuilder: (context, index) =>
                        buildEliteZoneCard(eliteZones[index], index, context),
                  );
          } else {
            content = _onclicked
                ? FreeZoneScreen(
              zoneId: selectedZoneIndex,
              onBack: () {
                setState(() {
                  _onclicked = false; // 👈 elite card wapas aa jayega
                });
              },
            )
                :ListView.builder(
              itemCount: 3, // Replace with real-time data length
              itemBuilder: (context, index) =>
                  buildFreeZoneCard(freeZones[index],index,context),
            );
          }
          break;
        case 1:
          content = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/no_data.png',
                height: 130.h,
                width: 130.w,
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(child: Text('No Data Available')),
              SizedBox(
                height: 10.h,
              ),
              Center(child: buildGmtDateTime()),
              SizedBox(
                height: 60.h,
              ),
            ],
          );
          break;
        case 2:
          content = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/no_data.png',
                height: 130.h,
                width: 130.w,
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(child: Text('No Data Available')),
              SizedBox(
                height: 10.h,
              ),
              Center(child: buildGmtDateTime()),
              SizedBox(
                height: 60.h,
              ),
            ],
          );
          break;
        default:
          content =
              Text('Invalid Sub Tab', style: TextStyle(color: Colors.red));
      }
    } else if (selectedTab == 1) {
      content = TokenSelectionScreen();
    } else if (selectedTab == 2) {
      content = ArtTokenSelectionScreen();
    } else if (selectedTab == 3) {
      content = TreasureTokenSelectionScreen();
    } else {
      content = Center(
          child: Text('Select a tab', style: TextStyle(color: Colors.black)));
    }

    return Padding(
      padding:  EdgeInsets.all(8.0.r),
      child: content,
    );
  }
}

Widget buildGmtDateTime() {
  DateTime now = DateTime.now().toUtc(); // Convert to UTC
  String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

  return Text(
    'GMT Time: $formattedDate',
    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
  );
}

// Screen 1: BCoin Token Selection Screen
class TokenSelectionScreen extends StatelessWidget {
  final List<String> tokens = [
    'Noxious Audience',
    'PixerEternity',
    'The Crypto Dolls'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: 8.0.h),
        child: GridView.builder(
          padding: EdgeInsets.all(8.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.h,
            mainAxisSpacing: 9.w,
            childAspectRatio: 1.01.h, // Adjust this for better image proportions
          ),
          itemCount: nfts.length, // Changed from tokens to nfts
          itemBuilder: (context, index) {
            final nft = nfts[index]; // Assuming nfts is a list of NFT objects
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CollectionDetailScreen(
                    collection: NFTCollection(
                      name: "Noxious Audience",
                      imagePath: "assets/bid_1.png",
                      creator: "Michelangelo Buonarroti",
                      description:
                          "Michelangelo di Lodovico Buonarroti Simon...",
                      items: "93K",
                      owners: "4.54K",
                      volume: "8.35B",
                      floorPrice: "32.39 ETH",
                    ),
                  ),
                ),
              ),
              child: Card(
                color: Colors.amber.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NFT Image
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12.r)),
                      child: Image.asset(
                        nft.imageUrl, // Replace with your image URL/path
                        height: 100.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: 120.h,
                          color: Colors.amber.shade100,
                          child: Icon(Icons.broken_image),
                        ),
                      ),
                    ),

                    // NFT Details Section
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 6.h),
                          // Owner Row
                          Row(
                            children: [
                              // Owner Avatar

                              CircleAvatar(
                                radius: 13.r,
                                backgroundImage: AssetImage(nft
                                    .ownerAvatarUrl), // Replace with your avatar URL/path

                                backgroundColor: Colors.transparent,
                              ),
                              SizedBox(width: 8.w),

                              // Owner Name
                              // NFT Name
                              Flexible(
                                child: Text(
                                  nft.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Image.asset(
                                'assets/blue_tick.png',
                                height: 20.h,
                                width: 20.h,
                              )
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
        ),
      ),
    );
  }
}

// Screen 2: BCoin Token Selection Screen
class ArtTokenSelectionScreen extends StatelessWidget {
  final List<String> tokens = [
    'Noxious Audience',
    'PixerEternity',
    'The Crypto Dolls'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: 15.0.h),
        child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 6.h,
            mainAxisSpacing: 7.w,
            childAspectRatio: 1.01.h,
          ),
          itemCount: art_nfts.length, // Changed from tokens to nfts
          itemBuilder: (context, index) {
            final nft = art_nfts[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CollectionDetailScreen(
                    collection: NFTCollection(
                      name: "Noxious Audience",
                      imagePath: "assets/bid_1.png",
                      creator: "Michelangelo Buonarroti",
                      description:
                          "Michelangelo di Lodovico Buonarroti Simon...",
                      items: "93K",
                      owners: "4.54K",
                      volume: "8.35B",
                      floorPrice: "32.39 ETH",
                    ),
                  ),
                ),
              ),
              child: Card(
                color: Colors.amber.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NFT Image
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12.r),
                          bottom: Radius.circular(12.r)),
                      child: Image.asset(
                        nft.imageUrl, // Replace with your image URL/path
                        height: 100.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: 120.h,
                          color: Colors.amber.shade100,
                          child: Icon(Icons.broken_image),
                        ),
                      ),
                    ),

                    // NFT Details Section
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 6.h),
                          // Owner Row
                          Row(
                            children: [
                              // Owner Avatar

                              CircleAvatar(
                                radius: 13.r,
                                backgroundImage: AssetImage(nft
                                    .ownerAvatarUrl), // Replace with your avatar URL/path

                                backgroundColor: Colors.transparent,
                              ),
                              SizedBox(width: 8.w),

                              // Owner Name
                              // NFT Name
                              Flexible(
                                child: Text(
                                  nft.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Image.asset(
                                'assets/blue_tick.png',
                                height: 20.h,
                                width: 20.w,
                              )
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
        ),
      ),
    );
  }
}

// Screen 3: BCoin Token Selection Screen
class TreasureTokenSelectionScreen extends StatelessWidget {
  final List<String> tokens = [
    'Noxious Audience',
    'PixerEternity',
    'The Crypto Dolls'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: 15.0.h),
        child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 6.h,
            mainAxisSpacing: 7.w,
            childAspectRatio: 1.01.h,
          ),
          itemCount: treasure_nfts.length, // Changed from tokens to nfts
          itemBuilder: (context, index) {
            final nft = treasure_nfts[index];
            final collection = collections[index]; // Get single collection
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CollectionDetailScreen(collection: collection),
                ),
              ),
              child: Card(
                color: Colors.amber.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NFT Image
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12.r),
                          bottom: Radius.circular(12.r)),
                      child: Image.asset(
                        nft.imageUrl, // Replace with your image URL/path
                        height: 100.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: 120.h,
                          color: Colors.amber.shade100,
                          child: Icon(Icons.broken_image),
                        ),
                      ),
                    ),
                    // NFT Details Section
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 6.h),
                          // Owner Row
                          Row(
                            children: [
                              // Owner Avatar

                              CircleAvatar(
                                radius: 13.r,
                                backgroundImage: AssetImage(nft
                                    .ownerAvatarUrl), // Replace with your avatar URL/path

                                backgroundColor: Colors.transparent,
                              ),
                              SizedBox(width: 8.w),

                              // Owner Name
                              // NFT Name
                              Flexible(
                                child: Text(
                                  nft.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Image.asset(
                                'assets/blue_tick.png',
                                height: 20.h,
                                width: 20.w,
                              )
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
        ),
      ),
    );
  }
}

class ZoneScreen extends StatelessWidget {
  final int zoneId;
  final VoidCallback onBack;
  ZoneScreen({required this.zoneId, required this.onBack});

  final List<Map<String, dynamic>> allNFTs = [
    {"name": "Cool_Ape", "price": 150, "image": "assets/bid_1.png"},
    {"name": "Moon_Cat", "price": 220, "image": "assets/bid_2.png"},
    {"name": "Zombie_Punk", "price": 300, "image": "assets/bid_3.png"},
    {"name": "Cyber_Ninja", "price": 350, "image": "assets/bid_2.png"},
    {"name": "Pixel_Wizard", "price": 400, "image": "assets/bid_1.png"},
    {"name": "Dragon_King", "price": 450, "image": "assets/bid_2.png"},
    {"name": "Crypto_Queen", "price": 500, "image": "assets/bid_1.png"},
    {"name": "Alien_Bot", "price": 580, "image": "assets/bid_2.png"},
    {"name": "Shark_DAO", "price": 620, "image": "assets/bid_3.png"},
    {"name": "Phantom_Monk", "price": 700, "image": "assets/bid_1.png"},
  ];

  final Map<int, RangeValues> zonePriceRanges = {
    0: RangeValues(100, 300),
    1: RangeValues(200, 400),
    2: RangeValues(300, 600),
    3: RangeValues(500, 800),
    4: RangeValues(600, 900)
  };

  List<Map<String, dynamic>> getNFTsForZone(int zoneId) {
    final range = zonePriceRanges[zoneId];
    if (range == null) return [];

    return allNFTs.where((nft) {
      final price = nft["price"] as int;
      return price >= range.start && price <= range.end;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredNFTs = getNFTsForZone(zoneId);
    print("Zone ID: $zoneId, NFTs Count: ${filteredNFTs.length}");

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(height: 10.h),

            // 🔥 One line Row for Back + TextField
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.grey.shade600,
                    size: 30.w,
                    weight: 12,
                  ),
                  onPressed: onBack,
                ),
                // const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 40.h,
                    child: TextField(
                      decoration: InputDecoration(
                          hoverColor: Colors.black,
                          hintText: "Enter name to search",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15.sp),
                          contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                          fillColor: Colors.transparent,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          prefixIcon: Icon(Icons.search_rounded),
                          prefixIconColor: Colors.grey,
                          focusColor: Colors.black,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.5),
                          )),
                    ),
                  ),
                ),
              ],
            ),
             SizedBox(height: 5.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40.h,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Lowest Price",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 15.sp),
                          fillColor: Colors.transparent,
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusColor: Colors.black,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.5),
                          )),
                    ),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Text('-',
                      style: TextStyle(fontSize: 16.sp, color: Colors.black54)),
                ),
                Expanded(
                  child: Container(
                    height: 40.h,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Highest Price",
                          fillColor: Colors.transparent,
                          hintStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 15.sp),
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusColor: Colors.black,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.5),
                          )),
                    ),
                  ),
                ),
                 SizedBox(width: 8.h),
                _GradientIconButton(icon: Icons.search),
                 SizedBox(width: 6.h),
                _GradientIconButton(icon: Icons.tune),
              ],
            ),
             SizedBox(height: 20.h),
            Expanded(
              child: GridView.builder(
                itemCount: filteredNFTs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8.h,
                  mainAxisSpacing: 10.w,
                  crossAxisSpacing: 10.h,
                ),
                itemBuilder: (context, index) {
                  final nft = filteredNFTs[index];
                  return _NFTCard(
                      name: nft['name'],
                      price: "${nft['price']}",
                      image: nft['image']);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FreeZoneScreen extends StatelessWidget {
  final int zoneId;
  final VoidCallback onBack;
  FreeZoneScreen({required this.zoneId, required this.onBack});

  final List<Map<String, dynamic>> allNFTs = [
    {"name": "Cool_Ape", "price": 150, "image": "assets/bid_1.png"},
    {"name": "Moon_Cat", "price": 220, "image": "assets/bid_2.png"},
    {"name": "Zombie_Punk", "price": 300, "image": "assets/bid_3.png"},
    {"name": "Cyber_Ninja", "price": 122, "image": "assets/bid_2.png"},
    {"name": "Pixel_Wizard", "price": 118, "image": "assets/bid_1.png"},
    {"name": "Dragon_King", "price": 101, "image": "assets/bid_2.png"},
    {"name": "Crypto_Queen", "price": 133, "image": "assets/bid_1.png"},
    {"name": "Alien_Bot", "price": 155, "image": "assets/bid_2.png"},
    {"name": "Shark_DAO", "price": 111, "image": "assets/bid_3.png"},
    {"name": "Phantom_Monk", "price": 102, "image": "assets/bid_1.png"},
  ];

  final Map<int, RangeValues> zonePriceRanges = {
    0: RangeValues(100, 300),
    1: RangeValues(200, 400),
    2: RangeValues(300, 600),
    3: RangeValues(500, 800),
    4: RangeValues(600, 900)
  };

  List<Map<String, dynamic>> getNFTsForZone(int zoneId) {
    final range = zonePriceRanges[zoneId];
    if (range == null) return [];

    return allNFTs.where((nft) {
      final price = nft["price"] as int;
      return price >= range.start && price <= range.end;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredNFTs = getNFTsForZone(zoneId);
    print("Zone ID: $zoneId, NFTs Count: ${filteredNFTs.length}");

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(height: 10.h),

            // 🔥 One line Row for Back + TextField
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.grey.shade600,
                    size: 30.w,
                    weight: 12,
                  ),
                  onPressed: onBack,
                ),
                // const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 40.h,
                    child: TextField(
                      decoration: InputDecoration(
                          hoverColor: Colors.black,
                          hintText: "Enter name to search",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15.sp),
                          contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                          fillColor: Colors.transparent,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          prefixIcon: Icon(Icons.search_rounded),
                          prefixIconColor: Colors.grey,
                          focusColor: Colors.black,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.5),
                          )),
                    ),
                  ),
                ),
              ],
            ),
             SizedBox(height: 5.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40.h,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Lowest Price",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 15.sp),
                          fillColor: Colors.transparent,
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusColor: Colors.black,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.5),
                          )),
                    ),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Text('-',
                      style: TextStyle(fontSize: 16.sp, color: Colors.black54)),
                ),
                Expanded(
                  child: Container(
                    height: 40.h,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Highest Price",
                          fillColor: Colors.transparent,
                          hintStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 15.sp),
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusColor: Colors.black,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.5),
                          )),
                    ),
                  ),
                ),
                 SizedBox(width: 8.w),
                _GradientIconButton(icon: Icons.search),
                 SizedBox(width: 6.w),
                _GradientIconButton(icon: Icons.tune),
              ],
            ),
             SizedBox(height: 20.h),
            Expanded(
              child: GridView.builder(
                itemCount: filteredNFTs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8.h,
                  mainAxisSpacing: 10.w,
                  crossAxisSpacing: 10.h,
                ),
                itemBuilder: (context, index) {
                  final nft = filteredNFTs[index];
                  return _NFTCard(
                      name: nft['name'],
                      price: "${nft['price']}",
                      image: nft['image']);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GradientIconButton extends StatelessWidget {
  final IconData icon;
  const _GradientIconButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFB8860B), Color(0xFFFFF3B6), Color(0xFFDAA520)],
        ),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black),
        onPressed: () {},
      ),
    );
  }
}

class _NFTCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  const _NFTCard(
      {required this.name, required this.price, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 60.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        // boxShadow: [
        //   BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 6, offset: Offset(2, 3)),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12.r), bottom: Radius.circular(12.r)),
              child: Image.asset(image,
                  height: 60.h, width: double.infinity, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                 SizedBox(height: 1.h),
                Row(
                  children: [
                    Icon(Icons.monetization_on, color: Colors.green, size: 18.w),
                     SizedBox(width: 2.w),
                    Text(
                      price,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
                // SizedBox(height: 10,),

                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 7.0.h),
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      height: 35.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFB8860B),
                            Color(0xFFFFF5B6),
                            Color(0xFFDAA520)
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding:
                              EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(20.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: Colors.white,
                                  ),
                                  width: 300.w,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      // ✅ Success icon
                                      FaIcon(FontAwesomeIcons.circleCheck,
                                          size: 60.w, color: Colors.green),

                                      SizedBox(height: 15.h),

                                      // ✅ Text message
                                      Text(
                                        "BuySuccess!",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                      ),

                                      SizedBox(height: 20.h),

                                      // ✅ Buttons row
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          // Stake button
                                          Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xFFB8860B),
                                                  Color(0xFFFFF5B6),
                                                  Color(0xFFDAA520),
                                                ],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30.r),
                                            ),
                                            padding: EdgeInsets.all(
                                                2), // Border thickness
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors
                                                    .white, // Inside color
                                                borderRadius:
                                                    BorderRadius.circular(30.r),
                                              ),
                                              child: OutlinedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                style: OutlinedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  side: BorderSide.none,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.r),
                                                  ),
                                                ),
                                                child: Text(
                                                  "Stake",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(
                                                        0xFFB8860B), // Golden shade text
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          // Check Orders button with gradient
                                          Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xFFB8860B),
                                                  Color(0xFFFFF5B6),
                                                  Color(0xFFDAA520)
                                                ],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25.r),
                                            ),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                // TODO: Handle Check Orders logic
                                                Navigator.pop(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                shadowColor: Colors.transparent,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16.w),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(16.r),
                                                ),
                                              ),
                                              child: Text(
                                                "Check Orders",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Text("Buy",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
