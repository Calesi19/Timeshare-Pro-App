import 'package:flutter/material.dart';
import 'package:timesharepro/pages/projections_phone_view.dart';
import 'package:timesharepro/pages/proposal_phone_view.dart';
import 'package:timesharepro/pages/calculator_phone_view.dart';
import 'package:timesharepro/pages/vacation_expenses_phone_view.dart';
import 'package:timesharepro/pages/information_phone_view.dart';

class DrawerSeperator extends StatelessWidget {

  final String text;
  const DrawerSeperator({super.key, required this.text});

  DrawerSeperator.text({this.text = ''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            '$text',
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}






class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10),
              // Remove padding since you added SizedBox at various places
              children: <Widget>[
                SizedBox(
            height: 60,
          ),
    
          // Image at the top of the Drawer with rounded corners
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  //'https://github.com/Calesi19/Timeshare-Pro-App/blob/main/web-client/src/assets/logo.png?raw=true',
                  'lib/assets/images/logo.png',
                  height: 60,
                  width: 60,
                ),
              ),
              Spacer(),
            ],
          ),
    
          SizedBox(
            height: 10,
          ),
    
          DrawerSeperator(text: "Presentation"),
    
          ListTile(
            leading: const Icon(Icons.hotel_rounded),
            title: Text('Hotel Cost Projection'),
            
            onTap: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProjectionPage()),
              );
            },
    
            //  Round the corners of the tile
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
    
            // Give a custom color to the Drawer tile
            tileColor: Colors.blue[50],
            // Give margin to the tile
            //contentPadding: EdgeInsets.all(10),
            // Give some padding to the tile
            dense: true,
    
            // Add leading and trailing icons to the tile
    
            // leading: Icon(Icons.home),
            // trailing: Icon(Icons.arrow_forward),
          ),
    

          ListTile(
            leading: const Icon(Icons.beach_access_rounded),
            title: Text('Vacation Expenses'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ExpensePage()));
            },
          ),
    
          DrawerSeperator(text: "Backend"),
    
    
          ListTile(
            leading: const Icon(Icons.contact_page_rounded),
            title: Text('Proposal Maker'),
            onTap: () {
              // Update the state of the app.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProposalPage()),
              );
            },
          ),
    
          ListTile(
            leading: const Icon(Icons.calculate_rounded),
            title: Text('Calculator'),
            onTap: () {
              // Update the state of the app.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalculatorHomePage()),
              );
            },
          ),
              ],
            ),
          ),
          // Information option at the bottom
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: ListTile(
              leading: const Icon(Icons.settings_rounded),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InformationPage()),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 40),
            child: ListTile(
              leading: const Icon(Icons.info_outline_rounded),
              title: Text('Information'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InformationPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
