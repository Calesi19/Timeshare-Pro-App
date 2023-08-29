
import 'package:flutter/material.dart';
import 'package:timesharepro/components/drawer.dart';

class ProjectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hotel Cost Projections',
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




                

                //RawChip(label: Text('Raw Chip'),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}