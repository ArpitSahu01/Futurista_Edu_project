import 'package:flutter/material.dart';
import 'package:futurista_edu/controllers/home_controller.dart';
import 'package:get/get.dart';


class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async{
          final controller = Get.put(HomeController());
          controller.getLocation();
        },
        child: ListView(
          shrinkWrap: true,
          children: [
            Stack(
            children: [
              SizedBox(
                height: Get.height,
                  child: Image.asset("assets/error_screen.png",fit: BoxFit.cover,)
              ),
            ],
          ),],
        ),
      ),
    );
  }
}
