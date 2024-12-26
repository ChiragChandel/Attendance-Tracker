import 'package:flutter/material.dart';
import 'package:flutter_application_1/navigation_drawer.dart' as custom; // Alias the custom import

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Application',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Application')),
      drawer: custom.NavigationDrawer(), // Use alias to refer to your custom NavigationDrawer
      body: Center(
        child: Text('Welcome to Flutter Application!'),
      ),
    );
  }
}
