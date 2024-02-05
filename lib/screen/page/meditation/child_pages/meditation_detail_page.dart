import 'package:flutter/material.dart';


class SerenityStretchScreen extends StatelessWidget {
  const SerenityStretchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('9:41'),
        actions: const [
          Icon(Icons.signal_cellular_alt),
          Icon(Icons.wifi),
          Icon(Icons.battery_full),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Serenity Stretch',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Card(
            child: Column(
              children: [
                Image.asset(
                    'assets/yoga.png'), // Replace with actual image asset
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'A course designed to introduce beginners to the calming effects of yoga. It includes simple stretching exercises, basic asanas, and relaxation techniques to relieve stress.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  leading: Icon(Icons.check_circle_outline),
                  title: Text('Welcome to Wellness'),
                  subtitle: Text(
                      'Begin your journey with an introduction to the basic principles of yoga, understanding the importance of breath and gentle movement to establish a foundation for wellness.'),
                ),
                ListTile(
                  leading: Icon(Icons.check_circle_outline),
                  title: Text('Breathing for Serenity'),
                  subtitle: Text(
                      'Learn the art of deep yogic breathing to calm the mind and soothe the nervous system, preparing you for a more serene state of being.'),
                ),
                // More list tiles can be added here
              ],
            ),
          ),
        ],
      ),
    );
  }
}
