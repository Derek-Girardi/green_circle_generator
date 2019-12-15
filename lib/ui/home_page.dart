import 'package:flutter/material.dart';
import 'package:green_circle_generator/transition/transition.dart';
import 'package:green_circle_generator/ui/Primary_Page.dart';
import 'package:green_circle_generator/ui/Secondary_Page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Test Questions'),
       ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 75.0, horizontal: 16.0),
              child: MaterialButton(
                minWidth: 200.0,
                height: 150.0,
                color: Color(0xff98ff98),
                textColor: Colors.white,
                splashColor: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () => Navigator.push(context, SlideLeftRoute(page: PrimaryPage())),//PrimaryPage
                child: Text(
                  "K - 4",
                  style: new TextStyle(
                    fontSize: 40.0,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 75.0, horizontal: 16.0),
              child: MaterialButton(
                minWidth: 200.0,
                height: 150.0,
                color: Color(0xff98ff98),
                textColor: Colors.white,
                splashColor: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () => Navigator.push(context, SlideLeftRoute(page: SecondaryPage())),
                child: Text(
                  "4 - 8",
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
