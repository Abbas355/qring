import '../models/activity_model.dart';
import '../models/today_summary_model.dart';
import '../models/weekly_activity_model.dart';

class HealthController {
  TodaySummaryModel _todaySummary = TodaySummaryModel.empty();
  ActivityModel _activity = ActivityModel.empty();
  WeeklyActivityModel _weeklyActivity = WeeklyActivityModel.empty();

  TodaySummaryModel get todaySummary => _todaySummary;
  ActivityModel get activity => _activity;
  WeeklyActivityModel get weeklyActivity => _weeklyActivity;

  void fetchTodaySummary() {
    try {
      _todaySummary = TodaySummaryModel(
        date: DateTime.now().toString(), // Will be formatted in view
        steps: 8432,
        water: 1.2,
        calories: 420,
      );
    } catch (e) {
      _todaySummary = TodaySummaryModel.empty();
    }
  }

  void fetchActivity() {
    try {
      _activity = ActivityModel(
        steps: 8432,
        sleep: 6.5,
        heartRate: 72,
        distance: 1.2,
        hasRing: true,
      );
    } catch (e) {
      _activity = ActivityModel.empty();
    }
  }

  void fetchWeeklyActivity() {
    try {
      _weeklyActivity = WeeklyActivityModel(
        avgDistance: 6.2,
        avgSleep: 7.5,
        restingHR: 72,
        goalRate: 94,
      );
    } catch (e) {
      _weeklyActivity = WeeklyActivityModel.empty();
    }
  }
} 