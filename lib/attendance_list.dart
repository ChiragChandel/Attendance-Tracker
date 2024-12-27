import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'location_history_page.dart';

class AttendanceListPage extends StatefulWidget {
  const AttendanceListPage({super.key});

  @override
  State<AttendanceListPage> createState() => _AttendanceListPageState();
}

class _AttendanceListPageState extends State<AttendanceListPage> {
  final List<Map<String, String>> members = [
    {'name': 'Aditya Birla', 'id': 'WSL0003'},
    {'name': 'Arav Sharma', 'id': 'WSL0034'},
    {'name': 'Ridhima Gaur', 'id': 'WSL0054'},
    {'name': 'Ray Kapoor', 'id': 'WSL0654'},
    {'name': 'Anjum Seth', 'id': 'WSL0087'},
    {'name': 'Ritika Gulati', 'id': 'WSL0074'},
    {'name': 'Nidhi Arora', 'id': 'WSL0063'},
    {'name': 'Nikhil Yadav', 'id': 'WSL0014'},
    {'name': 'Devinder Singh', 'id': 'WSL0058'},
    {'name': 'Krish Dubey', 'id': 'WSL0026'},
    {'name': 'Mritunjay Pathak', 'id': 'WSL0078'},
    {'name': 'Kavish Goud', 'id': 'WSL0022'},
    {'name': 'Yashika Roy', 'id': 'WSL0041'},
    {'name': 'Parmeet Malhotra', 'id': 'WSL0038'},
  ];

