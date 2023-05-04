import 'package:flutter/material.dart';
import 'package:futurista_edu/controllers/home_controller.dart';
import 'package:futurista_edu/extensions/extensions.dart';
import 'package:futurista_edu/models/progress_indicator.dart';
import 'package:futurista_edu/utils/utils.dart';
import 'package:get/get.dart';

import '../models/custom_check_box.dart';

bool _currentTempCheck = true;

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());
  double maxTemp = 72;
  double currTemp = 35;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(child:
      Obx(
        ()=> controller.isHomeLoading.value ? const Center(child: CircularProgressIndicator(),) : SingleChildScrollView(
          child: Column(
            children:  [
              SizedBox(height: 5.0.hp,),
              Text("TEMPERATURE IN CELSIUS",style: kPoppinsMedium.copyWith(fontSize: 15.0.sp),),
              SizedBox(height: 5.0.hp,),
              Center(child: CircularIndicator(value: _currentTempCheck ? currTemp : maxTemp ,)),
              SizedBox(height: 5.0.hp,),
              Row(children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      _currentTempCheck = !_currentTempCheck;
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
                      _currentTempCheck = !_currentTempCheck;
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
                shrinkWrap: true,
                itemBuilder: (ctx,index){
                return WeatherInfo(day: "THURSDAY",date: "20/04/2023",maxTemp: "40°C",minTemp: "20°C",);
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        Text(
          day,
          style: kPoppinsRegular.copyWith(
            fontSize: 12.0.sp,
          color: const Color(0xff979C9E),
        ),
        ),
          Text(
            date,
            style: kPoppinsRegular.copyWith(
              fontSize: 12.0.sp,
              color: const Color(0xff979C9E),
            ),
          ),
          Text(
            "$maxTemp/$minTemp",
            style: kPoppinsRegular.copyWith(
              fontSize: 12.0.sp,
              color: const Color(0xff979C9E),
            ),
          ),
      ],),
    );
  }
}

