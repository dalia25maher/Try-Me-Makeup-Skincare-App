import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFC1E3),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),

              Column(
                children:  [
                   Image.asset(
                    'assets/logo.png', 
                      width: 160,        
                     height: 160,
                    ),
                  SizedBox(height: 12),
                  Text(
                    "Try Me",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Full Name",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.pink,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                decoration: InputDecoration(
                  hintText: "enter your full name",
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Mobile Number",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.pink,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "enter your mobile no.",
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "E-mail address",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.pink,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "enter your email address",
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.pink,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "enter your password",
                  suffixIcon: Icon(Icons.visibility_off),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
             const SizedBox(height: 30),
SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    onPressed: () {
   //طبعا ي استاذه داليا ي قموره احنا سايبين تعديل د للداتا بيز (اتمنى تفتكري)
 
      Navigator.pop(context); 
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Account Created! Please Login")),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: Colors.pink,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    child: const Text(
      "Sign up",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),

const SizedBox(height: 20),

TextButton(
  onPressed: () {
    Navigator.pop(context); // يرجع للشاشة السابقة (LoginScreen)
  },
  child: const Text(
    "Already have an account? Login",
    style: TextStyle(color: Colors.white, fontSize: 16),
  ),
),

            ],
          ),
        ),
      ),
    );
  }
}
