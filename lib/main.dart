import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipy',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double imagewidth;
  double imageheight;
  String imagesource = 'lib/assets/lake.jpg';


  double _updateState(){
    setState(() {
      imagesource = 'lib/assets/test.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    imageheight =  MediaQuery.of(context).size.height*0.80;
    imagewidth =  MediaQuery.of(context).size.width * 0.90;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.



    Widget PictureSection =  Column(
        children:[
          AnimatedContainer(
              duration: Duration(milliseconds: 400),
              height: imageheight,
              width: imagewidth,
              child:getImage(imagesource)
          ),
        ]
    );
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          getButton(Colors.red,Icons.thumb_down_alt,'false'),
          getButton(Colors.green,Icons.thumb_up_alt,'true')
        ],
      ),
    );


    return
      Column(
          children:[
            PictureSection,
            buttonSection
          ]

      );
  }

  Image getImage(imagesrc){
    return Image.asset(
      imagesrc,
      fit: BoxFit.cover,
    );
  }
  Column getButton(ButtonColor,IconType,bol){
   return Column(
       mainAxisSize: MainAxisSize.min,
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Padding(
       padding: const EdgeInsets.all(8.0),
       child:Column(

      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        ClipOval(
          child:Material(
            type: MaterialType.transparency, //Makes it usable on any background color, thanks @IanSmith
            child: Ink(
              decoration: BoxDecoration(
                border: Border.all(color: ButtonColor, width: 1.0),
                color: Colors.transparent,

                shape: BoxShape.circle,

              ),
              child: InkWell(
                  onTap: () {
                    debugPrint(bol);
                    _updateState();
                    },
                splashColor: ButtonColor,
                borderRadius: BorderRadius.circular(1000.0), //Something large to ensure a circle
                child: Padding(
                  padding:EdgeInsets.all(20.0),
                  child: Icon(
                    IconType,
                    size: 30.0,
                    color: ButtonColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
   ),
       ]
    );
  }

}
