import 'package:futurista_edu/api/api_key.dart';
import 'package:futurista_edu/models/weather_data.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeController extends GetxController{

  final RxBool _isHomeLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  WeatherData? _weatherData;
  RxBool get isHomeLoading => _isHomeLoading;

  @override
  void onInit() {
    getLocation();
    super.onInit();
  }

  // fetching current location of device and updating values of longitude and latitude
  getLocation() async{

    LocationPermission permission;
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if(!serviceEnabled){
      return Future.error("Location services are disabled");
    }

    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.deniedForever){
      return Future.error("Location Permissions are permanently denied");
    }

    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error("Location Permissions are denied");
      }
    }

    return await  Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((position) async{
      _longitude.value = position.longitude;
      _latitude.value = position.latitude;
      await fetchWeatherData();
      if(_weatherData !=null){
        print(_weatherData!.currentTemp);
        _isHomeLoading.value = false;
      }else{
        Future.error("Data not fetched");
      }
    });
  }


  // calling weather api to get weather data
  fetchWeatherData() async{
  final url = Uri.parse("https://api.openweathermap.org/data/3.0/onecall?lat=25.2643568&lon=82.9846923&exclude=minutely,hourly&appid=$API_KEY&units=metric");
  final response = await http.get(url);
  final responseData = jsonDecode(response.body);
  print(responseData);
  _weatherData = WeatherData.fromJson(responseData);
  }

}