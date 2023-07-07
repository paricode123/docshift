import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Appointment {
  final String name;
  final int tokenNumber;
  final String time;

  Appointment(this.name, this.tokenNumber, this.time);
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> shifts = ['Morning Shift', 'Afternoon Shift','Evening Shift', ];

  Map<String, List<Appointment>> appointments = {
    'Morning Shift': [
      Appointment('John Doe', 1, '9:00 AM'),
      Appointment('Jane Smith', 2, '9:30 AM'),
      Appointment('Alex Johnson', 3, '10:00 AM'),
    ],
    'Afternoon Shift': [
      Appointment('Olivia Wilson', 6, '1:00 PM'),
      Appointment('William Clark', 7, '1:30 PM'),
      Appointment('Sophia Garcia', 8, '2:00 PM'),
    ],
    'Evening Shift': [
      Appointment('Emily Davis', 4, '4:00 PM'),
      Appointment('Michael Brown', 5, '4:30 PM'),
    ],
  };

  String? selectedShift;
  List<Appointment>? selectedAppointments;

  @override
  void initState() {
    super.initState();
    selectedShift = shifts[0];
    selectedAppointments = appointments[selectedShift!];
  }

  void updateSelectedShift(String shift) {
    setState(() {
      selectedShift = shift;
      selectedAppointments = appointments[selectedShift!];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: shifts.map((shift) {
                return ElevatedButton(
                  onPressed: () => updateSelectedShift(shift),
                  child: Text(shift, style: TextStyle(color: Colors.black)),
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
            SizedBox(height: 60.h),
            Text(
              'Appointments',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: selectedAppointments != null &&
                      selectedAppointments!.isNotEmpty
                  ? ListView.separated(
                itemCount: selectedAppointments!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  final appointment = selectedAppointments![index];
                        return ListTile(
                          title: Text(appointment.name,style: TextStyle(fontWeight: FontWeight.w600),),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5.h,),
                              Text('Token Number: ${appointment.tokenNumber}'),
                              Text('Time: ${appointment.time}'),
                              SizedBox(height: 5.h,),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton(
                                onPressed: () {
// TODO: Implement accept logic
                                },
                                child: Text('Accept'),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  primary: Colors.green,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              ElevatedButton(
                                onPressed: () {
// TODO: Implement accept logic
                                },
                                child: Text('Decline'),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  primary: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text('No appointments available'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
