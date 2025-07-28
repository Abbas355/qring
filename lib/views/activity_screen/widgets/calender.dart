import 'package:flutter/material.dart';
import 'package:qring/utils/constants.dart' as constants;

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  DateTime selectedDate = DateTime.now();

  List<DateTime> getCurrentWeekDates(DateTime date) {
    // Start from Monday
    final int weekday = date.weekday;
    final monday = date.subtract(Duration(days: weekday - 1));
    return List.generate(7, (index) => monday.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    final weekDates = getCurrentWeekDates(selectedDate);

    return Column(
      children: [
        // Tappable Row to open date picker
        GestureDetector(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: constants.drawerclor,
                      onPrimary: Colors.white,
                      onSurface: Colors.black,
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        foregroundColor: constants.drawerclor,
                      ),
                    ),
                  ),
                  child: child!,
                );
              },
            );

            if (pickedDate != null) {
              setState(() {
                selectedDate = pickedDate;
              });
            }
          },
          child: Row(
            children: [
              const Icon(Icons.calendar_today_outlined),
              const SizedBox(width: 8),
              Text(
                '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Weekday Labels
        Container(
          color: constants.drawerclor.withAlpha(100),
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text('Mon', style: TextStyle(fontSize: 16)),
              Text('Tue', style: TextStyle(fontSize: 16)),
              Text('Wed', style: TextStyle(fontSize: 16)),
              Text('Thu', style: TextStyle(fontSize: 16)),
              Text('Fri', style: TextStyle(fontSize: 16)),
              Text('Sat', style: TextStyle(fontSize: 16)),
              Text('Sun', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // Week Date Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: weekDates.map((date) {
            bool isSelected = date.day == selectedDate.day &&
                date.month == selectedDate.month &&
                date.year == selectedDate.year;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedDate = date;
                });
              },
              child: Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? constants.drawerclor : null,
                ),
                child: Center(
                  child: Text(
                    date.day.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
