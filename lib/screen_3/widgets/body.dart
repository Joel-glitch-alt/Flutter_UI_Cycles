import 'package:bg_vertical_stepper/bg_vertical_stepper.dart';
import 'package:flutter/material.dart';
import 'package:bg_vertical_stepper/bg_vertical_stepper.dart' as step;
import 'package:lottie/lottie.dart';

class MyBody extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  bool result = false;

  @override
  Widget build(BuildContext context) {
    List<step.Step> steps = [
      step.Step(
        shimmer: false,
        title: "Order Placed",
        iconStyle: Colors.green,
        content: Padding(
          padding: const EdgeInsets.only(left: 1.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("16/01/2025 9:53 AM Order created!!"),
          ),
        ),
      ),
      step.Step(
        shimmer: false,
        title: "Dispatch in Progress",
        iconStyle: Colors.green,
        content: Padding(
          padding: const EdgeInsets.only(left: 1.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("16/01/2025 7:50 PM Parcel Ready To Dispatch!!"),
          ),
        ),
      ),
      step.Step(
        shimmer: false,
        title: "Ready For Pickup",
        iconStyle: Colors.green,
        content: Padding(
          padding: const EdgeInsets.only(left: 1.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("17/01/2025 6:00 AM Parcel Sorted!!"),
          ),
        ),
      ),
      step.Step(
        shimmer: false,
        title: "In Transit",
        iconStyle: Colors.green,
        content: Padding(
          padding: const EdgeInsets.only(left: 1.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("17/01/2025 7:00 AM Parcel Arrived at Delivery Hub!!"),
          ),
        ),
      ),
      step.Step(
        shimmer: false,
        title: "Out For Delivery",
        iconStyle: Colors.blue,
        content: Padding(
          padding: const EdgeInsets.only(left: 1.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("Good Bye!!"),
          ),
        ),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text(
            "Tracking Number :",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 305,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "e.g #0123456789",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(width: 30),
              GestureDetector(
                onTap: () {
                  setState(() {
                    result = true;
                  });
                },
                child: Icon(Icons.search),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        result
            ? Padding(
                padding: const EdgeInsets.fromLTRB(35, 2, 31, 0),
                child: Row(
                  children: [
                    Text(
                      "Result :",
                      style: TextStyle(fontSize: 25),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          result = false;
                        });
                      },
                      child: IconButton(
                        icon: Icon(Icons.close, size: 20),
                        onPressed: () {
                          setState(() {
                            result = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox(),
        SizedBox(height: 5),
        result
            ? Padding(
                padding: const EdgeInsets.fromLTRB(15, 2, 15, 0),
                child: VerticalStepper(
                  steps: steps,
                  dashLength: 2,
                ),
              )
            : Transform(
                transform: Matrix4.translationValues(0, -15, 0),
                child: Lottie.network(
                  "https://assets2.lottiefiles.com/packages/lf20_t24tpvcu.json",
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Text(
                        "Failed to load animation",
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  },
                ),
              ),
      ],
    );
  }
}
