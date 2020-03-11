import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:green_circle_generator/models/questions.dart';
import 'dart:math';

class SecondaryPage extends StatefulWidget {
  // final question = questionFromJson("jsonString");
  @override
  SecondaryPageState createState() => SecondaryPageState();
}

class SecondaryPageState extends State<SecondaryPage> {
  PageController controller = PageController();
  Animatable<Color> background;
  int _difficulty;
  final _random = new Random();

  Future<String> _loadAsset() async {
    return await rootBundle.loadString('lib/assets/questions.json');
  }

  @override
  void initState() {
    setState(() {
      _difficulty = 1;
    });
    super.initState();
  }

  //@override
  //void initState() {
  // controller = PageController(
  //  keepPage: false,
  // );
  //  super.initState();
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //  super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F1F1),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xffF1F1F1),
        //`true` if you want Flutter to automatically add Back Button when needed,
        //or `false` if you want to force your own back button every where
        title: Text("5 - 8",
            style: TextStyle(color: Color(0xff222222))),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xff222222),
          onPressed: () => Navigator.pop(context, false),
        ),
        centerTitle: true,
      ),
      body: Container(
          child: Center(
              child: new FutureBuilder(
                  future: _loadAsset(),
                  builder: (BuildContext context, AsyncSnapshot snap) {
                    if (snap.hasData) {
                      var questions = questionsFromJson(snap.data);
                      return PageView.builder(
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          itemCount: (_difficulty == 1)
                              ? questions.easyQuestions.length
                              : (_difficulty == 2)
                                  ? questions.mediumQuestions.length
                                  : (_difficulty == 3)
                                      ? questions.hardQuestions.length
                                      : questions.easyQuestions.length,
                          itemBuilder: (BuildContext context, _position) {
                            return Center(
                                child: Container(
                                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  child: Text(
                                  (_difficulty == 1)
                                    ? "${questions.easyQuestions[_random.nextInt(questions.easyQuestions.length)].textQuestion}"
                                    : (_difficulty == 2)
                                        ? "${questions.mediumQuestions[_random.nextInt(questions.mediumQuestions.length)].textQuestion}"
                                        : (_difficulty == 3)
                                            ? "${questions.hardQuestions[_random.nextInt(questions.hardQuestions.length)].textQuestion}"
                                            : "${questions.easyQuestions[_random.nextInt(questions.easyQuestions.length)].textQuestion}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff222222)),
                              ),
                            ));
                          });
                    }
                    return CircularProgressIndicator();
                  }))),
      bottomNavigationBar: ButtonBar(
        mainAxisSize: MainAxisSize.min,
        alignment: MainAxisAlignment.center,
        buttonMinWidth: 110.0,
        children: <Widget>[
          new MaterialButton(
              elevation: 0.0,
              disabledColor: Color(0xff74CC84),
              disabledTextColor: Color(0xffF1F1F1),
              color: Color(0xffF1F1F1),
              textColor: Color(0xff74CC84),
              splashColor: Color(0xff74CC84),
              onPressed: _difficulty != 1
                  ? () => {
                        setState(() {
                          _difficulty = 1;
                          controller.jumpToPage(0);
                        })
                      }
                  : null,
              child: new Text("Shallow")),
          new MaterialButton(
              elevation: 0.0,
              disabledColor: Color(0xff1B72A3),
              disabledTextColor: Color(0xffF1F1F1),
              color: Color(0xffF1F1F1),
              textColor: Color(0xff1B72A3),
              splashColor: Color(0xff1B72A3),
              onPressed: _difficulty != 2
                  ? () => {
                        setState(() {
                          _difficulty = 2;
                          controller.jumpToPage(0);
                        })
                      }
                  : null,
              child: new Text("Middle")),
          new MaterialButton(
              elevation: 0.0,
              disabledColor: Color(0xffC87140),
              disabledTextColor: Color(0xffF1F1F1),
              color: Color(0xffF1F1F1),
              textColor: Color(0xffC87140),
              splashColor: Color(0xffC87140),
              onPressed: _difficulty != 3
                  ? () => {
                        setState(() {
                          _difficulty = 3;
                          controller.jumpToPage(0);
                        })
                      }
                  : null,
              child: new Text("Deep"))
        ],
      ),
    );
  }
}
