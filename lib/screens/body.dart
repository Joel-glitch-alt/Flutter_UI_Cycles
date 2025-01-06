import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_calculator/screens/inputForm.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // Initialize controllers for the input fields
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();

  //
  double interest = 0.0;
  double total = 0.0;

  // void calculation() {
  //   final calinterestrate = (double.parse(_controller2.text) / 100 / 12) *
  //       int.parse(_controller3.text);
  //   final calinterest = calinterestrate * int.parse(_controller1.text);
  //   setState(() {
  //     interest = calinterest;
  //     total = int.parse(_controller1.text) + interest;
  //   });
  // }
  void calculation() {
    final String principalText = _controller1.text.trim();
    final String annualRateText = _controller2.text.trim();
    final String monthsText = _controller3.text.trim();

    // Validate inputs
    if (principalText.isEmpty || annualRateText.isEmpty || monthsText.isEmpty) {
      showErrorDialog("All fields must be filled in.");
      return;
    }

    final double? principal = double.tryParse(principalText);
    final double? annualRate = double.tryParse(annualRateText);
    final int? months = int.tryParse(monthsText);

    if (principal == null || annualRate == null || months == null) {
      showErrorDialog("Please enter valid numeric values.");
      return;
    }

    if (principal <= 0 || annualRate <= 0 || months <= 0) {
      showErrorDialog("Values must be greater than zero.");
      return;
    }

    // Perform calculations
    final double calinterestrate = (annualRate / 100 / 12) * months;
    final double calinterest = calinterestrate * principal;

    setState(() {
      interest = calinterest;
      total = principal + interest;
    });
  }

// Helper method to show error dialog
  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Input Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Fixed Deposit",
                      style: GoogleFonts.robotoMono(
                          fontSize: 35, color: Colors.white),
                    ),
                    Text(
                      "Calculator",
                      style: GoogleFonts.robotoMono(
                          fontSize: 35, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 40, 0),
            child: Column(
              children: [
                Inputform(
                  title: "title",
                  controller: _controller1,
                  hintText: "e.g 1000",
                ),
                Inputform(
                  title: "Annual Interest Rate %:",
                  controller: _controller2,
                  hintText: "Enter rate",
                ),
                Inputform(
                  title: "Period in Months :",
                  controller: _controller3,
                  hintText: " e.g 3",
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    //debugPrint("Testing Action");
                    calculation();
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25)),
                    child: Center(
                      child: Text(
                        "CALCULATE",
                        style: GoogleFonts.robotoMono(
                            fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Results: ",
                      style: GoogleFonts.robotoMono(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "interest: RM ${interest.toStringAsFixed(2)}",
                        style: GoogleFonts.robotoMono(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        "total: RM ${total.toStringAsFixed(2)}",
                        style: GoogleFonts.robotoMono(
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }
}
