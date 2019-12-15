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
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        //`true` if you want Flutter to automatically add Back Button when needed,
        //or `false` if you want to force your own back button every where
        title: Text('Primary Questions'),
        leading: IconButton(icon:Icon(Icons.arrow_back),
          onPressed:() => Navigator.pop(context, false),
        ),
        centerTitle: true,
       ),
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
                          itemCount: questions.easyQuestions.length,
                          itemBuilder: (BuildContext context, position) {
                            return Center(
                              child: Text(
                                "${questions.easyQuestions[position].textQuestion}",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                            );
                          });
                    }
                    return CircularProgressIndicator();
                  }))),           
      bottomNavigationBar: ButtonBar(
        mainAxisSize: MainAxisSize.min,
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          new MaterialButton(
              color: Color(0xff98ff98),
              textColor: Colors.white,
              splashColor: Colors.blueGrey,
              onPressed: () => {},
              child: new Text("Shallow")),
          new MaterialButton(
              color: Color(0xff98ff98),
              textColor: Colors.white,
              splashColor: Colors.blueGrey,
              onPressed: () => {},
              child: new Text("Middle")),
          new MaterialButton(
              color: Color(0xff98ff98),
              textColor: Colors.white,
              splashColor: Colors.blueGrey,
              onPressed: () => {},
              child: new Text("Deep"))
        ],
      ),
    );
  }
}
