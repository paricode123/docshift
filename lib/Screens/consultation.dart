import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConsultationPage extends StatefulWidget {
  @override
  _ConsultationPageState createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
  String tokenNumber = '';
  String patientDetails = '';
  bool isAppointmentDone = false;

  void checkPatient() {
    // Logic to retrieve patient details based on token number
    // You can replace this with your own implementation
    // For this example, we'll simulate fetching patient details
    // from a database based on the token number

    // Assuming the patient details are retrieved successfully
    setState(() {
      patientDetails = 'Patient Details for Token Number $tokenNumber';
      isAppointmentDone = false;
    });
  }

  void completeAppointment() {
    // Logic to complete the appointment for the patient
    // You can add your own implementation here
    // For this example, we'll simulate marking the appointment as done

    // Assuming the appointment is completed successfully
    setState(() {
      patientDetails = '';
      tokenNumber = '';
      isAppointmentDone = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    'Enter the ',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Token Number ',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  Text(
                    'of the ',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                'Patient !',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16.h),
              TextField(
                onChanged: (value) {
                  setState(() {
                    tokenNumber = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Token Number',
                ),
              ),
              SizedBox(height: 20.h),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    checkPatient();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                    child: Text(
                      'Check Patient Details',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    primary: Colors.blue.shade50,
                    side: BorderSide(color: Colors.blue, width: 2.w),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              if (patientDetails.isNotEmpty && !isAppointmentDone)
                Text(patientDetails),
              SizedBox(height: 40.h),
              if (patientDetails.isNotEmpty && !isAppointmentDone)
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      completeAppointment();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                      child: Text(
                        'Appointment DONE',
                        style: TextStyle(color: Colors.white, fontSize: 15.sp),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      primary: Colors.green,
                      side: BorderSide(color: Colors.green, width: 2.w),
                    ),
                  ),
                ),
              SizedBox(height: 40.h),

            ],
          ),
        ),
      ),
    );
  }
}
