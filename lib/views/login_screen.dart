import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get_storage/get_storage.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("خطأ", "يرجى إدخال البريد وكلمة المرور");
      return;
    }

    try {
      final response = await http.post(
        Uri.parse("https://hakibatii.000webhostapp.com/api/login"),
        body: {
          "email": email,
          "password": password,
        },
      );

      final data = json.decode(response.body);

      if (data["status"] == true) {
        final box = GetStorage();
        box.write('isLoggedIn', true); // ✅ حفظ الجلسة
        Get.offAllNamed('/home'); // ✅ انتقال إلى الصفحة الرئيسية
      } else {
        Get.snackbar("فشل", data["message"] ?? "فشل تسجيل الدخول");
      }
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ أثناء الاتصال بالخادم");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("تسجيل الدخول")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "البريد الإلكتروني"),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "كلمة المرور"),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: login,
              child: Text("دخول"),
            ),
          ],
        ),
      ),
    );
  }
}