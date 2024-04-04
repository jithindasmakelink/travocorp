import 'dart:io';
import 'package:chatting/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatefulWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late String userName;
  late String userEmail;
  late String imgPathValue;

  @override
  void initState() {
    super.initState();
    userName = ''; // Initialize userName
    userEmail = ''; // Initialize userEmail
    imgPathValue = '';
    _loadImagePath();
  }

  void _loadImagePath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      imgPathValue = prefs.getString('imgPath') ?? '';
      userName = prefs.getString('userName') ?? ''; // Initialize userName
      userEmail = prefs.getString('userEmail') ?? ''; // Initialize userEmail
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(userName),
            accountEmail: Text(userEmail),
            currentAccountPicture: CircleAvatar(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: _buildAvatarImage(),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage('assets/images/coverpic.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text('Profile Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.notification_add),
            title: Text('Notifications'),
            onTap: () {
              ProfilePage();
            },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Privacy & Policy'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarImage() {
    if (imgPathValue.isNotEmpty) {
      return Image.file(
        File(imgPathValue),
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        'assets/images/stdprofile.png',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      );
    }
  }
}

class LoginScreen {}
