import 'package:flutter/material.dart';
import 'home_screen.dart'; 
import 'signup_screen.dart';



class LoginScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFC1E3),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                 Image.asset(
                    'assets/logo.png',
                      width: 160,   
                     height: 160,
                    ),

                  SizedBox(height: 10),
                  Text(
                    "try me",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink.shade700,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),
              Text(
                "Welcome Back To Try Me",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink.shade700,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Please sign in with your mail",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.pink.shade400,
                ),
              ),

              SizedBox(height: 30),
              Text(
                "User Name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.pink.shade700,
                ),
              ),
              SizedBox(height: 5),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "enter your name",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              SizedBox(height: 20),
              Text(
                "Password",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.pink.shade700,
                ),
              ),
              SizedBox(height: 5),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "enter your password",
                  suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  String name = nameController.text;
                  String pass = passwordController.text;

                  if (name.isNotEmpty && pass.isNotEmpty) {
                    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please fill all fields")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.pink.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
Center(
  child: TextButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignUpScreen()),
      );
    },
    child: Text(
      "Don’t have an account? Create Account",
      style: TextStyle(color: Colors.pink.shade700),
    ),
  ),
),

            ],
          ),
        ),
      ),
    );
  }
}
