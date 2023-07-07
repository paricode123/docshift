import 'dart:async';

import 'package:docshift/loginpart/number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  VerificationPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF003366), // Dark blue color
                Color(0xFF59d4ff), // Light blue color
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              Image.asset('assets/images/splash.png',height: 200.h,width: 200.w,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.circle,color: Colors.white,size: 15,),
                  SizedBox(width: 5.w,),
                  Text(
                    'QuikDoc',
                    style: TextStyle(fontSize: 30.sp, color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5.w,),
                  Icon(Icons.circle,color: Colors.white,size: 15,),
                ],
              ),
              SizedBox(height: 20.h,),
              Text(
                'India\'s top doctors to guid you\nto better health every day',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp, color: Colors.white,),
              ),
            ],
          ),
        ));
  }
}