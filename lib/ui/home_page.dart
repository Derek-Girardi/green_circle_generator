import 'package:flutter/material.dart';
import 'package:green_circle_generator/transition/transition.dart';
import 'package:green_circle_generator/ui/Primary_Page.dart';
import 'package:green_circle_generator/ui/Secondary_Page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F1F1),
    // Commenting out for now for a cleaner look.
    /*  appBar: AppBar(
        backgroundColor: Color(0xffF1F1F1),
        centerTitle: true,
        title:
            Text('Test Questions', style: TextStyle(color: Color(0xff222222))),
      ),*/
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 65.0, horizontal: 100.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 1),
                        blurRadius: 2.0)
                  ],
                  shape: BoxShape.circle,
                  color: Color(0xffF1F1F1),
                ),
                child: Material(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100.0),
                    onTap: () => Navigator.push(
                        context, SlideLeftRoute(page: PrimaryPage())),
                    splashColor: Color(0xffC87140),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(width: 4, color: Color(0xff222222))),
                      child: Center(
                        child: Text("K - 4",
                            style: new TextStyle(
                              fontSize: 20.0,
                              color: Color(0xff222222),
                            )),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 65.0, horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 1),
                        blurRadius: 2.0)
                  ],
                  shape: BoxShape.circle,
                  color: Color(0xffF1F1F1),
                ),
                child: Material(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100.0),
                    onTap: () => Navigator.push(
                        context, SlideLeftRoute(page: SecondaryPage())),
                    splashColor: Color(0xffC87140),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(width: 4, color: Color(0xff222222))),
                      child: Center(
                        child: Text("5 - 8",
                            style: new TextStyle(
                              fontSize: 20.0,
                              color: Color(0xff222222),
                            )),
                      ),
                    ),
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
