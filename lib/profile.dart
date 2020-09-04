import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: <Widget>[
          profile(context),
          buttonText(context),
          buttonIcon(context),
        ],
      ),
    );
  }


  Widget profile(BuildContext context) => Positioned(
    left: 0,
    right: 0,
    height: 300.0,
    child: Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 25.0, bottom: 80.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xFF607ffb), const Color(0xFFa95afc)]),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      Text(
                        "Profile Users",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.people,size: 40,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Jeffrey Abaniel",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                 ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "Programmer",
                              style: TextStyle(
                                  color: const Color(0xFFd3d3d3),
                                 ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget buttonText(BuildContext context) => Positioned(
    width: MediaQuery.of(context).size.width,
    top: 260.0,
    child: Padding(
      padding: const EdgeInsets.only(left: 50.0, right: 50.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 15.0, bottom: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Profile",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0),
              ),
              Text(
                "Account",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0),
              ),
              Text(
                "Settings",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  Widget buttonIcon(BuildContext context) => Positioned(
    width: MediaQuery.of(context).size.width,
    top: 350.0,
    child: Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                null;
              },
              child: Column(
                children: <Widget>[
                  Icon(Icons.settings,size: 40,),
                  Text("Settings")
                ],
              ),
            ),
            FlatButton(
              onPressed: () {
                null;
              },
              child: Column(
                children: <Widget>[
                  Icon(Icons.accessibility,size: 40,),
                  Text("Profile")
                ],
              ),
            ),
            FlatButton(
              onPressed: () {
                null;
              },
              child: Column(
                children: <Widget>[
                Icon(Icons.mail,size: 40,),
                  Text("Inbox")
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
