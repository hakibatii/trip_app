import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // ✅ تهيئة التخزين المحلي
  runApp(TripApp());
}

class TripApp extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = box.read('isLoggedIn') ?? false;

    return GetMaterialApp(
      title: 'Trip App',
      debugShowCheckedModeBanner: false,
      initialRoute: isLoggedIn ? '/home' : '/login', // ✅ ننتقل حسب الجلسة
      getPages: AppRoutes.routes,
    );
  }
}