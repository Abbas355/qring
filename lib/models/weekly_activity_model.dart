class WeeklyActivityModel {
  final double avgDistance;
  final double avgSleep;
  final int restingHR;
  final int goalRate;

  WeeklyActivityModel({
    required this.avgDistance,
    required this.avgSleep,
    required this.restingHR,
    required this.goalRate,
  });

  factory WeeklyActivityModel.empty() => WeeklyActivityModel(
    avgDistance: 0.0,
    avgSleep: 0.0,
    restingHR: 0,
    goalRate: 0,
  );
}