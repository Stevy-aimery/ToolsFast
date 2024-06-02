import 'package:flutter/material.dart';
import 'package:toolsfast/pages/started.dart';

class Profile extends StatelessWidget {
  final String profileImage = 'images/Logo.png';
  final String name = 'John Doe';
  final String email = 'john.doe@example.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                color: Color.fromRGBO(115, 60, 71, 1),
                child: Center(
                  child: Text(
                    name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 100),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(profileImage),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Name'),
            subtitle: Text(name),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: Text(email),
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Terms and Condition'),
            onTap: () {
              // Handle navigation to Terms and Condition page
            },
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete Account'),
            onTap: () {
              // Handle account deletion
            },
          ),
          
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('LogOut'),
            onTap: () {
              // Handle logout
              Navigator.push( context,MaterialPageRoute(builder: (context) => Started()));
            },
          ),
        ],
      ),
    );
  }
}
