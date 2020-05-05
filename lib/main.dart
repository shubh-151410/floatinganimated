import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation degOne;
  Animation rotationAnimation;
  int _counter = 0;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    degOne = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: animationController, curve: Curves.bounceOut));
    super.initState();
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(curve: Curves.bounceOut, parent: animationController));
    animationController.addListener(() {
      setState(() {});
    });
  }

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: <Widget>[
              Positioned(
                right: 180,
                bottom: 30,
                child: Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset.fromDirection(
                          getRadiansFromDegree(0), degOne.value * 180),
                      child: Transform(
                        alignment: Alignment.center,
                        child: CircularButton(
                            color: Colors.blue,
                            width: 50,
                            height: 50,
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onClick: () {}),
                        transform: Matrix4.rotationZ(
                            getRadiansFromDegree(rotationAnimation.value))..scale(degOne.value),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset.fromDirection(
                          getRadiansFromDegree(0), degOne.value * 100),
                      child: Transform(
                        transform:Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degOne.value),
                        alignment:Alignment.center,
                                              child: CircularButton(
                            color: Colors.black,
                            width: 50,
                            height: 50,
                            icon: Icon(
                              Icons.camera,
                              color: Colors.white,
                            ),
                            onClick: () {}),
                      ),
                    ),
                    Transform.translate(
                      child: Transform(
                        transform:Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degOne.value),
                        alignment: Alignment.center,
                                              child: CircularButton(
                            color: Colors.orangeAccent,
                            width: 50,
                            height: 50,
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            onClick: () {}),
                      ),
                      offset: Offset.fromDirection(
                          getRadiansFromDegree(180), degOne.value * 100),
                    ),
                    Transform(
                      transform:Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value)),
                      alignment: Alignment.center,

                                          child: CircularButton(
                          color: Colors.red,
                          width: 60,
                          height: 60,
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onClick: () {
                            (animationController.isCompleted)
                                ? animationController.reverse()
                                : animationController.forward();
                          }),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function onClick;
  CircularButton(
      {this.width, this.height, this.color, this.icon, this.onClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: IconButton(
        icon: icon,
        onPressed: onClick,
        enableFeedback: true,
      ),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
