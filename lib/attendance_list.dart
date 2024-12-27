import 'package:flutter/material.dart';
import 'route_tracking_page.dart';

class AttendanceListPage extends StatefulWidget {
  const AttendanceListPage({super.key});

  @override
  _AttendanceListPageState createState() => _AttendanceListPageState();
}

class _AttendanceListPageState extends State<AttendanceListPage> {
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

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Filter the members based on the search query
    final filteredMembers = members
        .where((member) =>
            member['name']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (query) {
                setState(() {
                  searchQuery = query;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search names...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredMembers.length,
              itemBuilder: (context, index) {
                final member = filteredMembers[index];
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
          ),
        ],
      ),
    );
  }
}
