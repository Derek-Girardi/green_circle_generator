import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:green_circle_generator/models/questions.dart';
import 'dart:math';


class PrimaryPage extends StatefulWidget {
  @override
  PrimaryPageState createState() => PrimaryPageState();
}

class PrimaryPageState extends State<PrimaryPage> {
  PageController controller = PageController();
  Animatable<Color> background;
  int _difficulty;
  final _random = new Random();

   /* @override
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
  }*/

  Future<String> _loadAsset() async {
  return await rootBundle.loadString('lib/assets/questions.json');
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
                  future: _loadAsset(),
                  builder: (BuildContext context, AsyncSnapshot snap) {
                    if (snap.hasData) {
                      var questions = questionsFromJson(snap.data);
                      return PageView.builder(
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          itemCount: (_difficulty==1)?questions.easyQuestions.length:    //TODO: make this robust, good for now though.
                              (_difficulty==2)?questions.mediumQuestions.length:
                              (_difficulty==3)?questions.hardQuestions.length:
                              questions.easyQuestions.length,
                              
                          //itemCount: questions.easyQuestions.length,
                          itemBuilder: (BuildContext context, _position) {
                            return Center(
                              child: Text((_difficulty==1)?"${questions.easyQuestions[_random.nextInt(questions.easyQuestions.length)].textQuestion}":    //TODO: make this robust, good for now though.
                              (_difficulty==2)?"${questions.mediumQuestions[_random.nextInt(questions.mediumQuestions.length)].textQuestion}":
                              (_difficulty==3)?"${questions.hardQuestions[_random.nextInt(questions.hardQuestions.length)].textQuestion}":
                              "${questions.easyQuestions[_random.nextInt(questions.easyQuestions.length)].textQuestion}",
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
              textColor: Colors.blueGrey,
              splashColor: Colors.blueGrey,
              onPressed: () => {
                setState((){
                  _difficulty = 1;
                  controller.jumpToPage(0);
                })
              },
              child: new Text("Shallow")),
          new MaterialButton(
              color: Color(0xff98ff98),
              textColor: Colors.blueGrey,
              splashColor: Colors.blueGrey,
              onPressed: () => {
                setState((){
                  _difficulty = 2;
                  controller.jumpToPage(0);
                })
              },
              child: new Text("Middle")),
          new MaterialButton(
              color: Color(0xff98ff98),
              textColor: Colors.blueGrey,
              splashColor: Colors.blueGrey,
              onPressed: () => {
                setState((){
                  _difficulty = 3;
                  controller.jumpToPage(0);
                })
              },
              child: new Text("Deep"))
        ],
      ),
    );
  }
}

//_getRandomIndex(int  min + rnd.nextInt(max - min);){
  
//}
