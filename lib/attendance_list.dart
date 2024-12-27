import 'package:flutter/material.dart';
import 'route_tracking_page.dart';

class AttendanceListPage extends StatelessWidget {
  const AttendanceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> members = [
       {'name': 'Aarav Sharma', 'id': 'WSL0003', 'status': 'Working'},
      {'name': 'Aditya Verma', 'id': 'WSL0034', 'status': 'Logged Out'},
      {'name': 'Ishan Nair', 'id': 'WSL0054', 'status': 'Not Logged In'},
      {'name': 'Meera Banerjee', 'id': 'WSL0076', 'status': 'Logged Out'},
      {'name': 'Savannah Nguyen', 'id': 'WSL0065', 'status': 'Logged Out'},
      {'name': 'Dev Patel', 'id': 'WSL0065', 'status': 'Not Logged In'},
      {'name': 'Arjun Iyer', 'id': 'WSL0065', 'status': 'Logged Out'},
      {'name': 'Divya Mishra', 'id': 'WSL0065', 'status': 'Working'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                child: Text(
                  member['name']![0],
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text('${member['name']} (${member['id']})'),
              subtitle: Text('Status: ${member['status']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.location_on, color: Colors.blue),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RouteTrackingPage(memberName: member['name']!),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.info, color: Colors.grey),
                    onPressed: () {
                      // Add logic for showing additional details here
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