  final Map<String, List<Map<String, String>>> locationHistory = {
    'Aditya Birla': [
      {'name': 'Connaught Place, Delhi', 'url': 'https://maps.app.goo.gl/x4bd7k8Gd9DL8jrEA'},
      {'name': 'Gateway of India, Mumbai', 'url': 'https://maps.app.goo.gl/j8kH7D88ZX6Qd4nVA'},
      {'name': 'Munnar, Kerala', 'url': 'https://maps.app.goo.gl/BTfa35xpgZJvSESY9'},
    ],
    'Arav Sharma': [
      {'name': 'Assi Ghat, Varanasi', 'url': 'https://maps.app.goo.gl/WAuffRcjtxqA2XAy7'},
      {'name': 'Taj Mahal, Agra', 'url': 'https://maps.app.goo.gl/UivHieqEyzXDZ7x19'},
      {'name': 'Elephanta Caves, Gharapuri', 'url': 'https://maps.app.goo.gl/i1ZiwKMsYu66heUq6'},
    ],
    'Ridhima Gaur': [
      {'name': 'Himachal Pradesh Stadium, Dharamshala', 'url': 'https://maps.app.goo.gl/dcr8EH15BbHi1Aa66'},
      {'name': 'Puri, Odisha', 'url': 'https://maps.app.goo.gl/UZor34GAt4AHNZUG9'},
      {'name': 'Konark Sun Temple, Konark', 'url': 'https://maps.app.goo.gl/89FwaSdBrfa6uSL66'},
    ],
    'Ray Kapoor': [
      {'name': 'Himachal Pradesh Stadium, Dharamshala', 'url': 'https://maps.app.goo.gl/dcr8EH15BbHi1Aa66'},
      {'name': 'Puri, Odisha', 'url': 'https://maps.app.goo.gl/UZor34GAt4AHNZUG9'},
      {'name': 'Konark Sun Temple, Konark', 'url': 'https://maps.app.goo.gl/89FwaSdBrfa6uSL66'},
    ],
    'Anjum Seth': [
      {'name': 'Himachal Pradesh Stadium, Dharamshala', 'url': 'https://maps.app.goo.gl/dcr8EH15BbHi1Aa66'},
      {'name': 'Puri, Odisha', 'url': 'https://maps.app.goo.gl/UZor34GAt4AHNZUG9'},
      {'name': 'Konark Sun Temple, Konark', 'url': 'https://maps.app.goo.gl/89FwaSdBrfa6uSL66'},
    ],
    'Ritika Gulati': [
      {'name': 'Himachal Pradesh Stadium, Dharamshala', 'url': 'https://maps.app.goo.gl/dcr8EH15BbHi1Aa66'},
      {'name': 'Puri, Odisha', 'url': 'https://maps.app.goo.gl/UZor34GAt4AHNZUG9'},
      {'name': 'Konark Sun Temple, Konark', 'url': 'https://maps.app.goo.gl/89FwaSdBrfa6uSL66'},
    ],
    'Nidhi Arora': [
      {'name': 'Himachal Pradesh Stadium, Dharamshala', 'url': 'https://maps.app.goo.gl/dcr8EH15BbHi1Aa66'},
      {'name': 'Puri, Odisha', 'url': 'https://maps.app.goo.gl/UZor34GAt4AHNZUG9'},
      {'name': 'Konark Sun Temple, Konark', 'url': 'https://maps.app.goo.gl/89FwaSdBrfa6uSL66'},
    ],
    'Nikhil Yadav': [
      {'name': 'Himachal Pradesh Stadium, Dharamshala', 'url': 'https://maps.app.goo.gl/dcr8EH15BbHi1Aa66'},
      {'name': 'Puri, Odisha', 'url': 'https://maps.app.goo.gl/UZor34GAt4AHNZUG9'},
      {'name': 'Konark Sun Temple, Konark', 'url': 'https://maps.app.goo.gl/89FwaSdBrfa6uSL66'},
    ],
    'Devinder Singh': [
      {'name': 'Himachal Pradesh Stadium, Dharamshala', 'url': 'https://maps.app.goo.gl/dcr8EH15BbHi1Aa66'},
      {'name': 'Puri, Odisha', 'url': 'https://maps.app.goo.gl/UZor34GAt4AHNZUG9'},
      {'name': 'Konark Sun Temple, Konark', 'url': 'https://maps.app.goo.gl/89FwaSdBrfa6uSL66'},
    ],
    'Krish Dubey': [
      {'name': 'Himachal Pradesh Stadium, Dharamshala', 'url': 'https://maps.app.goo.gl/dcr8EH15BbHi1Aa66'},
      {'name': 'Puri, Odisha', 'url': 'https://maps.app.goo.gl/UZor34GAt4AHNZUG9'},
      {'name': 'Konark Sun Temple, Konark', 'url': 'https://maps.app.goo.gl/89FwaSdBrfa6uSL66'},
    ],
    'Mritunjay Pathak': [
      {'name': 'Himachal Pradesh Stadium, Dharamshala', 'url': 'https://maps.app.goo.gl/dcr8EH15BbHi1Aa66'},
      {'name': 'Puri, Odisha', 'url': 'https://maps.app.goo.gl/UZor34GAt4AHNZUG9'},
      {'name': 'Konark Sun Temple, Konark', 'url': 'https://maps.app.goo.gl/89FwaSdBrfa6uSL66'},
    ],
    'Kavish Goud': [
      {'name': 'Himachal Pradesh Stadium, Dharamshala', 'url': 'https://maps.app.goo.gl/dcr8EH15BbHi1Aa66'},
      {'name': 'Puri, Odisha', 'url': 'https://maps.app.goo.gl/UZor34GAt4AHNZUG9'},
      {'name': 'Konark Sun Temple, Konark', 'url': 'https://maps.app.goo.gl/89FwaSdBrfa6uSL66'},
    ],
    'Yashika Roy': [
      {'name': 'Himachal Pradesh Stadium, Dharamshala', 'url': 'https://maps.app.goo.gl/dcr8EH15BbHi1Aa66'},
      {'name': 'Puri, Odisha', 'url': 'https://maps.app.goo.gl/UZor34GAt4AHNZUG9'},
      {'name': 'Konark Sun Temple, Konark', 'url': 'https://maps.app.goo.gl/89FwaSdBrfa6uSL66'},
    ],
    'Parmeet Malhotra': [
      {'name': 'Himachal Pradesh Stadium, Dharamshala', 'url': 'https://maps.app.goo.gl/dcr8EH15BbHi1Aa66'},
      {'name': 'Puri, Odisha', 'url': 'https://maps.app.goo.gl/UZor34GAt4AHNZUG9'},
      {'name': 'Konark Sun Temple, Konark', 'url': 'https://maps.app.goo.gl/89FwaSdBrfa6uSL66'},
    ],
  };

  List<Map<String, String>> filteredMembers = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredMembers = members; 
  }

  Future<void> _openCurrentLocationInMaps() async {

  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  
 
  String googleMapsUrl = 'https://www.google.com/maps?q=${position.latitude},${position.longitude}';
  
  
  final Uri uri = Uri.parse(googleMapsUrl);

 
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);  
  } else {
    throw 'Could not launch $googleMapsUrl';
  }
}

  void _filterMembers(String query) {
    setState(() {
      searchQuery = query;
      filteredMembers = members
          .where((member) => member['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
      ),
      body: Center(
        child: Container(
          width: 400,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Search Member',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: _filterMembers,
              ),
              SizedBox(height: 10),
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
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.location_on, color: Colors.blue),
                              onPressed: _openCurrentLocationInMaps,
                            ),
                            IconButton(
                              icon: Icon(Icons.history, color: Colors.green),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LocationHistoryPage(
                                      memberName: member['name']!,
                                      locations: locationHistory[member['name']!] ?? [],
                                    ),
                                  ),
                                );
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
        ),
      ),
    );
  }
}

