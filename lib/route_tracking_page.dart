import 'package:flutter/material.dart';
import 'map_page.dart';

class RouteTrackingPage extends StatelessWidget {
  final String memberName;

  const RouteTrackingPage({required this.memberName, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route Tracking: $memberName'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MapPage()),
            );
          },
          child: const Text('Track Route'),
        ),
      ),
    );
  }
}
