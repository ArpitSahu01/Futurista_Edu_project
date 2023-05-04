import 'package:flutter/material.dart';
import 'package:futurista_edu/extensions/extensions.dart';

import '../utils/utils.dart';

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
