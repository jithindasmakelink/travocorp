import 'package:flutter/material.dart';

void main() {
  runApp(ProfilePage());
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile Page'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50), // Adjust the space from top as needed
              ProfileContent(),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // Action for edit profile button
                },
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Edit Profile',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 5), // Adjust the padding as needed
                    Icon(Icons.arrow_forward),
                  ],
                ),
                label: Text(''),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GroupedCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
                'assets/profile_image.jpg'), // Replace with your image path
          ),
          SizedBox(height: 20),
          Text(
            'Riya Kumari',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'RiyaKumari@gmail.com',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class GroupedCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardItem(
              title: 'Wishlist',
              icon: Icons.favorite,
              onTap: () => _navigateToNextPage(context),
            ),
            Divider(),
            CardItem(
              title: 'Orders History',
              icon: Icons.history,
              onTap: () => _navigateToNextPage(context),
            ),
            Divider(),
            CardItem(
              title: 'Wallet',
              icon: Icons.account_balance_wallet,
              onTap: () => _navigateToNextPage(context),
            ),
            Divider(),
            CardItem(
              title: 'Traveller add',
              icon: Icons.person_add,
              onTap: () => _navigateToNextPage(context),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToNextPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NextPage()),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const CardItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text('This is the next page!'),
      ),
    );
  }
}
