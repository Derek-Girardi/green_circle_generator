import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:green_circle_generator/models/questions.dart';

class PrimaryPage extends StatefulWidget {
  @override
  PrimaryPageState createState() => PrimaryPageState();
}

class PrimaryPageState extends State<PrimaryPage> {
  PageController controller = PageController();
  Animatable<Color> background;

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  void _initialize() {
    background = TweenSequence<Color>([
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.orange[600],
          end: Colors.deepPurple[400],
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.deepPurple[400],
          end: Colors.yellow[300],
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.yellow[300],
          end: Colors.blue[400],
        ),
      ),
    ]);
    controller = PageController();
  }

  @override
  void reassemble() {
    controller.dispose();
    _initialize();
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
              child: new FutureBuilder(
                  future: rootBundle.loadString('lib/assets/questions.json'),
                  builder: (BuildContext context, AsyncSnapshot snap) {
                    if (snap.hasData) {
                      var questions = questionsFromJson(snap.data);
                      return PageView.builder(
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          itemCount: questions.questions.length,
                          itemBuilder: (BuildContext context, position) {
                            return Center(
                              child: Text(
                                "${questions.questions[position].textQuestion}",
                                style: TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow),
                              ),
                            );
                          });
                    }
                    return CircularProgressIndicator();
                  }))),
      bottomNavigationBar: ButtonBar(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              splashColor: Colors.blueGrey,
              onPressed: () => {},
              child: new Text("Easy")),
          new MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              splashColor: Colors.blueGrey,
              onPressed: () => {},
              child: new Text("Medium")),
          new MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              splashColor: Colors.blueGrey,
              onPressed: () => {},
              child: new Text("Hard"))
        ],
      ),
    );
  }
}
