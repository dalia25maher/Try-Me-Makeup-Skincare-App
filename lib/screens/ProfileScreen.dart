import 'package:flutter/material.dart';
import 'home_screen.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Welcome, Dalia",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "dalia.maher@gmail.com",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            _buildProfileField("Your full name", "Dalia Maher Alqwas"),
            const SizedBox(height: 16),
            _buildProfileField("Your E-mail", "dalia.maher@gmail.com"),
            const SizedBox(height: 16),
            _buildProfileField("Your password", "***************"),
            const SizedBox(height: 16),
            _buildProfileField("Your mobile number", "01014654856"),
            const SizedBox(height: 16),
            _buildProfileField("Your Address", "6th October, street 11....."),
          ],
        ),
      ), 
       bottomNavigationBar: BottomNavigationBar(
  selectedItemColor: Colors.pink,
  unselectedItemColor: Colors.grey,
  onTap: (index) {
    if (index == 0) {
     
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else if (index == 1) {
  
    }
    
  },
  items: const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
  ],
),
    );
  }

  Widget _buildProfileField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.pink.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value, style: const TextStyle(fontSize: 14)),
              const Icon(Icons.edit, color: Colors.pink, size: 18),
            ],
          ),
        ),
      ],
    );
  }
}
