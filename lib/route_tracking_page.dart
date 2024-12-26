// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

// class RouteTrackingPage extends StatefulWidget {
//   final String memberName;

//   const RouteTrackingPage({super.key, required this.memberName});

//   @override
//   State<RouteTrackingPage> createState() => _RouteTrackingPageState();
// }

// class _RouteTrackingPageState extends State<RouteTrackingPage> {
//   Position? _currentPosition; 
//   String? _currentAddress;

//   Future<void> _getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     // Check if location services are enabled
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }

//     // Request location permission
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.deniedForever) {
//         return Future.error('Location permissions are permanently denied.');
//       }
//     }

//     // Fetch current position
//     final position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     setState(() {
//       _currentPosition = position;
//     });

//     // Optionally, fetch the address
//     // Using a reverse geocoding API like Google's can provide this.
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Route for ${widget.memberName}'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (_currentPosition != null)
//               Text(
//                 'Current Location:\nLatitude: ${_currentPosition!.latitude}, Longitude: ${_currentPosition!.longitude}',
//                 textAlign: TextAlign.center,
//               ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _getCurrentLocation,
//               child: const Text('Track Route'),
//             ),
//             if (_currentPosition == null)
//               const Text(
//                 'Click "Track Route" to get the current location.',
//                 textAlign: TextAlign.center,
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
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
