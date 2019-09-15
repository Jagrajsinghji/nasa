import 'package:flutter/material.dart';

import 'blank.dart';


class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(11, 61, 145, 1.0),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Text("Endless Space",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: CustomScrollView(
                slivers: <Widget>[
                  Menus()
                ],
                shrinkWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverGrid Menus(){
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 15.0,
        childAspectRatio: 1.0,

      ),
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              //apply switch case
              var router = MaterialPageRoute(builder: (BuildContext context) {
                return blank();
              });
              Navigator.of(context).push(router);
            },
            child: Material(
              elevation: 6.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Container(child: Image.asset(getImage(index)),height: 70,width: 70,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(getText(index),textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0,),),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: 5,
      ),
    );
  }



  String getText(int index) {
    switch(index){
      case 0 : return 'Asteroids';break;
      case 1 : return 'Satellites';break;
      case 2 : return 'Stars';break;
      case 3 : return 'Constellatons';break;
      case 4 : return 'Galaxies';break;
    }
  }

  String getImage(int index) {
    switch(index){
      case 0 : return 'images/meteorite.png';break;
      case 1 : return 'images/satellite.png';break;
      case 2 : return 'images/falling-star.png';break;
      case 3 : return 'images/ursa-major.png';break;
      case 4 : return 'images/milky-way.png';break;
    }
  }
}

