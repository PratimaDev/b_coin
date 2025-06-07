import 'package:b_coin/components/wallet_connector.dart';
import 'package:b_coin/models/utils.dart';
import 'package:b_coin/screens/home_screen.dart';
import 'package:b_coin/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  final Function() onSendVerification;
  const SignUpScreen({super.key,required this.onSendVerification});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final Uri termsUrl = Uri.parse("https://example.com/termsandconditions"); // Replace with actual link
  final Uri privacyUrl = Uri.parse('https://example.com/privacy'); // Replace with actual link
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController referralController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isClicked = false;
  bool isClickedone = false; // Track button state
  bool _isObscure = true;
  bool isLoading = false;

  bool isSigningUp = false; // 🔁 Add this to your _SignUpScreenState

  bool loading = false;


  @override
  void dispose() {
    emailController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    referralController.dispose();
    codeController.dispose();
    userNameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  void sendVerificationCode() {
    // Real-time Email Verification Logic Here
    print("Verification Code Sent to: \${emailController.text}");
  }
 void sendVerification() async {
    setState(() {
      isLoading = true; // Start loader
      isClicked = true;
    });
  await widget.onSendVerification(); // Simulated Email Sending
 setState(() {
      isLoading = false; // Stop loader after request is completed
    });
  }

  void signUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });

      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        print("User created with UID: ${userCredential.user!.uid}");
        print("Writing to Firestore...");

        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'email': emailController.text.trim(),
          'createdAt': DateTime.now(),
        });

        print("Firestore write successful ✅");

        Utils().toastMessage("Account created successfully!");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } catch (error) {
        print("Error during signup: $error");
        Utils().toastMessage(error.toString());
      } finally {
        setState(() {
          loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Image.asset('assets/logo.png', height: 40.h), // Logo
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
                  offset: Offset(1, 0) ,
                )
              ],
            ),
          ),
        ],
      ),
      actions: [

         SizedBox(width: 1.w),

         SizedBox(width: 10.w),
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Golden Gradient
        ),
      ),
    ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gradient Button (Wallet Connect Style)
            // Golden Gradient Container with "Sign Up"
            SafeArea(
              child: Container(
                width: double.infinity,
                height: 43.h,
                alignment: Alignment.centerLeft, // ✅ Text Left Side Pe Aayega
                padding:  EdgeInsets.symmetric(horizontal: 15.w), // ✅ Thoda Left Padding
                decoration: BoxDecoration(
                  gradient:    LinearGradient(colors: [
                    Color(0xFFDAA520), // 0%
                    Color(0xFFB8860B), // 20%
                    Color(0xFFFFF5B6), // 71%
                    Color(0xFFDAA520), // 100%
                  ],
                    stops: [0.0, 0.2, 0.71, 1.0], // Matching gradient stops
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),),


                child:  Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            // Wallet Connect Button with Golden Gradient
            Center(
              child: GestureDetector(
                  onTap: () async {
                    // setState(() {
                    //   isClicked = true;
                    // });
                    //
                    // final walletConnector = WalletConnector();
                    // final address = await walletConnector.connectWallet();
                    //
                    // if (address != null) {
                    //   print("✅ Connected Wallet Address: $address");
                    //
                    //   // Optional: Save to Firebase or local DB as login
                    //   // Example: FirebaseFirestore.instance.collection("users").doc(address).set({...});
                    //
                    //   // Show success message or navigate
                    //   await FirebaseFirestore.instance.collection('users').doc(address).set({
                    //     'wallet': address,
                    //     'createdAt': FieldValue.serverTimestamp(),
                    //   });
                    //
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(content: Text("Wallet Connected: $address")),
                    //   );
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(content: Text("Wallet connection failed")),
                    //   );
                    // }
                    //
                    // await Future.delayed(Duration(milliseconds: 300));
                    // setState(() {
                    //   isClicked = false;
                    // });
                  },

                child: Padding(

                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child:  AnimatedContainer(
                    duration: Duration.zero, // No delay, instant change
                    alignment: Alignment.center,
                    padding:  EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                      gradient: isClickedone
                          ? const LinearGradient(
                        colors: [
                          Color(0xFFB8860B), // Darker Gold
                          Color(0xFFFFF5B6), // Light Gold
                          Color(0xFFDAA520), // Deep Gold
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                          : null, // Initially no gradient
                      color: isClickedone ? null : Colors.transparent, // Initially Transparent
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(
                        width: 1.5,
                        color: Color(0xFFFFD700), // Default Golden Border
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.account_balance_wallet,
                          color: isClickedone ? Colors.black : Color(0xFFFFD700), // Black on Click
                        ),
                         SizedBox(width: 10.w),
                        Text(
                          "Sign Up With Wallet",
                          style: TextStyle(
                            color: isClickedone ? Colors.black : Colors.grey.shade800, // Grey initially, Black on Click
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                ),
              ),
            ),
            SizedBox(height: 20.h),
            //divider with OR operation
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      "OR",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade400,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 20.0.w,right: 20.0.w,top: 20.0.h),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Username Field
                    RichText(

                      text:  TextSpan(
                        children: [
                          TextSpan(
                            text: "User name",

                            style: TextStyle(
                              color: Colors.black,

                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                          TextSpan(
                            text: "*",
                            style: TextStyle(
                              color: Colors.red, // Red Star
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                     SizedBox(height: 8.h),
                    //username textfield
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: TextFormField(

                        controller: userNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name❗';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Please enter user name",
                          hintStyle: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.grey

                          ),  focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(color: Colors.black, width: 1.4.sp),
                        ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r), // Rounded Border
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          contentPadding:  EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                        ),
                      ),
                    ),

                     SizedBox(height: 15.h),

                    // Password Field
                    RichText(
                      // textAlign: TextAlign.left,
                      text:  TextSpan(
                        children: [
                          TextSpan(

                            text: "Password",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: "*",
                            style: TextStyle(
                              color: Colors.red, // Red Star
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                     SizedBox(height: 8.h),
                    //password textfield
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.7.w),
                      child: TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password❗';
                          }

                          return null;
                        },

                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          hintText: "Please enter your password",

                          hintStyle: TextStyle(
                              fontSize: 13.sp,

                              color: Colors.grey

                          ),  focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(color: Colors.black, width: 1.4),
                        ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
                          suffixIcon: IconButton(
                            icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility,color: Colors.grey.shade700,),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure; // ✅ Eye toggle working now
                              });
                            },
                          ), contentPadding:  EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                        ),
                      ),
                    ),

                    SizedBox(height: 12.h),
                    //please re-enter ur password textfield
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.7.w),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please re-enter your password❗';
                          }
                          if (value != confirmPasswordController.text) {
                            return 'Passwords do not match❗';
                          }
                          return null;
                        },
                        obscureText: _isObscure,
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          hintText: "Please re-enter your password",

                          hintStyle: TextStyle(
                              fontSize: 13.sp,

                              color: Colors.grey

                          ),  focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(color: Colors.black, width: 1.4),
                        ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
                          suffixIcon: IconButton(
                            icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility,color: Colors.grey.shade700,),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure; // ✅ Eye toggle working now
                              });
                            },
                          ), contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                        ),
                      ),
                    ),
                    //Mobile no. field
                    SizedBox(height: 15.h),
                    RichText(
                      // textAlign: TextAlign.left,
                      text:  TextSpan(
                        children: [
                          TextSpan(

                            text: "Mobile no.",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    // Mobile Number Field with Country Code
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 7.w),
                      child: IntlPhoneField(
                        controller: mobileController,
                        validator: (value) {
                          if (value == null || value.isValidNumber()) {
                            return 'Please enter your mobile number❗';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter mobile no.",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(color: Colors.black, width: 1.4),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
                          contentPadding:  EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                          hintStyle: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.grey

                          ),),
                        initialCountryCode: 'IN',
                      ),
                    ),
                    // Email Field
                    SizedBox(height: 5),
                    RichText(
                      // textAlign: TextAlign.left,
                      text:  TextSpan(
                        children: [
                          TextSpan(

                            text: "Email",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: "*",
                            style: TextStyle(
                              color: Colors.red, // Red Star
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //email text field
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.7.w),
                      child: TextFormField(
                controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email❗';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Please enter your email",

                          hintStyle: TextStyle(
                              fontSize: 13.sp,

                              color: Colors.grey

                          ),  focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(color: Colors.black, width: 1.4),
                        ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
                           contentPadding:  EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                        ),
                      ),
                    ),
                    //email verification code Textfield row[]
                    SizedBox(height: 15.h),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 7.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter code❗';
                                }
                                return null;
                              },
                              controller: codeController,
                              decoration: InputDecoration(
                                hintText: "Email Verification Code",
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: BorderSide(color: Colors.black, width: 1.4),
                                ),
                                hintStyle: TextStyle(
                                    fontSize: 13.sp,

                                    color: Colors.grey

                                ),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
                                contentPadding:  EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          GestureDetector(
                    onTap: isLoading ? null : sendVerification, // Disable while loading
                    child: AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                    gradient: isClicked
                    ? LinearGradient(
                    colors: [
                    Color(0xFFB8860B), // Dark Gold
                    Color(0xFFFFD700), // Bright Gold
                    Color(0xFFDAA520), // Deep Gold
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    )
                        : null,
                    color: isClicked ? null : Colors.transparent, // Initially Transparent
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(
                    width: 1.5,
                    color: Color(0xFFFFD700), // Golden Border
                    ),
                    ),
                    child: isLoading
                    ? SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    ),
                    )
                        : Text(

                    "Get",
                    style: TextStyle(
                    color: isClicked ? Colors.black : Color(0xFFFFD700), // Golden initially, Black after click
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    ),
                    ),
                    ),
                    )
                        ],
                      ),
                    ),
                    //Referral Code Field*
                    SizedBox(height: 15.h),
                    RichText(
                      // textAlign: TextAlign.left,
                      text:  TextSpan(
                        children: [
                          TextSpan(

                            text: "Referral Code",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: "*",
                            style: TextStyle(
                              color: Colors.red, // Red Star
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Referral Code textfield
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.7.w),
                      child: TextFormField(
                controller: referralController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Referral Code❗';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Please enter your Referral Code",

                          hintStyle: TextStyle(
                              fontSize: 13.sp,

                              color: Colors.grey

                          ),  focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(color: Colors.black, width: 1.4),
                        ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
                          contentPadding:  EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                        ),
                      ),
                    ),
                    SizedBox(height: 25.h),
                    //sign up button

// Inside your build method 👇
    Padding(
    padding:  EdgeInsets.symmetric(horizontal: 15.w),
    child: GestureDetector(
    onTap: () async {
    setState(() {
    isSigningUp = true; // 🌀 Show loader
    });

    try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
    email: emailController.text.trim(),
    password: passwordController.text.trim(),
    );

    ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text("Signing Up Successful!")),
    );

    await _firestore.collection('users').doc(userCredential.user!.uid).set({
    'email': emailController.text.trim(),
    'username': userNameController.text.trim(),
    'phone_number': mobileController.text.trim(),
    'referral_code': referralController.text.trim(),
      'password': passwordController.text.trim(),
    'createdAt': DateTime.now(),
    });

    Utils().toastMessage("Account created successfully!");

    Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => HomeScreen()),
    );
    } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("SignUp Failed: $e")),
    );
    } finally {
    setState(() {
    isSigningUp = false; // ✅ Hide loader
    });
    }
    },
    child: Container(
    width: double.infinity,
    padding:  EdgeInsets.symmetric(vertical: 12.h),
    decoration: BoxDecoration(
    color: Colors.black87,
    borderRadius: BorderRadius.circular(30.r),
    boxShadow:  [
    BoxShadow(
    color: Colors.black26,
    blurRadius: 5.r,
    offset: Offset(2.h, 2),
    ),
    ],
    ),
    child: Center(
    child: isSigningUp
    ?  SizedBox(
    height: 20.h,
    width: 20.w,
    child: CircularProgressIndicator(
    strokeWidth: 2.w,
    color: Colors.white, // same as text color
    ),
    )
        :  Text(
    "Sign up",
    style: TextStyle(
    color: Colors.white,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    ),
    ),
    ),
    ),
    ),
    ),

    //have an account login
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                          },
                          child:  Text("Log in",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15.sp,
                                color: Colors.black,
                                shadows: [
                                  Shadow(
                                    blurRadius: 0.5.r,
                                    color: Colors.amber,
                                    offset: Offset(0.5, 0) ,
                                  )
                                ],





                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 54.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 0.w),
                      child: RichText(

                        textAlign: TextAlign.center,
                        text: TextSpan(

                          style: TextStyle(fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              height: 1.5.h,
                              color: Colors.grey.shade500), // Default Greyish Tone

                          children: [
                            const TextSpan(text: "By Logging In Or Registering, You Have Agreed To The "),
                            TextSpan(
                              text: "Terms And Conditions",
                              style: const TextStyle(color: Colors.black), // Black Color for Clickable Text
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  _launchURL(termsUrl);
                                },
                            ),
                            const TextSpan(text: " And "),
                            TextSpan(
                              text: "Privacy Policy.",
                              style: const TextStyle(color: Colors.black), // Black Color for Clickable Text
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  _launchURL(privacyUrl);
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),

                  ],


                ),
              ),
            ),



              ],
            ),


        ),


    );
  }
}

class NextPage extends StatelessWidget {
  final VoidCallback onBack;
  NextPage({required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Next Page"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            onBack(); // Wapas jaane pe default state ho
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(child: Text("You're on the next page!")),
    );
  }
}


void _launchURL(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}