import 'package:flutter/material.dart';
import 'package:timesharepro/components/drawer.dart';



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

class ProposalInput extends StatelessWidget {
  const ProposalInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Purchase Price",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Spacer(),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                constraints: BoxConstraints(maxWidth: 150),
                prefix: Text("\$"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), gapPadding: 20),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Text("Down Payment",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Spacer(),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                constraints: BoxConstraints(maxWidth: 150),
                prefix: Text("\$"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), gapPadding: 20),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Text("Closing Cost",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Spacer(),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                constraints: BoxConstraints(maxWidth: 150),
                prefix: Text("\$"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), gapPadding: 20),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Text("Exchange Company\nDues",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Spacer(),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                constraints: BoxConstraints(maxWidth: 150),
                prefix: Text("\$"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), gapPadding: 20),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Text("Total Down\nPayment Due",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Spacer(),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                constraints: BoxConstraints(maxWidth: 150),
                prefix: Text("\$"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), gapPadding: 20),
              ),
            ),
          ],
        ),
      ],
    );
  }
}






class ProposalPage extends StatelessWidget {
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
                ProposalInput(),

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
                        )),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Amount Financed\n\$35,543',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )
                          ],
                        ),
                        Spacer(),
                        Column(
                          verticalDirection: VerticalDirection.up,
                          children: [
                            Text(
                              '\$35,543\nMonthly Payment',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )
                          ],
                        )
                      ],
                    )),

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

                //RawChip(label: Text('Raw Chip'),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}