import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  DateTime selectedDate = DateTime(2025, 9, 18); // Default selected date

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Activity',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          OutlinedButton(
            onPressed: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
              );
              if (picked != null && picked != selectedDate) {
                setState(() {
                  selectedDate = picked;
                });
              }
            },
            child: Text(
              '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}',
              style: TextStyle(fontSize: 16),
            ),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.grey),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var day in ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'])
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDate = DateTime(selectedDate.year, selectedDate.month, selectedDate.day)
                          .add(Duration(days: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'].indexOf(day)));
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: selectedDate.weekday - 1 == ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'].indexOf(day)
                          ? Colors.blue[200]
                          : null,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      day,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}