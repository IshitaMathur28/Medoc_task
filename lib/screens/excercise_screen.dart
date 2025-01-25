import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'activity_details_screen.dart';

class ExerciseScreen extends StatelessWidget {
  final List<charts.Series<WeekData, String>> data = [
    charts.Series<WeekData, String>(
      id: 'Calories',
      domainFn: (WeekData data, _) => data.day,
      measureFn: (WeekData data, _) => data.calories,
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      data: [
        WeekData('Mon', 150),
        WeekData('Tue', 200),
        WeekData('Wed', 100),
        WeekData('Thu', 300),
        WeekData('Fri', 250),
        WeekData('Sat', 400),
        WeekData('Sun', 350),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Steps and Calories Burned
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatCard(title: 'Total Steps', value: '10,000'),
                StatCard(title: 'Calories Burned', value: '500 kcal'),
              ],
            ),
            SizedBox(height: 16),
            // Activity Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActivityCard(
                  title: 'Cycling',
                  icon: Icons.directions_bike,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ActivityDetailsScreen(activityTitle: 'Cycling'),
                      ),
                    );
                  },
                ),
                ActivityCard(
                  title: 'Walking',
                  icon: Icons.directions_walk,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ActivityDetailsScreen(activityTitle: 'Walking'),
                      ),
                    );
                  },
                ),
                ActivityCard(
                  title: 'Meditation',
                  icon: Icons.self_improvement,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ActivityDetailsScreen(activityTitle: 'Meditation'),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            // Weekly Calories Burned Chart
            Text(
              'Calories Burned This Week',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: charts.BarChart(
                data,
                animate: true,
                domainAxis: charts.OrdinalAxisSpec(
                  renderSpec: charts.SmallTickRendererSpec(
                    labelRotation: 45,
                    labelStyle: charts.TextStyleSpec(
                      fontSize: 12,
                      color: charts.MaterialPalette.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeekData {
  final String day;
  final int calories;

  WeekData(this.day, this.calories);
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;

  const StatCard({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
              ),
              SizedBox(height: 8.0),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ActivityCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon, size: 40, color: Colors.blue),
              SizedBox(height: 8.0),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
