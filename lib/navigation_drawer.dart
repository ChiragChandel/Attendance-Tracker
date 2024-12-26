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
                  'Cameron Williamson',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  'cameronwilliamson@gmail.com',
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
        ],
      ),
    );
  }
}

