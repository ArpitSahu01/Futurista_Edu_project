import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class HomeController extends GetxController{

  final RxBool _isHomeLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  RxBool get isHomeLoading => _isHomeLoading;

  @override
  void onInit() {
    getLocation();
    super.onInit();
  }

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

    return await  Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((position) {
      _longitude.value = position.longitude;
      _latitude.value = position.latitude;
      _isHomeLoading.value = false;
    });
  }


  fetchWeatherData() async{

  }

}