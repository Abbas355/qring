class TodaySummaryModel {
  final String date;
  final int steps;
  final double water;
  final int calories;

  TodaySummaryModel({
    required this.date,
    required this.steps,
    required this.water,
    required this.calories,
  });

  factory TodaySummaryModel.empty() => TodaySummaryModel(
    date: '',
    steps: 0,
    water: 0.0,
    calories: 0,
  );
}