import 'package:futurista_edu/models/daily_weather_data.dart';

class WeatherData {

  List<DailyWeatherData> dailyWeatherData;
  double currentTemp;

  WeatherData({required this.currentTemp, required this.dailyWeatherData});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      currentTemp: json["current"]["temp"],
      dailyWeatherData: (json["daily"] as List<Map<String,dynamic>>).map((json) => DailyWeatherData.fromJson(json)).toList(),
    );
  }
}
