import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Information',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset("lib/assets/images/logo.png",
                          width: 100, height: 100)),
                  SizedBox(width: 20),
                 
                  RichText(
                    text: const TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          TextSpan(
                              text: 'Timeshare Pro\n',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24)),
                          TextSpan(
                              text: 'Version: ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: '1.0.0',
                          ),
                        ]),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(10)),
                child: Column(children: [
                  Row(
                    children: [
                      const Text("Terms Of Service",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24)),
                      const Spacer(),
                      Icon(
                        Icons.supervised_user_circle_rounded,
                        size: 32,
                        color: Colors.blue[300],
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: Colors.grey[900], fontSize: 16),
                            children: const [
                          TextSpan(
                              text: '\n1. Acceptance of Terms\n\n',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  'By accessing or using the Timeshare Pro app ("the App"), you agree to comply with and be bound by these Terms of Service. If you do not agree to these terms, please do not use the App.\n\n'),
                          TextSpan(
                              text: '2. Use of the App\n\n',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  ' agYouree to use the App only for purposes that are permitted by these Terms and any applicable law, regulation, or generally accepted practices or guidelines in the relevant jurisdictions.\n\n'),
                          TextSpan(
                              text: '3. Disclaimer\n\n',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  'The App is provided "as is" and "as available" without any warranties of any kind, either expressed or implied, including, but not limited to, the implied warranties of merchantability, fitness for a particular purpose, or non-infringement.\n\n'),
                          TextSpan(
                              text: '4. Limitation of Liability\n\n',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  'Under no circumstances shall we be liable for any direct, indirect, incidental, special, consequential, or exemplary damages arising out of or related to your use of the App.'),
                        ])),
                  )
                ]),
              ),
              const SizedBox(height: 40),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(10)),
                child: Column(children: [
                  Row(
                    children: [
                      const Text("Privacy Policy",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24)),
                      const Spacer(),
                      Icon(
                        Icons.privacy_tip_rounded,
                        size: 32,
                        color: Colors.orange[300],
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: Colors.grey[900], fontSize: 16),
                            children: const [
                          TextSpan(
                              text: '\n1. Information We Collect\n\n',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  'Given the nature of Timeshare Pro, we do not collect or store any personal or sensitive user data. All data input into the app remains on your device and is not shared or transmitted.\n\n'),
                          TextSpan(
                              text: '2. Permissions & Access\n\n',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  'Timeshare Pro does not require internet access to function and does not request access to device files or other features.\n\n'),
                          TextSpan(
                              text: '3. Disclaimer\n\n',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  'The App is provided "as is" and "as available" without any warranties of any kind, either expressed or implied, including, but not limited to, the implied warranties of merchantability, fitness for a particular purpose, or non-infringement.\n\n'),
                          TextSpan(
                              text: '4. Limitation of Liability\n\n',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  'Under no circumstances shall we be liable for any direct, indirect, incidental, special, consequential, or exemplary damages arising out of or related to your use of the App.'),
                        ])),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
