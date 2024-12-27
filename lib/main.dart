import 'package:flutter/material.dart';
import 'user_details_page.dart'; 
import 'navigation_drawer.dart' as custom; 

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

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  final List<Map<String, String>> members = [
    {'name': 'Aditya Birla', 'id': 'WSL0003', 'profileImage': 'assets/aditya.png'},
    {'name': 'Arav Sharma', 'id': 'WSL0034', 'profileImage': 'assets/arav.png'},
    {'name': 'Ridhima Gaur', 'id': 'WSL0054', 'profileImage': 'assets/ridhima.png'},
    {'name': 'Ray Kapoor', 'id': 'WSL0654', 'profileImage': 'assets/ray.png'},
    {'name': 'Anjum Seth', 'id': 'WSL0087', 'profileImage': 'assets/anjum.png'},
    {'name': 'Ritika Gulati', 'id': 'WSL0074', 'profileImage': 'assets/ritika.png'},
    {'name': 'Nidhi Arora', 'id': 'WSL0063', 'profileImage': 'assets/nidhi.png'},
    {'name': 'Nikhil Yadav', 'id': 'WSL0014', 'profileImage': 'assets/nikhil.png'},
    {'name': 'Devinder Singh', 'id': 'WSL0058', 'profileImage': 'assets/devinder.png'},
    {'name': 'Krish Dubey', 'id': 'WSL0026', 'profileImage': 'assets/krish.png'},
    {'name': 'Mritunjay Pathak', 'id': 'WSL0078', 'profileImage': 'assets/mritunjay.png'},
    {'name': 'Kavish Goud', 'id': 'WSL0022', 'profileImage': 'assets/kavish.png'},
    {'name': 'Yashika Roy', 'id': 'WSL0041', 'profileImage': 'assets/yashika.png'},
    {'name': 'Parmeet Malhotra', 'id': 'WSL0038', 'profileImage': 'assets/parmeet.png'},
  ];

  List<Map<String, String>> filteredMembers = [];

  @override
  void initState() {
    super.initState();
    
    filteredMembers = members;
  }

  void filterSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredMembers = members;
      } else {
        filteredMembers = members
            .where((member) =>
                member['name']!.toLowerCase().contains(query.toLowerCase()) ||
                member['id']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Attendance Tracker')),
      drawer: custom.NavigationDrawer(), 
      body: Row(
        children: [
          
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/landing.png',
                height: 400, 
                fit: BoxFit.contain, 
              ),
            ),
          ),

          
          Expanded(
            child: Center(
              child: Container(
                width: 500, 
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
                  children: [
                    
                    TextField(
                      onChanged: filterSearch,
                      decoration: InputDecoration(
                        hintText: 'Search by name or ID...',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    
                    Center(
                      child: Text(
                        'Attendance List',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
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
                                backgroundImage: AssetImage(member['profileImage']!), 
                                radius: 25,
                              ),
                              title: Text(
                                '${member['name']} (${member['id']})',
                                style: TextStyle(fontSize: 16),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
                              onTap: () {
                               
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UserDetailsPage(member: member),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



