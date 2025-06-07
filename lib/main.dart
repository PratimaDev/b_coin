import 'package:b_coin/firebase_options.dart';
import 'package:b_coin/models/deep_link_handler.dart';
import 'package:b_coin/screens/splash_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // ✅ Initialize deep link handler
  await DeepLinkHandler().initUriHandler((uri) {
    print("🔗 Deep link received: $uri");

    // TODO: Save uri or trigger connectWallet later if needed
    if (uri.contains("connect-wallet")) {
      print("🎯 Deep link triggered: Connect wallet flow");
      // You can use a global callback or state mgmt here
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'B Coin',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
            ),
          ),
          home: SplashScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
