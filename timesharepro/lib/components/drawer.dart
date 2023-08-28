import 'package:flutter/material.dart';

class DrawerSeperator extends StatelessWidget {
  const DrawerSeperator({super.key, text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          'Presentation',
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}




class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.all(10),
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

          DrawerSeperator(),

          ListTile(
            leading: const Icon(Icons.bed),
            title: Text('Hotel Cost Projection'),
            
            onTap: () {
              // Update the state of the app.
              Navigator.pop(context); // Close the drawer
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
            leading: const Icon(Icons.local_pizza_rounded),
            title: Text('Fun Activity Calculator'),
            onTap: () {
              // Update the state of the app.
              Navigator.pop(context); // Close the drawer
            },
          ),

          DrawerSeperator(),


          ListTile(
            leading: const Icon(Icons.contact_page_rounded),
            title: Text('Proposal'),
            onTap: () {
              // Update the state of the app.
              Navigator.pop(context); // Close the drawer
            },
          ),

          
          




          ListTile(
            leading: const Icon(Icons.calculate_rounded),
            title: Text('Calculator'),
            onTap: () {
              // Update the state of the app.
              Navigator.pop(context); // Close the drawer
            },
          ),

          ListTile(
            leading: const Icon(Icons.currency_exchange_rounded),
            title: Text('Currency Converter'),
            onTap: () {
              // Update the state of the app.
              Navigator.pop(context); // Close the drawer
            },
          ),

          Spacer(),


          ListTile(
            leading: const Icon(Icons.restore),
            title: Text('Reset Everything'),
            onTap: () {
              // Update the state of the app.
              Navigator.pop(context); // Close the drawer
            },
          ),

          ListTile(
            leading: const Icon(Icons.info_outline_rounded),
            title: Text('Information'),
            onTap: () {
              // Update the state of the app.
              Navigator.pop(context); // Close the drawer
            },
          ),




        ],
      ),
    );
  }
}
