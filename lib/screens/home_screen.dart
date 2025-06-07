import 'package:b_coin/components/b_coin_top_collections.dart';
import 'package:b_coin/components/bcoin_nft_display.dart';
import 'package:b_coin/components/nft_bid_display.dart';
import 'package:b_coin/components/nft_carousel.dart';
import 'package:b_coin/screens/login_screen.dart';
import 'package:b_coin/screens/notification_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:b_coin/screens/market_screen.dart';
import 'package:b_coin/screens/profile_screen.dart';
import 'package:b_coin/screens/rewards_screen.dart';
import 'package:b_coin/screens/wallet_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreenContent(),
    MarketScreen(),
    WalletScreen(),
    RewardsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
                    blurRadius: 0.5,
                    color: Colors.amber,
                    offset: Offset(1.w, 0),
                  )
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_active_outlined, size: 28.sp, color: Colors.black87),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BcoinNotificationScreen()));
            },
          ),
          PopupMenuButton<String>(
            icon: Icon(Icons.menu, size: 32.sp),
            onSelected: (String value) {
              switch (value) {
                case 'Home':
                  setState(() => _selectedIndex = 0);
                  break;
                case 'Market':
                  setState(() => _selectedIndex = 1);
                  break;
                case 'Wallet':
                  setState(() => _selectedIndex = 2);
                  break;
                case 'Reward':
                  setState(() => _selectedIndex = 3);
                  break;
                case 'Profile':
                  setState(() => _selectedIndex = 4);
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'Home',
                  child: Row(
                    children: [
                      SizedBox(width: 5.w),
                      Icon(Icons.home, color: Colors.black, size: 25.sp),
                      SizedBox(width: 15.w),
                      Text('Home', style: TextStyle(color: Colors.black, fontSize: 15.sp)),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'Market',
                  child: Row(
                    children: [
                      SizedBox(width: 5.w),
                      Icon(Icons.show_chart, color: Colors.black, size: 25.sp),
                      SizedBox(width: 15.w),
                      Text('Market', style: TextStyle(color: Colors.black, fontSize: 15.sp)),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'Wallet',
                  child: Row(
                    children: [
                      SizedBox(width: 5.w),
                      Icon(Icons.account_balance_wallet_rounded, color: Colors.black, size: 25.sp),
                      SizedBox(width: 15.w),
                      Text('Wallet', style: TextStyle(color: Colors.black, fontSize: 15.sp)),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'Reward',
                  child: Row(
                    children: [
                      SizedBox(width: 5.w),
                      Icon(Icons.card_giftcard, color: Colors.black, size: 25.sp),
                      SizedBox(width: 15.w),
                      Text('Rewards', style: TextStyle(color: Colors.black, fontSize: 15.sp)),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'Profile',
                  child: Row(
                    children: [
                      SizedBox(width: 5.w),
                      Icon(Icons.person, color: Colors.black, size: 25.sp),
                      SizedBox(width: 15.w),
                      Text('Profile', style: TextStyle(color: Colors.black, fontSize: 15.sp)),
                    ],
                  ),
                ),
              ];
            },
            elevation: 10,
            color: Colors.white,
          ),
          SizedBox(width: 10.w),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.amber.shade50,
        selectedItemColor: Color(0xFFB8860B),
        unselectedItemColor: Colors.grey.shade800,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 24.sp), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart, size: 24.sp), label: 'Market'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet, size: 24.sp), label: 'Wallet'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard, size: 24.sp), label: 'Rewards'),
          BottomNavigationBarItem(icon: Icon(Icons.person, size: 24.sp), label: 'Profile'),
        ],
      ),
      body: _pages[_selectedIndex],
    );
  }
}

// 🟢 Home screen ka actual content alag function mein daal diya
class HomeScreenContent extends StatelessWidget {

