import 'package:flutter/material.dart';

class TrailDetailsScreen extends StatelessWidget {
  final String trailName;
  final String difficultyLevel;
  final double distance;
  final String elevationProfile;
  final List<String> trailPhotos;

  const TrailDetailsScreen({super.key, 
    required this.trailName,
    required this.difficultyLevel,
    required this.distance,
    required this.elevationProfile,
    required this.trailPhotos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trail Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                trailName,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text('Difficulty: $difficultyLevel'),
              const SizedBox(height: 8),
              Text('Distance: $distance km'),
              const SizedBox(height: 8),
              Text('Elevation Profile: $elevationProfile'),
              const SizedBox(height: 16),
              const Text(
                'Trail Photos:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              // Image.asset('Assets/6.jpg'),
              // Image.asset('Assets/1.jpg'),
              // Image.asset('Assets/3.jpg'),
              // Image.asset('Assets/4.jpg'),
              // Image.asset('Assets/5.jpg'),
              // Image.asset('Assets/7.jpg'),
              const SizedBox(height: 8),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: trailPhotos.length,
                itemBuilder: (context, index) {
                  return Image.asset(trailPhotos[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
