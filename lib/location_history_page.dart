import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationHistoryPage extends StatelessWidget {
  final String memberName;
  final List<Map<String, String>> locations;

  const LocationHistoryPage({
    required this.memberName,
    required this.locations,
    Key? key,
  }) : super(key: key);

  Future<void> _openMap(String url) async {
    final Uri uri = Uri.parse(url); // Convert the URL string to a Uri object
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // Opens the link in an external browser
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location History'),
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
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$memberName\'s Location History',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10), // Add some spacing between the heading and the list
              Expanded(
                child: ListView.builder(
                  itemCount: locations.length,
                  itemBuilder: (context, index) {
                    final location = locations[index];
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: ListTile(
                        title: Text(location['name']!),
                        trailing: Icon(Icons.map, color: Colors.blue),
                        onTap: () => _openMap(location['url']!),
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