  final List<Map<String, dynamic>> dummyData = [
    {
      'rank': 1,
      'name': 'Cool APE',
      'volume': '9.38B',
      'percentageChange': '+1.65',
      'imageUrl': 'https://cdn.pixabay.com/photo/2023/01/04/01/37/nft-7695648_1280.jpg',
    },
    {
      'rank': 2,
      'name': 'Penguin Pals',
      'volume': '8.1B',
      'percentageChange': '+0.87',
      'imageUrl': 'https://cdn.pixabay.com/photo/2022/03/23/02/50/skeleton-7086311_1280.png',
    },
    {

      'rank': 3,
      'name': 'Noxious Audience',
      'volume': '8.04B',
      'percentageChange': '-0.86',
      'image': 'assets/bid_2.png',
    },
    {
      'rank': 4,
      'name': 'PEPE Frog Nobility',
      'volume': '8.01B',
      'percentageChange': '+0.86',
      'imageUrl': 'https://cdn.pixabay.com/photo/2022/12/15/00/53/real-metaverse-7656584_1280.jpg',
    },
    {
      'rank': 5,
      'name': 'Giffgaff Ape Club',
      'volume': '7.85B',
      'percentageChange': '-0.87',
      'image': 'assets/carousel_2.png',
    },
  ];



  final List<String> imageList = [
    "assets/carousel_1.png", // Replace with your images
    "assets/carousel_2.png",
    "assets/carousel_3.jpg",

  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0.w), // Responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Image Slider Below AppBar
            CarouselSlider(
              options: CarouselOptions(
                height: 150.h, // Responsive height
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                enlargeCenterPage: true,
                viewportFraction: 0.8,
              ),
              items: imageList.map((imagePath) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15.r), // Responsive radius
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 20.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      fontSize: 30.sp, // Responsive font size
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(text: "EARN UP TO "),
                      TextSpan(
                        text: "10%",
                        style: TextStyle(
                          foreground: Paint()
                            ..shader = LinearGradient(
                              colors: [
                                // Color(0xFFFFF5B6),
                                Color(0xFFB8860B),
                                Color(0xFFDAA520)
                              ],
                            ).createShader(Rect.fromLTWH(1.1, 1.0, 10.0, 40.0)),
                        ),
                      ),
                      TextSpan(
                        text: "\nMONTHLY",
                        style: TextStyle(color: Colors.black54, fontSize: 28.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFB8860B),
                        Color(0xFFFFF5B6),
                        Color(0xFFDAA520)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 12.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),

                      );
                    },
                    child: Text(
                      "Get Started",
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),

      Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
      gradient: LinearGradient(
      colors: [Color(0xFFFFE4A1),Color(0xFFFFF7E5), Color(0xFFFFE4A1)], // Light golden gradient
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(12.r),
      ),
      child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(

      "Explore, Discover & Earn with B Coin",
      style: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black87,

      ),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 30.h),
      Row(
      children: [
      Icon(Icons.verified, color: Colors.black87),
      SizedBox(width: 8.w),
      Text(
      "Dual Earnings",
      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
      ),
      ],
      ),
      SizedBox(height: 20.h),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
        "B Coin offers an AI-driven trading model, allowing users to earn through transactions & referral rewards.",
        style: TextStyle(fontSize: 14.sp, color: Colors.black54),
        ),
      ),
      SizedBox(height: 20.h),
      Row(
      children: [
      Icon(Icons.auto_graph, color: Colors.black87),
      SizedBox(width: 8.w),
      Text(
      "Future Growth",
      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
      ),
      ],
      ),
      SizedBox(height: 20.h),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
        "B Coin expands NFT trading boundaries using an innovative financial model for maximum profit potential.",
        style: TextStyle(fontSize: 14.sp, color: Colors.black54),
        ),
      ),
      ],
      ),
      ),

            SizedBox(height: 20.h),
            NFTCarousel(),
            SizedBox(height: 20.h),
            Text('Staking Overview',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 10.h),
            _stakingCard(),
            SizedBox(height: 20.h),
            NFTBidDisplay(),
            SizedBox(height: 20.h),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Container(
                    height: 75.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFB8860B),
                          Color(0xFFFFF5B6),
                          Color(0xFFDAA520),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Center(
                      child: Text(
                        'EXCLUSIVE B COINS',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

      BCoinNFTCard(
      nftName: 'BCoinNAame',
      ownerName: 'ownerName',
      totalItems: '4',
      mainImage: 'assets/bid_2.png',
      sideImages: ['assets/bid_1.png','assets/bid_3.png','assets/bid_2.png'],
      ownerImage: 'assets/carousel_1.png')
       ,BCoinNFTCard(
            nftName: 'BCoinNmae',
            ownerName: 'ownerName',
            totalItems: '4',
            mainImage: 'assets/bid_2.png',
            sideImages: ['assets/bid_1.png','assets/bid_3.png','assets/bid_2.png'],
            ownerImage: 'assets/carousel_1.png'),
        BCoinNFTCard(
            nftName: 'BCoinName',
            ownerName: 'ownerName',
            totalItems: '4',
            mainImage: 'assets/bid_2.png',
            sideImages: ['assets/bid_1.png','assets/bid_3.png','assets/bid_2.png'],
            ownerImage: 'assets/carousel_1.png')
      ]),
      SizedBox(height: 20.h),
       BCoinTopCollections(collectionData: dummyData),
            SizedBox(height: 20.h),
            BCoinPromo(),
       SizedBox(height: 20.h),
      BCoinFooter()
          ],
        ),
      ),
    );
  }



  Widget _stakingCard() {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Current Staked', style: TextStyle(color: Colors.white70)),
          SizedBox(height: 5.h),
          Text('1,500 BCoin',
              style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Earnings: +\$150',
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
              Text('APR: 12%', style: TextStyle(color: Colors.white70)),
            ],
          ),
        ],
      ),
    );
  }


}


