
import 'package:b_coin/screens/home_screen.dart';
import 'package:b_coin/screens/sign_up_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isObscure = true;
  bool isClicked = false; // Track button state
  final Uri termsUrl = Uri.parse("https://example.com/termsandconditions"); // Replace with actual link
  final Uri privacyUrl = Uri.parse('https://example.com/privacy'); // Replace with actual link
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          _isLoading = true;
        });

        // 🔍 Step 1: Get the email from Firestore using the username
        QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('username', isEqualTo: _usernameController.text.trim())
            .limit(1)
            .get();

        if (snapshot.docs.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Username not found.")),
          );
          return;
        }

        String email = snapshot.docs.first['email'];

        // 🔐 Step 2: Sign in with Firebase Auth using fetched email
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: _passwordController.text.trim(),
        );

        // ✅ Step 3: Navigate to HomeScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'Login failed')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("An error occurred: $e")),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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


        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
            // Golden Gradient Container with "Login"
            SafeArea(
              child: Container(
                width: double.infinity,
                height: 43.h,
                alignment: Alignment.centerLeft, // ✅ Text Left Side Pe Aayega
                padding:  EdgeInsets.symmetric(horizontal: 15.w), // ✅ Thoda Left Padding
                decoration:  BoxDecoration(
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
                  "Login",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
        
             SizedBox(height: 0.h), // Space after Container
        
            ClipRect(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0),
                  child: Form(
                    key: _formKey,
                
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      // Unlock the World of Digital Treasures Text
                       Text(
                        "Unlock the World of Digital Treasures",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                          shadows: [
                            Shadow(
                              blurRadius: 0.5.r,
                              color: Colors.amber,
                              offset: Offset(1, 0) ,
                            )
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                
                       SizedBox(height: 10.h), // Space for next elements
                      // Light Grey Divider
                      Divider(
                        color: Colors.grey.shade300, // Very Light Grey
                        thickness: 1,
                      ),
                
                       SizedBox(height: 20.h), // Spacing after divider
                
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
                          controller: _usernameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'user name is required⚠️';
                            }
                            // if (!value.contains('@')) {
                            //   return 'Enter a valid email❗';
                            // }
                            return null;
                          },
                          decoration: InputDecoration(
                                            hintText: "Please enter your email",
                            hintStyle: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.grey
                                            ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Colors.black, width: 1.4.w),
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
                          obscureText: _isObscure,
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required⚠️';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Please enter your password",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(color: Colors.black, width: 1.4.w),

                            ),
                            hintStyle: TextStyle(
                                fontSize: 13.sp,
                
                                color: Colors.grey
                
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
                
                       SizedBox(height: 8.h),
                      //forgot password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child:  Text("Forgot Password?",
                
                            style:TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              shadows: [
                                Shadow(
                                  blurRadius: 0.5.r,
                                  color: Colors.amber,
                                  offset: Offset(0.5, 0) ,
                                )
                              ],
                              ),
                        ),
                      ),),
                       SizedBox(height: 10.h),
                        //login button
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 15.w), // ✅ Horizontal Padding Added
                          child: GestureDetector(
                            onTap: _login,
                            child: Container(
                              width: double.infinity,
                              padding:  EdgeInsets.symmetric(vertical: 12.w),
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(30.r),
                                boxShadow:  [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 5.r,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                              child: Center(
                                child:  _isLoading
                                    ? SizedBox(
                                  height: 20.h,
                                  width: 20.w,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.w,
                                    color: Colors.white, // same as text color
                                  ))
                                    : Text(
                                  "Log in",
                                  style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ),
                
                         SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text("Don’t have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen(onSendVerification: (){})));
                                                    },
                            child:  Text("Sign up",
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
                        // Divider with OR
                         SizedBox(height: 10.h),
                
                        //divider with OR operation
                        Row(
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
                       SizedBox(height: 30.h),
                        // Wallet Connect Button with Golden Gradient
                        Center(
                        child: GestureDetector(
                        onTap: () {
                        setState(() {

                        isClicked = true ;
                        });
                
                        Future.delayed(Duration(milliseconds: 200), (){
                        // Navigator.push(
                        // context,
                        // MaterialPageRoute(builder: (context) => NextPage(
                        // onBack: () {
                        // setState(() {
                        // isClicked = false; // Wapas aane pe default state
                        // });
                        // })),
                        // );






                        });
                        },
                        child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          alignment: Alignment.center,
                          padding:  EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
                          decoration: BoxDecoration(
                          gradient: isClicked
                          ?  LinearGradient(
                          colors: [
                            // Bright Yellow
                          Color(0xFFB8860B), // Darker Gold
                          Color(0xFFFFF5B6), // Light Gold
                          Color(0xFFDAA520), // Deep Gold
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          )
                              : null,
                          color: isClicked ? null : Colors.transparent,
                          borderRadius: BorderRadius.circular(30.r),
                          border: Border.all(
                          width: 1.5,
                          color: Color(0xFFFFD700,), // Default Golden Border
                          ),
                          ),
                          child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                          Icon(
                          Icons.account_balance_wallet,
                          color: isClicked ? Colors.black : Color(0xFFFFD700), // Default Golden, Black on Click
                          ),
                           SizedBox(width: 10.w),
                          Text(
                          "Wallet Connect",
                          style: TextStyle(
                          color: isClicked ? Colors.black : Colors.grey.shade800, // Default Grey, Black on Click
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          ),
                          ),
                          ],
                          ),
                          ),
                        ),
                        ),
                        ),
                        SizedBox(height: 60.h,),
                        Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 0.w),
                        child: RichText(
                          textAlign: TextAlign.center,
                        text: TextSpan(
                
                        style: TextStyle(fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.w,
                            height: 1.5.h,
                            color: Colors.grey.shade500), // Default Greyish Tone
                
                        children: [
                         TextSpan(text: "By Logging In Or Registering, You Have Agreed To The "),
                        TextSpan(
                        text: "Terms And Conditions",
                        style:  TextStyle(color: Colors.black), // Black Color for Clickable Text
                        recognizer: TapGestureRecognizer()
                        ..onTap = () {
                        _launchURL(termsUrl);
                        },
                        ),
                         TextSpan(text: " And "),
                        TextSpan(
                        text: "Privacy Policy.",
                        style:  TextStyle(color: Colors.black), // Black Color for Clickable Text
                        recognizer: TapGestureRecognizer()
                        ..onTap = () {
                        _launchURL(privacyUrl);
                        },
                        ),
                        ],
                        ),
                        ),
                        )
                
                
                
                    ],),
                  ),
                ),
              ),
            )
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

