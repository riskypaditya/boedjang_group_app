import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/constants.dart';
import 'db/databse_helper.dart';
import 'sign_in.dart';
import 'sign_up.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  void _launchURL() async => await canLaunchUrl(Uri.parse(Constants.githubURL))
      ? await launchUrl(Uri.parse(Constants.githubURL))
      : throw 'Could not launch ${Constants.githubURL}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: PopupMenuButton<String>(
              child: const Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              onSelected: (value) {
                switch (value) {
                  case 'Clear DB':
                    DatabaseHelper dataBaseHelper = DatabaseHelper.instance;
                    dataBaseHelper.deleteAll();
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return {'Clear DB'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Image(image: AssetImage('assets/logo.png')),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: const Column(
                    children: [
                      Text(
                        "FACE RECOGNITION AUTHENTICATION",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Demo application that uses Flutter and tensorflow to implement authentication with facial recognition",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => const SignIn(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.1),
                              blurRadius: 1,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 16),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'LOGIN',
                              style: TextStyle(color: Color(0xFF0F0BDB)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.login, color: Color(0xFF0F0BDB))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => const SignUp(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFF0F0BDB),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.1),
                              blurRadius: 1,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 16),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'SIGN UP',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.person_add, color: Colors.white)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const Divider(
                        thickness: 2,
                      ),
                    ),
                    InkWell(
                      onTap: _launchURL,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.1),
                              blurRadius: 1,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 16),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'CONTRIBUTE',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FaIcon(
                              FontAwesomeIcons.github,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
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
