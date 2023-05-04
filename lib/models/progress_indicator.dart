import 'package:flutter/material.dart';
import 'package:futurista_edu/extensions/extensions.dart';
import 'package:futurista_edu/utils/utils.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:get/get.dart';

class CircularIndicator extends StatefulWidget {
  double value;
  CircularIndicator({Key? key,required this.value}) : super(key: key);

  @override
  State<CircularIndicator> createState() => _CircularIndicatorState();
}

class _CircularIndicatorState extends State<CircularIndicator> {
  @override
  Widget build(BuildContext context) {
    return  SleekCircularSlider(
      initialValue: widget.value,
      max: 100,
      min: 0,
      appearance:  CircularSliderAppearance(
        infoProperties: InfoProperties(
          modifier: (percentage) => "${percentage.toInt()}°C",
          mainLabelStyle: kPoppinsMedium.copyWith(
              fontSize: 20.0.sp,
              color: const Color(0xff979C9E)
          ),
        ),
          angleRange: 360,
          startAngle: 0,
          size: Get.width * 0.4,
          customWidths: CustomSliderWidths(
              trackWidth: 20,
              progressBarWidth: 20,
              shadowWidth: 0,
              handlerSize: 0
          ),
          customColors: CustomSliderColors(
            hideShadow: true,
            gradientStartAngle: 0,
            trackColor: const Color(0xffEEEEEE),
            progressBarColors: [
              const Color(0xffFFC837),
              const Color(0xffFF8008),
            ],
          )
      ),
    );
  }
}
