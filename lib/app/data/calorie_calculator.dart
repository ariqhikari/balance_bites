part of 'data.dart';

class CalorieCalculator {
  final String gender;
  final int age;
  final int height;
  final int weight;
  final int calories;
  final List<Activity> activityRecommendations;
  final List<Meal> mealRecommendations;
  final String notes;

  const CalorieCalculator({
    required this.gender,
    required this.age,
    required this.height,
    required this.weight,
    required this.calories,
    required this.activityRecommendations,
    required this.mealRecommendations,
    required this.notes,
  });

  factory CalorieCalculator.fromJson(Map<String, dynamic> data) =>
      CalorieCalculator(
        gender: data['gender'],
        age: data['age'],
        height: data['height'],
        weight: data['weight'],
        calories: data['calorie'],
        activityRecommendations: List<Activity>.from(
            data['activityRecommendations'].map((x) => Activity.fromJson(x))),
        mealRecommendations: List<Meal>.from(
            data['mealRecommendations'].map((x) => Meal.fromJson(x))),
        notes: data['notes'],
      );

  CalorieCalculator copyWith({
    String? gender,
    int? age,
    int? height,
    int? weight,
    int? calories,
    List<Activity>? activityRecommendations,
    List<Meal>? mealRecommendations,
    String? notes,
  }) =>
      CalorieCalculator(
        gender: gender ?? this.gender,
        age: age ?? this.age,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        calories: calories ?? this.calories,
        activityRecommendations:
            activityRecommendations ?? this.activityRecommendations,
        mealRecommendations: mealRecommendations ?? this.mealRecommendations,
        notes: notes ?? this.notes,
      );
}

class Activity {
  final String name;
  final String duration;

  const Activity({
    required this.name,
    required this.duration,
  });

  factory Activity.fromJson(Map<String, dynamic> data) => Activity(
        name: data['name'],
        duration: data['duration'],
      );

  Activity copyWith({
    String? name,
    String? duration,
  }) =>
      Activity(
        name: name ?? this.name,
        duration: duration ?? this.duration,
      );
}

class Meal {
  final String name;
  final int calories;

  const Meal({
    required this.name,
    required this.calories,
  });

  factory Meal.fromJson(Map<String, dynamic> data) => Meal(
        name: data['name'],
        calories: data['calories'],
      );

  Meal copyWith({
    String? name,
    int? calories,
  }) =>
      Meal(
        name: name ?? this.name,
        calories: calories ?? this.calories,
      );
}
