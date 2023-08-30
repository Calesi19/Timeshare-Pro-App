import 'package:flutter/material.dart';
import 'package:timesharepro/components/drawer.dart';
import 'package:timesharepro/models/DefaultProposal.dart';

class MyDropdownWidget extends StatefulWidget {
  @override
  _MyDropdownWidgetState createState() => _MyDropdownWidgetState();
}

class _MyDropdownWidgetState extends State<MyDropdownWidget> {
  String? _selectedDropdownItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0), // Adjust for the dropdown icon and proper spacing
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), // Rounded corner
        border: Border.all(color: Colors.grey), // Color of the border
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          //isExpanded: true, // To ensure dropdown expands to fill its parent container
          hint: Text('Choose an option'),
          value: _selectedDropdownItem,
          items: ['Single', 'Joint', 'NCL'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _selectedDropdownItem = newValue;
            });
          },
          dropdownColor: Colors.white, // Color for the dropdown items
          style: TextStyle(color: Colors.black),
          icon: Icon(Icons.arrow_drop_down), // Icon for the dropdown
          iconSize: 24,
          elevation: 16,
          itemHeight: 50, // Height of each dropdown item
        ),
      ),
    );
  }
}

class ProposalPage extends StatefulWidget {
  @override
  _ProposalPageState createState() => _ProposalPageState();
}


void showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Error'),
        content: Text(errorMessage),
        actions: [
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}



class _ProposalPageState extends State<ProposalPage> {
  TextEditingController _purchasePriceController = TextEditingController();
  TextEditingController _downPaymentController = TextEditingController();
  TextEditingController _closingCostController = TextEditingController();
  TextEditingController _exchangeDuesController = TextEditingController();
  TextEditingController _totalDownPaymentController = TextEditingController();
  TextEditingController _annualRateController =
      TextEditingController(text: '17.99');
  TextEditingController _yearsFinancedController =
      TextEditingController(text: '10');
  TextEditingController _dpPercentController =
      TextEditingController(text: '10');

  double amountFinanced = 0.0;
  double monthlyPayment = 0.0;

  @override
  void dispose() {
    _purchasePriceController.dispose();
    _downPaymentController.dispose();
    _closingCostController.dispose();
    _exchangeDuesController.dispose();
    _totalDownPaymentController.dispose();
    _annualRateController.dispose();
    _yearsFinancedController.dispose();
    _dpPercentController.dispose();
    super.dispose();
  }

  void calculate() {
    double purchase_price = 0.0;
    double dp_percent = 0.0;
    double annual_rate = 0.0;
    double years_financed = 0.0;

    

    try {
      purchase_price = double.parse(_purchasePriceController.text);
      dp_percent = double.parse(_dpPercentController.text);
      annual_rate = double.parse(_annualRateController.text);
      years_financed = double.parse(_yearsFinancedController.text);
    } catch (e) {
      // Show modal dialog here
      if (_purchasePriceController.text.isEmpty) {
        return;
      }
      showErrorDialog(context, 'Please enter valid numbers');

      return;
    }

    // Assuming these are 10%, 5%, and 2% of purchase price respectively
    double downpayment = purchase_price * (dp_percent / 100);
    double closing_cost = (purchase_price * 0.03) + 51;
    double exchange_dues = 109;

    double total_dp = downpayment + closing_cost + exchange_dues;
    double amount_financed = purchase_price - downpayment;
    double monthly = purchase_price * .01839;
    //double monthly = purchase_price * .01740;

    // Update Controllers
    _downPaymentController.text = downpayment.ceilToDouble().toStringAsFixed(0);
    _closingCostController.text = closing_cost.ceil().toStringAsFixed(0);
    _exchangeDuesController.text = exchange_dues.ceil().toStringAsFixed(0);
    _totalDownPaymentController.text = total_dp.ceil().toStringAsFixed(0);

    // Assuming you want to update the Amount Financed and Monthly Payment values in the gradient container
    // You should use state variables for these and then update them here

    amountFinanced = amount_financed.ceilToDouble();
    monthlyPayment = monthly.ceilToDouble();

    // 18.39 Double * purchase price
    // 17.40 Single * purchase price

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _purchasePriceController.addListener(calculate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Proposal',
          style: TextStyle(color: Colors.black),
        ),
        // Change color to transparent
        backgroundColor: Colors.transparent,
        elevation: 0,
        // Change icon color
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: MyDrawer(), // This is where you add the drawer
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Annual \n% Rate'),
                          TextField(
                            controller: _annualRateController,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              constraints: BoxConstraints(maxWidth: 100),
                              contentPadding: EdgeInsets.all(8),
                              prefix: Text("\%"),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('\nDP %'),
                          TextField(
                            controller: _dpPercentController,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              constraints: BoxConstraints(
                                maxWidth: 100,
                              ),
                              contentPadding: EdgeInsets.all(8),
                              prefix: Text("\%"),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  gapPadding: 10),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Years \nFinanced'),
                          TextField(
                            controller: _yearsFinancedController,
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              constraints: BoxConstraints(maxWidth: 100),
                              contentPadding: EdgeInsets.all(8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  gapPadding: 10),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Center Area

                Column(
                  children: [
                    Row(
                      children: [
                        Text("Purchase Price",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Spacer(),
                        TextField(
                          controller: _purchasePriceController,
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            constraints: BoxConstraints(maxWidth: 150),
                            prefix: Text("\$"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                gapPadding: 20),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text("Down Payment",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Spacer(),
                        TextField(
                          controller: _downPaymentController,
                          enabled: false,
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            constraints: BoxConstraints(maxWidth: 150),
                            prefix: Text("\$"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                gapPadding: 20),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text("Closing Cost",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Spacer(),
                        TextField(
                          controller: _closingCostController,
                          enabled: false,
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            constraints: BoxConstraints(maxWidth: 150),
                            prefix: Text("\$"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                gapPadding: 20),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text("Exchange Company\nDues",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Spacer(),
                        TextField(
                          controller: _exchangeDuesController,
                          enabled: false,
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            constraints: BoxConstraints(maxWidth: 150),
                            prefix: Text("\$"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                gapPadding: 20),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text("Total Down\nPayment Due",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Spacer(),
                        TextField(
                          controller: _totalDownPaymentController,
                          enabled: false,
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            constraints: BoxConstraints(maxWidth: 150),
                            prefix: Text("\$"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                gapPadding: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // Bottom Area
                SizedBox(height: 20),

                Container(
                  height: 100,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft, // Start position
                      end: Alignment.bottomRight, // End position
                      colors: [
                        Color.fromRGBO(56, 189, 248, 1), // First color
                        Color.fromRGBO(33, 150, 243, 1),
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Amount Financed\n\$${amountFinanced.ceil()}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                        ],
                      ),
                      Spacer(),
                      Column(
                        verticalDirection: VerticalDirection.up,
                        children: [
                          Text(
                            '\$${monthlyPayment.ceil()}\nMonthly Payment',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Years',
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 4),
                        MyDropdownWidget(),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mortgage Protection',
                          textAlign: TextAlign.start,
                          style: TextStyle(),
                        ),
                        SizedBox(height: 4),
                        MyDropdownWidget(),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
