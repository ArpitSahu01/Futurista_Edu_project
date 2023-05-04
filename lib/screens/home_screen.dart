import 'package:flutter/material.dart';
import 'package:futurista_edu/extensions/extensions.dart';
import 'package:futurista_edu/progress_indicator.dart';
import 'package:futurista_edu/utils/utils.dart';

bool _currentTempCheck = true;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double maxTemp = 72;
  double currTemp = 35;
  @override
  Widget build(BuildContext context) {
    if(_currentTempCheck){

    }
    return Scaffold(
      body: SafeArea(child:
      SingleChildScrollView(
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
          ],
        ),
      )),
    );
  }
}


class CustomCheckBox extends StatelessWidget {

  bool check;
  String text;

  CustomCheckBox({Key? key, required this.check,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Container(
          width: 5.0.wp,
          height: 5.0.wp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1.0.wp),
            color: check ? Color(0xffFFB323) : Color(0xffEEEEEE),
          ),
        ),
        SizedBox(width: 2.0.wp,),
        Text(text,style: kPoppinsRegular.copyWith(
          color: const Color(0xff979C9E),
        ),)
      ],),
    );
  }
}

