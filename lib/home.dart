import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:nasa/EndlessSpace/endLessSpace.dart';
import 'package:nasa/Rocket/RocketHome.dart';

import 'Wild Fire/wildFire.dart';
import 'disaster/disaster_home.dart';
import 'gallery/galleryUI.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _blurry;
  CrossFadeState _crossFadeState=CrossFadeState.showFirst;

  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 800));
    _blurry=Tween(begin: 0.0,end: 2.0).animate(_controller);
    _controller.addListener(()=>setState((){}));
    _controller.forward();
    _controller.addStatusListener((s){
      if(s==AnimationStatus.completed){
        setState(() {
          _crossFadeState=CrossFadeState.showSecond;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
        ),
        Image.asset(
          "images/nasaLogo.png",
          fit: BoxFit.contain,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        BackdropFilter(
          filter: prefix0.ImageFilter.blur(sigmaX: _blurry.value, sigmaY: _blurry.value),
          child: Scaffold(
            backgroundColor: Colors.black.withOpacity(.8),
            body: AnimatedCrossFade(duration: Duration(seconds: 1),crossFadeState: _crossFadeState,
              firstChild: Container(color: Colors.transparent,),
              secondChild: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Choose One.",
                        style: TextStyle(color: Colors.white, fontSize: 22.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15.0,bottom: 30.0),
                      child: Text(
                        "You can always change that later.",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (c)=>RocketHome()));},
                        child: Container(width: 250.0,height: 50,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(11, 61, 145, 1.0),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Center(
                              child: Text(
                                "Rocket Launches",
                                style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (c)=>DisasterHome()));},
                        child: Container(width: 250.0,height: 50,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(11, 61, 145, 1.0),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Center(
                              child: Text(
                                "Disaster Management",
                                style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                              ),
                            )),
                      ),
                    ),



                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (c)=>wildFire()));},
                        child: Container(width: 250.0,height: 50,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(11, 61, 145, 1.0),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Center(
                              child: Text(
                                "Wild Fire",
                                style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                              ),
                            )),
                      ),
                    ),

//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: InkWell(
//                        onTap: () {},
//                        child: Container(width: 250.0,height: 50,
//                            decoration: BoxDecoration(
//                                color: Color.fromRGBO(11, 61, 145, 1.0),
//                                borderRadius: BorderRadius.circular(20.0)),
//                            child: Center(
//                              child: Text(
//                                "Cryosphere",
//                                style:
//                                TextStyle(color: Colors.white, fontSize: 18.0),
//                              ),
//                            )),
//                      ),
//                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (c)=>Menu()));},
                        child: Container(width: 250.0,height: 50,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(11, 61, 145, 1.0),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Center(
                              child: Text(
                                "Endless Space",
                                style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (c)=>Gallery()));},
                        child: Container(width: 250.0,height: 50,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(11, 61, 145, 1.0),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Center(
                              child: Text(
                                "Gallery",
                                style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                              ),
                            )),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
