import 'package:flutter/material.dart';
// import other page in 
import 'page_loy.dart';

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
  TextEditingController con_username = TextEditingController();
  TextEditingController con_dob = TextEditingController();
  TextEditingController con_phone_number = TextEditingController();
  bool validate_username = false;
  bool validate_dob = false;
  bool validate_phone_number = false;
  
  bool validate_data() {
    bool result = false;
    var username = con_username.text;
    var dob = con_dob.text;
    var phoneNumber = con_phone_number.text;
    if(username.isEmpty){
      setState(() {
        validate_username = true;
        result = false;
      });
    }
    else{
      setState(() {
        validate_username = false;
        result = true;
      });
    }
    if(dob.isEmpty){
      setState(() {
        validate_dob = true;
        result = false;
      });
    }
    else{
      setState(() {
        validate_dob = false;
        result = true;
      });
    }
    if(phoneNumber.isEmpty){
      setState(() {
        validate_phone_number = true;
        result = false;
      });
    }
    else{
      setState(() {
        validate_phone_number = false;
        result = true;
      });
    }
    return result;
  }

  void msg(){
    final snackbar = SnackBar(content:
    Text("Hello : " + con_username.text +
        "Date of Birth:" + con_dob.text +
        "Phone Number:" + con_phone_number.text));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sakal Samnang Form"),
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
          // _cardComponent('My Phone', 'Desc 1', '15', 'images/2.png'),
          // _cardComponent('Err Bos Nh', 'Desc 2', '100', 'images/3.png'),
          textComponent(),
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

  Widget textComponent() {
    return Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: con_username,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Fullname',
                        hintText: 'Enter Your Name',
                        errorText: validate_username ? "Input Phone Number" : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Icon(Icons.lock),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: con_dob,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Date of Birth',
                        hintText: 'Enter your date of birth here',
                        errorText: validate_dob ? "Input DOB" : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Icon(Icons.phone),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: con_phone_number,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone number',
                        hintText: 'Enter phone number',
                        errorText: validate_phone_number ? "Input Phone Number" : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              child: Text('Sign In'),
              
              onPressed: () {
                // create navigate action to other page
                validate_data() ? msg() : null;
                if (validate_data() == true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoyPage()),
                  );
                }
                // final snackbar = SnackBar(
                //     content: Text("Hello : " +
                //         con_username.text +
                //         " Your password :" +
                //         con_password.text));
                // ScaffoldMessenger.of(context).showSnackBar(snackbar);
              },
              
            )
          ],
        ));
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
}
