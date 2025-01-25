import 'package:flutter/material.dart';

class VitalsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vitals Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Group Bubble
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Icon(Icons.directions_walk, size: 50, color: Colors.green),
                    SizedBox(height: 8.0),
                    Text(
                      'Steps: 569/2000',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Calories: 1024/2000',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Food Calories: 2048 kcal',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            // BP, Heart Rate, SpO2, Stress Level Grid
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                InfoCard(
                  title: 'Blood Pressure',
                  value: '120/80 mmHg',
                  icon: Icons.monitor_heart,
                ),
                InfoCard(
                  title: 'Heart Rate',
                  value: '72 bpm',
                  icon: Icons.favorite,
                ),
                InfoCard(
                  title: 'SpO2',
                  value: '98%',
                  icon: Icons.bloodtype,
                ),
                InfoCard(
                  title: 'Stress Level',
                  value: 'Relaxed',
                  icon: Icons.self_improvement,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const InfoCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            Text(
              value,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
