import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './controllers/global_stuff_controller.dart';
import './home.dart';
import './marketplace.dart';
import './myprofile.dart';

import './registration_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './recommendation_page.dart';

void main() {
  runApp(MyApp());
}

Future<bool> getData() async {
  final prefs = await SharedPreferences.getInstance();

  if (prefs.getString("contact") != null &&
      prefs.getString("contact")?.length == 10) {
    print(prefs.getString("contact"));
    return true;
  }
  return false;
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalStuffController globalStuffController =
      Get.put(GlobalStuffController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Organimate',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      routes: {
        '/': (context) => FutureBuilder(
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  // If we got an error
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        '${snapshot.error} occurred',
                        style: const TextStyle(fontSize: 18),
                      ),
                    );

                    // if we got our data
                  } else if (snapshot.hasData) {
                    // Extracting data from snapshot object
                    final data = snapshot.data as bool;
                    if (data) {
                      return const Home();
                    } else {
                      return const RegistrationPagePage();
                    }
                  }
                }
                return const SizedBox();
              }),
              future: getData(),
            ),
        '/recommendation': (context) => const RecommendationPage(),
        '/home': (context) => const Home(),
        '/profile': (context) => const MyProfile(),
        '/marketplace': (context) => const MarketPlace(),
      },
    );
  }
}
