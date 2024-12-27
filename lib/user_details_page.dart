import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  final Map<String, String> member;

  
  const UserDetailsPage({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${member['name']}\'s Profile'),
      ),
      body: Center(
        child: Container(
          width: 350,
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
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
            mainAxisSize: MainAxisSize.min,
            children: [
              
              CircleAvatar(
                backgroundImage: AssetImage(member['profileImage']!),
                radius: 60,
              ),
              SizedBox(height: 20),

              
              Text(
                'Name: ${member['name']}',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),

              
              Text(
                'ID: ${member['id']}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),

              
              Text(
                'Address: 123, Elm Street, Springfield',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
