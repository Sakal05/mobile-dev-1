import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MainPage(),
    ),
  );
}

class MainPage extends StatefulWidget {
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mony Ho"),
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(
                        'images/1.png'), // Replace with the path to your profile picture
                  ),
                  // SizedBox(height: 20),
                  Text(
                    "Sakal Samnang",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "sakal@example.com", // Replace with your email
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            _buildRow('Inbox', Icons.inbox),
            _buildRow('Primary', Icons.mail),
            _buildRow('Social', Icons.people),
            _buildRow('Promotions', Icons.tag_faces),
          ],
        ),
      ),
      body: ListView(
        children: [
          _cardComponent('My Phone', 'Desc 1', '15', 'images/2.png'),
          _cardComponent('Err Bos Nh', 'Desc 2', '100', 'images/3.png'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10, //Shadow
        child: const Icon(Icons.add),
        onPressed: () {
          print("I am clicked!");
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.greenAccent,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                label: 'Favorites', icon: Icon(Icons.favorite)),
            BottomNavigationBarItem(
                label: 'Music', icon: Icon(Icons.music_note)),
            BottomNavigationBarItem(
                label: 'Places', icon: Icon(Icons.location_on)),
            BottomNavigationBarItem(
                label: 'News', icon: Icon(Icons.library_books)),
          ],
          onTap: (int itemIndex) {
            setState(() {
              _currentIndex = itemIndex;
            });
          }),
    );
  }

  Widget _buildRow(String title, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Icon( 
              iconData,
              size: 30,
              color: Colors.green, // Replace with your desired color
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardComponent(
      String title, String subtitle, String description, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.green,
              spreadRadius: 1,
              blurRadius: 0,
              offset: const Offset(0, 1),
            ),
          ],
          border: Border.all(color: Colors.grey),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imagePath),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    '\$ $description',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
