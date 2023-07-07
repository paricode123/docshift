import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Screens/consultation.dart';
import 'Screens/earning.dart';
import 'Screens/home.dart';

class Home_Page extends StatefulWidget {
  Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  int _currentIndex = 0;
  int selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ConsultationPage(),
    EarnPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        title: Text(
          'Appointment Details :-',
          style: TextStyle(color: Colors.black,fontSize: 17.sp),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                CircleAvatar(
                    radius: 8.sp,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.question_mark,color: Colors.white,size: 15,)),
                SizedBox(width: 10.w,),
                Text('Help',style: TextStyle(color: Colors.black,fontSize: 15.sp),),

              ],
            ),
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.calendar_today, size: 25.0.h, color: Colors.white),
            label: 'Appointment',
            labelStyle: TextStyle(color: Colors.white, fontSize: 10.0.sp),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.chat_bubble_outline, size: 25.0.h, color: Colors.white),
            label: 'Consultation',
            labelStyle: TextStyle(color: Colors.white, fontSize: 10.0.sp),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.attach_money, size: 25.0.h, color: Colors.white),
            label: 'Earnings',
            labelStyle: TextStyle(color: Colors.white, fontSize: 10.0.sp),
          ),

        ],
        color: Colors.blue.shade800,
        buttonBackgroundColor: Colors.blue.shade300,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });        },
      ),
    );
  }
}