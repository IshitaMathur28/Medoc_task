import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ActivityDetailsScreen extends StatelessWidget {
  final String activityTitle;

  final List<charts.Series<WeekData, String>> activityData = [
    charts.Series<WeekData, String>(
      id: 'ActivityCalories',
      domainFn: (WeekData data, _) => data.day,
      measureFn: (WeekData data, _) => data.calories,
      colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      data: [
        WeekData('Mon', 120),
        WeekData('Tue', 80),
        WeekData('Wed', 100),
        WeekData('Thu', 70),
        WeekData('Fri', 200),
        WeekData('Sat', 150),
        WeekData('Sun', 180),
      ],
    ),
  ];

  ActivityDetailsScreen({required this.activityTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activityTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Target Calories
            Text(
              'Set Target Calories',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField<int>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              items: List.generate(
                10,
                (index) => DropdownMenuItem(
                  value: (index + 1) * 100,
                  child: Text('${(index + 1) * 100} kcal'),
                ),
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: 16),
            // Select Time
            Text(
              'Select Time',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              items: ['10 min', '20 min', '30 min', '40 min', '50 min']
                  .map((time) => DropdownMenuItem(value: time, child: Text(time)))
                  .toList(),
              onChanged: (value) {},
            ),
            SizedBox(height: 16),
            // Weekly Activity Chart
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
                activityData,
                animate: true,
                domainAxis: charts.OrdinalAxisSpec(
                  renderSpec: charts.SmallTickRendererSpec(
                    labelRotation: 45,
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
