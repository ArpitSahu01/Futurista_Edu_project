class DailyWeatherData {

  double minTemp;
  double maxTemp;

  DailyWeatherData({
    required this.minTemp,
    required this .maxTemp,
  });

  factory DailyWeatherData.fromJson(Map<String, dynamic> json) {
    return DailyWeatherData(
    maxTemp: json["temp"]["max"],
    minTemp: json["temp"]["min"],
  );}

}
