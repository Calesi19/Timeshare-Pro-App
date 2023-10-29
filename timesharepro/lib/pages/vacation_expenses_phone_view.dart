import 'package:flutter/material.dart';

class ExpenseCategory {
  final String name;
  final bool requiresDays;
  IconData icon;

  ExpenseCategory(
      {required this.name, required this.icon, this.requiresDays = true});
}

class ExpensePage extends StatefulWidget {
  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  List<ExpenseCategory> categories = [
    ExpenseCategory(name: "Flights", icon: Icons.flight, requiresDays: false),
    ExpenseCategory(name: "Hotel", icon: Icons.hotel),
    ExpenseCategory(name: "Transportation", icon: Icons.car_rental_rounded),
    ExpenseCategory(name: "Food", icon: Icons.restaurant),
    ExpenseCategory(name: "Entertainment", icon: Icons.local_activity_rounded),
    // ... add more categories as needed
  ];

  Map<String, double> costs = {};
  Map<String, int> days = {};

  List<TextEditingController> costControllers = [];
  List<TextEditingController> dayControllers = [];

  @override
  void initState() {
    super.initState();
    for (var category in categories) {
      costControllers.add(TextEditingController());
      dayControllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (var controller in costControllers) {
      controller.dispose();
    }
    for (var controller in dayControllers) {
      controller.dispose();
    }
    super.dispose();
  }




  double getTotal() {
   
    double total = 0;
    for (var category in categories) {
      double cost = costs[category.name] ?? 0.0;
      int day = days[category.name] ?? 1;
      total += cost * day;
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vacation Expenses',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: GestureDetector(
        onTap: () => {FocusScope.of(context).unfocus()},
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: double.infinity,
                  height: 125,
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
                  child: Column(
                    children: [
                      Text(
                        'Total Amount',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Text(
                          '\$${getTotal().toStringAsFixed(0)}',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )),
              SizedBox(height: 0),
              Expanded(
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16, top: 16, bottom: 0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  category.name,
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                                Spacer(),
                                Icon(category.icon,
                                    color: Colors.blue, size: 30),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: costControllers[index],
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        costs[category.name] =
                                            double.tryParse(value) ?? 0.0;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        labelStyle:
                                            TextStyle(color: Colors.grey[500]),
                                        labelText: 'Cost',
                                        prefix: Text('\$'),
                                        border: InputBorder.none),
                                  ),
                                ),
                                if (category.requiresDays) SizedBox(width: 16),
                                if (category.requiresDays)
                                  Expanded(
                                    child: TextFormField(
                                      controller: dayControllers[index],
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        setState(() {
                                          days[category.name] =
                                              int.tryParse(value) ?? 1;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        labelStyle:
                                            TextStyle(color: Colors.grey[500]),
                                        labelText: 'Days',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
