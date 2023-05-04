class DailyWeatherData {

  double minTemp;
  double maxTemp;
  int time;

  DailyWeatherData({
    required this.minTemp,
    required this .maxTemp,
    required this.time
  });

  factory DailyWeatherData.fromJson(Map<String, dynamic> json) {
    return DailyWeatherData(
    maxTemp: json["temp"]["max"],
    minTemp: json["temp"]["min"],
    time: json["dt"],
  );}

}
