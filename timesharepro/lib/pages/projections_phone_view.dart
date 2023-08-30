
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
                        )),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Spent in the next 10 years',
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
                              '\$35,543',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32),
                            )
                          ],
                        )
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [Text("Nights", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  Spacer(),
                  TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                constraints: BoxConstraints(maxWidth: 150),
                
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), gapPadding: 20),
              ),
            ),
              ]),

              SizedBox(height: 20,),

                Row(
                  children: [
                    Text("Cost Per Night", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  Text("Years", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Spacer(),
                  TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                constraints: BoxConstraints(maxWidth: 150),
                
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), gapPadding: 20),
              ),
            ),

                ],),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text("Inflation", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Spacer(), TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                constraints: BoxConstraints(maxWidth: 150),
                prefix: Text("%"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), gapPadding: 20),
              ),
            ),
                  ],
                ),

                SizedBox(height: 20),
                
                ElevatedButton(
                  onPressed: () {}, 
                  
                  style: ButtonStyle(
                  // Button Color
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(244, 244, 244, 1)),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(20)),
                      
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              ),
                              
                              )
                              
                  
                  ),
                child: Text("Calculate", style: TextStyle(color: Colors.black)),
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