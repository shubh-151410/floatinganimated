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
    degOne = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut));
    super.initState();
    rotationAnimation = Tween<double>(begin: 0.0, end: 0.0).animate(
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton:
      // Stack(
      //   overflow: Overflow.visible,
      //   children: <Widget>[
      //     Positioned(
      //       right: 140,
      //       bottom: 0,
      //       child: Row(
      //         children: <Widget>[
      //           // Transform.translate(
      //           //   offset: Offset.fromDirection(
      //           //       getRadiansFromDegree(0), degOne.value * 180),
      //           //   child: Transform(
      //           //     alignment: Alignment.center,
      //           // child: CircularButton(
      //           //     color: Colors.blue,
      //           //     width: 50,
      //           //     height: 50,
      //           //     icon: Icon(
      //           //       Icons.add,
      //           //       color: Colors.white,
      //           //     ),
      //           //     onClick: () {}),
      //           //     transform: Matrix4.rotationZ(
      //           //         getRadiansFromDegree(rotationAnimation.value))..scale(degOne.value),
      //           //   ),
      //           // ),
      //           GestureDetector(
      //             onTap: () {
      //               print("asdasdasdasdasd");
      //             },
      //             child: Container(
      //               width: degOne.value * 180,
      //               alignment: Alignment(5, 0),
      //               child: Transform(
      //                 transform: Matrix4.rotationZ(
      //                     getRadiansFromDegree(rotationAnimation.value))
      //                   ..scale(degOne.value),
      //                 alignment: Alignment.center,
      //                 child: CircularButton(
      //                     color: Colors.blue,
      //                     width: 50,
      //                     height: 50,
      //                     icon: Icon(
      //                       Icons.add,
      //                       color: Colors.white,
      //                     ),
      //                     onClick: () {
      //                       print("OnClicking");
      //                     }),
      //               ),
      //             ),
      //           ),

      //           Container(
      //             width: degOne.value * 100,
      //             child: Transform(
      //               transform: Matrix4.rotationZ(
      //                   getRadiansFromDegree(rotationAnimation.value))
      //                 ..scale(degOne.value),
      //               alignment: Alignment.center,
      //               child: CircularButton(
      //                   color: Colors.black,
      //                   width: 50,
      //                   height: 50,
      //                   icon: Icon(
      //                     Icons.camera,
      //                     color: Colors.white,
      //                   ),
      //                   onClick: () {
      //                     print("asdasda");
      //                   }),
      //             ),
      //           ),
      //           Container(
      //             width: degOne.value * 120,
      //             alignment: Alignment(-1.0, 0.0),
      //             child: Transform(
      //               transform: Matrix4.rotationZ(
      //                   getRadiansFromDegree(rotationAnimation.value))
      //                 ..scale(degOne.value),
      //               alignment: Alignment.center,
      //               child: CircularButton(
      //                   color: Colors.orangeAccent,
      //                   width: 50,
      //                   height: 50,
      //                   icon: Icon(
      //                     Icons.person,
      //                     color: Colors.white,
      //                   ),
      //                   onClick: () {
      //                     print("sdasdas");
      //                   }),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Positioned(
      //       bottom: 0,
      //       child: Transform(
      //         transform: Matrix4.rotationZ(
      //             getRadiansFromDegree(rotationAnimation.value)),
      //         alignment: Alignment.center,
      //         child: CircularButton(
      //             color: Colors.red,
      //             width: 60,
      //             height: 60,
      //             icon: Icon(
      //               Icons.menu,
      //               color: Colors.white,
      //             ),
      //             onClick: () {
      //               (animationController.isCompleted)
      //                   ? animationController.reverse()
      //                   : animationController.forward();
      //             }),
      //       ),
      //     )
      //   ],
      // ),

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 15,
        color: Colors.red,
        child: Row(
          children: <Widget>[
            Icon(
              Icons.home,
              size: 40,
            ),
            Icon(Icons.business),
          ],
        ),
      ),
      body: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 0,
                width: size.width,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment(1.0, 0.0),
                      child: Container(
                        width: degOne.value * 120,
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation.value))
                            ..scale(degOne.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                              color: Colors.blue,
                              width: 50,
                              height: 50,
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onClick: () {
                                print("OnClicking");
                              }),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.5,0.0),
                                          child: Container(
                        width: degOne.value * 120,
                        child: Transform(
                          
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation.value))
                            ..scale(degOne.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                              color: Colors.black,
                              width: 50,
                              height: 50,
                              icon: Icon(
                                Icons.camera,
                                color: Colors.white,
                              ),
                              onClick: () {
                                print("CircleIcon");
                              }),
                        ),
                      ),
                    ),
                    Container(
                      width: degOne.value * 120,
                      alignment: Alignment(-1.0, 0.0),
                      child: Transform(
                        transform: Matrix4.rotationZ(
                            getRadiansFromDegree(rotationAnimation.value))
                          ..scale(degOne.value),
                        alignment: Alignment.center,
                        child: CircularButton(
                            color: Colors.orangeAccent,
                            width: 50,
                            height: 50,
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            onClick: () {
                              print("Person");
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 140,
                bottom: 0,
                child: Transform(
                  transform: Matrix4.rotationZ(
                      getRadiansFromDegree(rotationAnimation.value)),
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
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: icon,
        onTap: onClick,
      ),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
