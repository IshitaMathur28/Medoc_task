import 'package:flutter/material.dart';

class MealScreen extends StatefulWidget {
  final String mealType;

  const MealScreen({required this.mealType});

  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  final TextEditingController _foodController = TextEditingController();
  final List<String> _addedMeals = [];
  int _selectedQuantity = 1;

  void _addMeal() {
    final String food = _foodController.text.trim();
    if (food.isNotEmpty) {
      setState(() {
        _addedMeals.add('$food - $_selectedQuantity servings');
      });
      _foodController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${_addedMeals.length} meals added!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mealType),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Search Bar
            TextField(
              controller: _foodController,
              decoration: InputDecoration(
                hintText: 'Search for food...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Dropdown for Quantity
            Text(
              'Select Quantity',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField<int>(
              value: _selectedQuantity,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              items: List.generate(
                10,
                (index) => DropdownMenuItem(
                  value: index + 1,
                  child: Text('${index + 1} servings'),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _selectedQuantity = value ?? 1;
                });
              },
            ),
            SizedBox(height: 16),
            // Add Button
            ElevatedButton(
              onPressed: _addMeal,
              child: Text('Add Meal'),
            ),
            SizedBox(height: 16),
            // Meal List
            Expanded(
              child: _addedMeals.isEmpty
                  ? Center(
                      child: Text(
                        'No meals added yet.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _addedMeals.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 4.0,
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            title: Text(_addedMeals[index]),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
