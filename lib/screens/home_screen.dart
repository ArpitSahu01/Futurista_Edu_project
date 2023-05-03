import 'package:flutter/material.dart';
import 'package:futurista_edu/extensions/extensions.dart';
import 'package:futurista_edu/progress_indicator.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children:  [
            SizedBox(height: 5.0.hp,),
            Center(child: CircularIndicator(value: 48,))
          ],
        ),
      )),
    );
  }
}
