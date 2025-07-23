class HealthData {
  final String date;
  final int steps;
  final double distance;
  final int heartRate;
  final double sleep;
  final bool hasRing;

  HealthData({
    required this.date,
    required this.steps,
    required this.distance,
    required this.heartRate,
    required this.sleep,
    this.hasRing = false,
  });

  factory HealthData.empty() => HealthData(
    date: '',
    steps: 0,
    distance: 0.0,
    heartRate: 0,
    sleep: 0.0,
  );
}