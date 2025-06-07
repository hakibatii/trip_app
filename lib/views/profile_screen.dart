import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الملف الشخصي")),
      body: Center(
        child: Text(
          "مرحبًا بك في صفحة الملف الشخصي",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}