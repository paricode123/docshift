import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import '../main_page.dart';

class VerificationPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> login() async {
    var url =
    Uri.parse('https://thetechnicalsolution.in/quikdoc/Api/doctor_login.php');
    var response = await http.post(url, body: {
      'phone': _mobileNumberController.text,
      'password': _passwordController.text,
    });

    if (response.statusCode == 200) {
      // Successful response
      print(response.body);
      // Handle the response data here
    } else {
      // Error occurred
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Row(
          children: [
            Spacer(),
            CircleAvatar(
              radius: 10.sp,
              backgroundColor: Colors.black,
              child: Icon(Icons.question_mark, color: Colors.white, size: 15),
            ),
            SizedBox(width: 10.w),
            Text(
              'Help',
              style: TextStyle(color: Colors.black, fontSize: 15.sp),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text(
              'Enter your Registered Mobile Number & Password!',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.h),
            TextField(
              controller: _mobileNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: ' +91 | Mobile Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 25.h),
            TextField(
              controller: _passwordController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: ' Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              'By continuing, you agree to our',
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.grey.shade500,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              'Term & Conditions',
              style: TextStyle(
                fontSize: 15.sp,
                decoration: TextDecoration.underline,
                color: Colors.black,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                login();
              },
              child: Container(
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Color(0xFF2fade2),
                ),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 18.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}