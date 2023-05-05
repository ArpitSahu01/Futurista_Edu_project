import 'package:flutter/material.dart';
import 'package:futurista_edu/controllers/home_controller.dart';
import 'package:futurista_edu/extensions/extensions.dart';
import 'package:futurista_edu/models/progress_indicator.dart';
import 'package:futurista_edu/utils/utils.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/custom_check_box.dart';

bool _currentTempCheck = true;
bool _maxTempCheck = false;

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {

    String getDay(final timeStamp){
      DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
      String x = DateFormat("EEEE").format(time);
      return x;
    };

    String getDate(final timeStamp){
      DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
      String x = DateFormat("d/M/y").format(time);
      return x;
    };

    return Scaffold(
      body: SafeArea(child:
      Obx(
        ()=> controller.isHomeLoading.value ? const Center(child: CircularProgressIndicator(),) : SingleChildScrollView(
          child: Column(
            children:  [
              SizedBox(height: 5.0.hp,),
              Text("TEMPERATURE IN CELSIUS",style: kPoppinsMedium.copyWith(fontSize: 15.0.sp),),
              SizedBox(height: 5.0.hp,),
              Center(child: CircularIndicator(value: _currentTempCheck ? controller.weatherData?.currentTemp as double: controller.weatherData?.dailyWeatherData[0].maxTemp as double ,)),
              SizedBox(height: 5.0.hp,),
              Row(children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      if(!_currentTempCheck){
                        _currentTempCheck = !_currentTempCheck;
                        _maxTempCheck = !_maxTempCheck;
                      }
                    });
                  },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomCheckBox(check: _currentTempCheck,text: "CURRENT TEMPERATURE"),
                    ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      //fix error to toggle when clicked

                      if(!_maxTempCheck){
                        _currentTempCheck = !_currentTempCheck;
                        _maxTempCheck = !_maxTempCheck;
                      }
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomCheckBox(check: !_currentTempCheck,text: "MAXIMUM TEMP",),
                  ),
                ),
              ],
              ),
              SizedBox(height: 5.0.hp,),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (ctx,index){
                return WeatherInfo(
                  day: getDay(controller.weatherData!.dailyWeatherData[index+1].time),
                  date: getDate(controller.weatherData!.dailyWeatherData[index+1].time),
                  maxTemp: "${controller.weatherData!.dailyWeatherData[index+1].maxTemp.toInt()}",
                  minTemp: "${controller.weatherData!.dailyWeatherData[index+1].maxTemp.toInt()}°C",
                );
              },itemCount: 5,
              )
            ],
          ),
        ),
      )),
    );
  }
}


class WeatherInfo extends StatelessWidget {
  final String day;
  final String date;
  final String maxTemp;
  final String minTemp;
  const WeatherInfo({
    Key? key,
    required this.day,
    required this.date,
    required this.maxTemp,
    required this.minTemp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.0.hp),
      child: Padding(
        padding:  EdgeInsets.only(left: 2.0.wp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          SizedBox(
            width: 24.0.wp,
            child: Text(
              day,
              style: kPoppinsRegular.copyWith(
                fontSize: 12.0.sp,
              color: const Color(0xff979C9E),
            ),
            ),
          ),
            SizedBox(
              width: 24.0.wp,
              child: Text(
                date,
                style: kPoppinsRegular.copyWith(
                  fontSize: 12.0.sp,
                  color: const Color(0xff979C9E),
                ),
              ),
            ),
            SizedBox(
              width: 24.0.wp,
              child: Text(
                "$maxTemp/$minTemp",
                style: kPoppinsRegular.copyWith(
                  fontSize: 12.0.sp,
                  color: const Color(0xff979C9E),
                ),
              ),
            ),
        ],),
      ),
    );
  }
}

