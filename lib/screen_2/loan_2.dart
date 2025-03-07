import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loan extends StatefulWidget {
  const Loan({super.key});

  @override
  State<Loan> createState() => _LoanState();
}

class _LoanState extends State<Loan> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  String selected = ""; // Default loan period
  late double totalInterest;
  late double monthlyInterest;
  late double monthlyInstallment;

  void loancalculation() {
    final amount = int.parse(_controller1.text) - int.parse(_controller2.text);
    final tinterest =
        amount * (double.parse(_controller3.text) / 100) * int.parse(selected);
    final minstall = (amount + tinterest) / (int.parse(selected) * 12);

    setState(() {
      totalInterest = tinterest;
      monthlyInstallment = minstall;
      monthlyInterest =
          tinterest / (int.parse(selected) * 12); // Calculate monthly interest
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.notes,
          size: 30,
          color: Colors.black,
        ),
        toolbarHeight: 30,
        backgroundColor: Colors.yellow,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              icon: const Icon(
                Icons.info,
                size: 30,
                color: Colors.grey,
              ),
              onPressed: () {
                print("You pressed IconButton");
              },
            ),
          ),
        ],
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[100],
        child: Column(
          children: [
            // Header Section
            Container(
              height: 170,
              decoration: const BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Car Loan",
                      style: GoogleFonts.robotoMono(fontSize: 35),
                    ),
                    Text(
                      "Calculator",
                      style: GoogleFonts.robotoMono(fontSize: 35),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Input Form Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  inputForm(
                      title: "Car Price",
                      hintText: "e.g 10,000,000",
                      controller: _controller1),
                  const SizedBox(height: 20),
                  inputForm(
                      title: "Down Payment",
                      hintText: "e.g 9000",
                      controller: _controller2),
                  const SizedBox(height: 20),
                  inputForm(
                      title: "Interest Rate",
                      hintText: "e.g 5%",
                      controller: _controller3),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Loan Period",
                    style: GoogleFonts.robotoMono(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      loanPeriod("1"),
                      loanPeriod("2"),
                      loanPeriod("3"),
                      loanPeriod("4"),
                      loanPeriod("5")
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      loanPeriod("6"),
                      loanPeriod("7"),
                      loanPeriod("8"),
                      loanPeriod("9"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      //print("Calculate Button tapped");
                      loancalculation();
                      Future.delayed(Duration.zero);
                      showModalBottomSheet(
                        backgroundColor: Colors.grey[400],
                        isDismissible: false,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Result",
                                    style: GoogleFonts.robotoMono(fontSize: 15),
                                  ),
                                  SizedBox(height: 15),
                                  result(
                                      title: "Total Interest",
                                      amount: totalInterest),
                                  result(
                                      title: "Monthly Interest",
                                      amount: monthlyInterest),
                                  result(
                                      title: "Monthly Installment",
                                      amount: monthlyInstallment),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    //
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          "Calculate",
                          style: GoogleFonts.robotoMono(fontSize: 20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //
  Widget result({required String title, required double amount}) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.robotoMono(fontSize: 15),
      ),
      trailing: Text(
        amount.toStringAsFixed(2), // Formats the number to 2 decimal places
        style: GoogleFonts.robotoMono(fontSize: 15),
      ),
    );
  }

  //

  Widget loanPeriod(String title) {
    return GestureDetector(
      onTap: () {
        //debugPrint(title);
        setState(() {
          selected = title;
        });
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 2, 20, 0),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            border: title == selected
                ? Border.all(color: Colors.red, width: 2)
                : null,
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text(title)),
        ),
      ),
    );
  }

  Widget inputForm(
      {required String title,
      required TextEditingController controller,
      required String hintText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.robotoMono(fontSize: 20),
        ),
        const SizedBox(height: 5),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(borderSide: BorderSide.none),
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
