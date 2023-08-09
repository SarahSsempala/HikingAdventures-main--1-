import 'package:flutter/material.dart';
import 'package:helloworld/TrailDetailsScreen.dart';

class FamilyFriendlyTrailSelectionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> familyFriendlyTrails;

  const FamilyFriendlyTrailSelectionScreen(
      {super.key, required this.familyFriendlyTrails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family-Friendly Trails'),
      ),
      body: ListView.builder(
        itemCount: familyFriendlyTrails.length,
        itemBuilder: (context, index) {
          final trail = familyFriendlyTrails[index];
          return ListTile(
            title: Text(trail['name']),
            subtitle: Text(trail['description']),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to the Trail Details Screen passing trail details.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrailDetailsScreen(
                    trailName: trail['name'],
                    difficultyLevel: trail['difficulty'],
                    distance: trail['distance'],
                    elevationProfile: trail['elevation'],
                    trailPhotos: trail['photos'],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BadgeIconButton(
            icon: const Icon(Icons.book),
            text: 'Booking',
            onPressed: () {
              // Handle the booking button press.
              // Add your booking logic here.
            },
          ),
        ],
      ),
    );
  }
}

class BadgeIconButton extends StatelessWidget {
  final Icon icon;
  final String text;
  final int badgeValue;
  final VoidCallback onPressed;

  const BadgeIconButton(
      {super.key,
      required this.icon,
      required this.text,
      this.badgeValue = 0,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ElevatedButton.icon(
          onPressed: onPressed,
          icon: icon,
          label: Text(text),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
        if (badgeValue > 0)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                badgeValue.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}
