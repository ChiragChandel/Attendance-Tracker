import 'package:flutter/material.dart';
import 'attendance_list.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key}); // Key parameter added

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/profile_placeholder.png'),
                ),
                SizedBox(height: 10),
                Text(
                  'Attendance Tracker',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  'admin@attendancetracker.com',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.timer),
            title: Text('Timer'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.event_available),
            title: Text('Attendance'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AttendanceListPage()),
              );
            },
          ),
          // Additional ListTiles for other navigation items...
          ListTile(
            leading: Icon(Icons.timeline_outlined),
            title: Text('Activity'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.piano_rounded),
            title: Text('Timesheet'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.my_library_books_rounded),
            title: Text('Report'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.apartment_outlined),
            title: Text('Jobsite'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Team'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          // Additional ListTiles for other navigation items...
          ListTile(
            leading: Icon(Icons.calendar_today_outlined),
            title: Text('Schedules'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text('Request to join organization'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
           ListTile(
            leading: Icon(Icons.help_center_outlined),
            title: Text('FAQ & Help'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Privacy '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

