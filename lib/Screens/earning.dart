import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Appointment {
  final String name;
  final int tokenNumber;
  final String time;

  Appointment(this.name, this.tokenNumber, this.time);
}

class Earnings {
  final String name;
  final String startTime;
  final String endTime;
  int patientCount;
  int totalFees;

  Earnings(
      this.name,
      this.startTime,
      this.endTime,
      )   : patientCount = 0,
        totalFees = 0;

  void addAppointment(Appointment appointment) {
    patientCount++;
    totalFees += 50; // Assuming each appointment costs $50
  }
}

class EarnPage extends StatefulWidget {
  @override
  _EarnPageState createState() => _EarnPageState();
}

class _EarnPageState extends State<EarnPage> {
  List<Earnings> shifts = [
    Earnings('Morning Shift', '9:00 AM', '11:00 AM'),
    Earnings('Afternoon Shift', '1:00 PM', '3:00 PM'),
    Earnings('Evening Shift', '4:00 PM', '6:00 PM'),
  ];

  Earnings? selectedShift;
  bool toggleValue = false;

  @override
  void initState() {
    super.initState();
    selectedShift = shifts[0];
  }

  void updateSelectedShift(Earnings shift) {
    setState(() {
      selectedShift = shift;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title:
              Row(
                children: [
                  Spacer(),
                  Text(
                    'Is this a Holiday :-',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 8.0),
                    child: IconButton(
                      iconSize: 45.0,
                      icon: Icon(
                        toggleValue ? Icons.toggle_on : Icons.toggle_off,
                        color: toggleValue ? Colors.green : Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          toggleValue = !toggleValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: shifts.map((shift) {
                return ElevatedButton(
                  onPressed: () => updateSelectedShift(shift),
                  child: Text(shift.name, style: TextStyle(color: Colors.black)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        shift == selectedShift ? Colors.blue.shade50 : Colors.grey.shade200),
                    // Add the following line to set the border color
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(
                        color: shift == selectedShift ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20.h),
            selectedShift != null
                ? Padding(
                  padding:  EdgeInsets.all(16.w),
                  child: Column(
              children: [
                  Text(
                    'Shift Details',
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold,color: Colors.blue.shade800,decoration: TextDecoration.underline),
                  ),
                  SizedBox(height: 50.h),
                  Row(
                    children: [
                      Text('Patient Count:',style: TextStyle(
                        fontSize: 16.sp,fontWeight: FontWeight.w600,
                      ),),
                      Text(' ${selectedShift!.patientCount}'),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text('Total Fees Collected: ',style: TextStyle(
                  fontSize: 16.sp,fontWeight: FontWeight.w600,
                  ),),
                      Text('${selectedShift!.totalFees}/-'),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text('Shift Timing: ',style: TextStyle(
                        fontSize: 16.sp,fontWeight: FontWeight.w600,
                      ),),
                      Text('${selectedShift!.startTime} - ${selectedShift!.endTime}',style: TextStyle(
                        fontSize: 15.sp,color: Colors.green,
                      ),),
                    ],
                  ),
              ],
            ),
                )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}


