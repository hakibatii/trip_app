import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatelessWidget {
  Future<List<dynamic>> fetchTrips() async {
    final response = await http.get(
      Uri.parse('https://hakibatii.000webhostapp.com/api/trips'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['trips'] ?? [];
    } else {
      throw Exception('فشل في تحميل الرحلات');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الرحلات")),
      body: FutureBuilder<List<dynamic>>(
        future: fetchTrips(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("حدث خطأ في جلب البيانات"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("لا توجد رحلات متاحة"));
          }

          final trips = snapshot.data!;

          return ListView.builder(
            itemCount: trips.length,
            itemBuilder: (context, index) {
              final trip = trips[index];
              return Card(
                child: ListTile(
                  leading: trip['image'] != null
                      ? Image.network(trip['image'], width: 80, height: 80, fit: BoxFit.cover)
                      : null,
                  title: Text(trip['title'] ?? 'بدون عنوان'),
                  onTap: () {
                    Get.toNamed('/trip-details', arguments: trip);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}