
import 'package:flutter/material.dart';
import 'product_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoggedIn = false;

  void _login() {
    bool isAuthenticated = true; 

    if (isAuthenticated) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ProductPage(logoutCallback: _logout)),
      );
    }
  }

  void _logout() {
    setState(() {
      isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double containerHeight = screenHeight / 2;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 170, 181),
      body: Stack(
        children: [
          // Background Gambar
          Positioned.fill(
            child: Image.asset(
              'assets/butterfly.png', 
              fit: BoxFit.cover, 
            ),
          ),

          Center(
            child: Container(
              constraints:
                  BoxConstraints(maxWidth: 350.0), 
              height:
                  containerHeight, // Set tinggi Container menjadi setengah tinggi layar
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 179, 111, 124), // Warna kotak
                borderRadius:
                    BorderRadius.circular(8.0), 
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/userpict.png', 
                    height: 75.0,
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: UnderlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white, 
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: UnderlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,) 
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      _login();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: isLoggedIn
                          ? Color.fromARGB(255, 250, 246, 248) // warna tombol login setelah diklik
                          : Color.fromARGB(255, 58, 56, 57), //warna tombol login
                    ),
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
