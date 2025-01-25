import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class WomensHealthScreen extends StatefulWidget {
  @override
  _WomensHealthScreenState createState() => _WomensHealthScreenState();
}

class _WomensHealthScreenState extends State<WomensHealthScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  bool showLogOptions = false;
  String? selectedLogOption;
  DateTime? periodStartDate;
  String? selectedFlow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Women\'s Health'),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Calendar
            Container(
              margin: EdgeInsets.all(16.0),
              child: TableCalendar(
                focusedDay: _focusedDay,
                firstDay: DateTime.utc(2020, 01, 01),
                lastDay: DateTime.utc(2025, 12, 31),
                rowHeight: 40,
                calendarFormat: CalendarFormat.week,
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                    showLogOptions = false;
                    selectedLogOption = null;
                    periodStartDate = null;
                    selectedFlow = null;
                  });
                },
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.pink,
                    shape: BoxShape.circle,
                  ),
                  defaultTextStyle: TextStyle(color: Colors.grey[700]),
                  weekendTextStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),

            // Cycle Day Indicator
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.pink,
              ),
              child: Text(
                'Day 4', // Replace with actual cycle day
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Log for Today Button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showLogOptions = true;
                });
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.pink,
              ),
              child: Text('Log for Today'),
            ),

            if (showLogOptions)
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Period',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              _showPeriodPhaseDialog();
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Colors.pink,
                            ),
                            child: Text(
                              periodStartDate != null
                                  ? '${periodStartDate!.month}/${periodStartDate!.day}/${periodStartDate!.year}'
                                  : 'Start Date',
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _showFlowDialog,
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Colors.pink,
                            ),
                            child: Text(
                              selectedFlow ?? 'Flow',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _showPeriodPhaseDialog() async {
    DateTime? startDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime.now(),
    );
    if (startDate != null) {
      setState(() {
        periodStartDate = startDate;
      });
    }
  }

  void _showFlowDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Flow'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('No Flow'),
                onTap: () {
                  setState(() {
                    selectedFlow = 'No Flow';
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('Light Flow'),
                onTap: () {
                  setState(() {
                    selectedFlow = 'Light Flow';
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('Medium Flow'),
                onTap: () {
                  setState(() {
                    selectedFlow = 'Medium Flow';
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('Heavy Flow'),
                onTap: () {
                  setState(() {
                    selectedFlow = 'Heavy Flow';
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}