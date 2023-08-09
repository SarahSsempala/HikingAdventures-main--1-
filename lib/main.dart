import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helloworld/login_page.dart';
// import 'package:firebase_options.dart';
import 'package:helloworld/homepage.dart';
import 'package:helloworld/TrailDetailsScreen.dart';
import 'package:helloworld/FamilyFriendlyTrailSelectionScreen.dart';
import 'package:helloworld/GroupHikingExpeditionPlanningScreen.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  )); // this is to remove the status bar at the top of the screen
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hiking Adventures',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const LoginPage(),
      routes: {
        '/trailDetails': (context) => const TrailDetailsScreen(
              trailName: 'Create Trail',
              difficultyLevel: 'Moderate',
              distance: 10.5,
              elevationProfile: 'Some ups and downs',
              trailPhotos: [
                'Assets/1.jpg',
                'Assets/1.jpg',
                'Assets/1.jpg',
                'Assets/1.jpg',
                'Assets/1.jpg',
                'Assets/1.jpg',
                'Assets/1.jpg',
                'Assets/1.jpg',
              ],
            ),
        '/familyFriendlyTrails': (context) =>
            FamilyFriendlyTrailSelectionScreen(
              familyFriendlyTrails: dummyFamilyFriendlyTrails,
            ),
        '/groupHikingExpedition': (context) =>
            GroupHikingExpeditionPlanningScreen(
              trailName: 'Create Trail for Group',
              dateTime: DateTime.now(),
              maxParticipants: 10,
            ),
        '/photography': (context) => FamilyFriendlyTrailSelectionScreen(
              familyFriendlyTrails: dummyPhotography,
            ),
      },
    );
  }
}
