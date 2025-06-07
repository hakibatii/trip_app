import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TripDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> trip = Get.arguments ?? {
    'title': 'عنوان الرحلة',
    'description': 'وصف تفصيلي عن الرحلة...',
    'image':
        'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?fit=crop&w=800&q=80',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(trip['title'])),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              trip['image'],
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                trip['description'],
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // فتح شاشة الخريطة
                Get.toNamed('/map');
              },
              child: Text("عرض على الخريطة"),
            ),
          ],
        ),
      ),
    );
  }
}