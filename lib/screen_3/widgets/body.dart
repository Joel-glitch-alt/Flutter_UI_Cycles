import 'package:flutter/material.dart';
//import 'package:vertical_stepper/vertical_stepper.dart'; as Step

Widget myBody() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 50,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Text(
          "Tracking Number :",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "e.g #1234567890"),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Icon(Icons.search)
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(35, 2, 31, 0),
        child: Row(
          children: [
            Text(
              "Result :",
              style: TextStyle(fontSize: 25),
            ),
            Spacer(),
            Icon(
              Icons.close,
              size: 20,
            )
          ],
        ),
      ),
      SizedBox(
        height: 5,
      ),
      //VerticalStepper()
    ],
  );
}
