import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. AppBar
      appBar: AppBar(
        title: Text("My Profile Screen"),
        centerTitle: true,
      ),

      // 8. FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("FAB Clicked");
        },
        child: Icon(Icons.add),
      ),

      // 2. Body layout
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // 3. Image widget
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/300",
              ),
            ),

            SizedBox(height: 20),

            // 4. Text widget
            Text(
              "Welcome to Flutter",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            // 5. Icon widget
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 30,
            ),

            SizedBox(height: 30),

            // 6. Email TextField
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),

            SizedBox(height: 15),

            // Password TextField
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),

            SizedBox(height: 20),

            // 7. Button (Submit)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print("Email: ${emailController.text}");
                  print("Password: ${passwordController.text}");
                },
                child: Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}