import 'package:get/get.dart';
import '../views/splash_screen.dart';
import '../views/login_screen.dart';
import '../views/home_screen.dart';
import '../views/trip_details_screen.dart';
import '../views/map_screen.dart';
import '../views/profile_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/splash', page: () => SplashScreen()),
    GetPage(name: '/login', page: () => LoginScreen()),
    GetPage(name: '/home', page: () => HomeScreen()),
    GetPage(name: '/trip-details', page: () => TripDetailsScreen()),
    GetPage(name: '/map', page: () => MapScreen()),
    GetPage(name: '/profile', page: () => ProfileScreen()),
  ];
}