class BCoinPromo extends StatelessWidget {
  const BCoinPromo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFF7E5), Color(0xFFFFE4A1)], // Light golden gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'UNLEASH THE POWER OF BCOINS',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5.w,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(height: 22.h),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Elevate your trading with BCOINS. Discover, invest, and gain like never before. Join the revolution today!',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[700],
              ),
            ),
          ),
          SizedBox(height: 22.h),
          GestureDetector(
            onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFB8860B),Color(0xFFFFF5B6),Color(0xFFDAA520)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(25.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8.r,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                'JOIN NOW',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),



        ],
      ),
    );
  }
}


class BCoinFooter extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Divider(color: Colors.black12,),
          SizedBox(height: 20.h,),
          Row(
            children: [
              Image.asset('assets/logo.png', height: 35.h),
              const SizedBox(width: 10),
              const Text(
                "B Coin",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 0.5,
                      color: Colors.amber,
                      offset: Offset(1, 0),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.sp),
          Text(
            'BCoin is a revolutionary Web3 income platform leveraging B COIN assets for optimized revenue generation.',
            style: TextStyle(color: Colors.grey[600],fontSize: 11.8.sp),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              SizedBox(width: 5.w,),
              IconButton(
                  onPressed: (){},
                  icon:Icon(Icons.email,size: 30.w,)),
              SizedBox(width: 10.w),

              IconButton(
                onPressed: (){},
                  icon:Icon(Icons.telegram,size: 30.w,)),
              SizedBox(width: 10.w),
              IconButton(
                  onPressed: (){},
                  icon:Icon(Icons.facebook,size: 30.w,)),
              SizedBox(width: 10.w),
              IconButton(
                  onPressed: (){},
                  icon:FaIcon(FontAwesomeIcons.instagram,size: 30.w,)),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            'Resources',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),  SizedBox(height: 20.h),
         TextButton(onPressed: (){},
             child: Text('Docs',

               style: TextStyle(
           color: Colors.black
         ),)),
         TextButton(onPressed: (){}, child: Text('Invite Friends',style: TextStyle(
             color: Colors.black
         ),)),
         TextButton(onPressed: (){}, child: Text('How to buy',style: TextStyle(
             color: Colors.black
         ),)),
          SizedBox(height: 20.h),

          Text(
            'Company',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),  SizedBox(height: 20.h),

          Text(
            'Subscribe to our mailing list to stay ahead with the latest Bcoin updates, feature launches, trading insights, and expert tips to maximize your earnings on the Bcoin platform.',
            style: TextStyle(color: Colors.grey[600],fontSize: 12.sp),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
            child: TextField(

              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff000000)),
                  borderRadius: BorderRadius.circular(20.r),
                ),
               hintText: 'Enter your email address',

                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(20.r),

                  borderSide: BorderSide(
                    color: Color(0xffffc107)
                  ),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 7.0),

                    child: Container(

                    width: 80.w,

                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [       Color(0xFFB8860B),Color(0xFFFFF5B6),Color(0xFFDAA520)],
                        ),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Center(
                        child: Text('Subscribe',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12.sp),),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 60.h),
          Center(
            child: Text(
              '© 2025 - B COIN Technology, Inc.\nPrivacy Policy Terms of Service',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),   SizedBox(height: 80.h),
        ],
      ),
    );
  }
}






