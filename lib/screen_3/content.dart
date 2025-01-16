import 'package:flutter/material.dart';
import 'package:my_calculator/screen_3/widgets/body.dart';
import 'package:bg_vertical_stepper/bg_vertical_stepper.dart' as step;

class ParcelTracker extends StatefulWidget {
  const ParcelTracker({Key? key}) : super(key: key);

  @override
  State<ParcelTracker> createState() => _ParcelTrackerState();
}

class _ParcelTrackerState extends State<ParcelTracker>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: content()),
    );
  }

  Widget content() {
    return Column(
      children: [
        Container(
          height: 300,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                children: [
                  Image.network(
                    "https://images.unsplash.com/photo-1606942298712-8bd250ff40f0?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8UGFyY2VsJTIwVHJhY2tlcnxlbnwwfHwwfHx8MA%3D%3D",
                    height: 220,
                  ),
                  const Text(
                    "Hello, world!",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
        ),
        MyBody(), // This is where your function is used
      ],
    );
  }
}
