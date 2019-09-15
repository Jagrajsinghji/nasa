import 'package:flutter/material.dart';
class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: CustomScrollView(
          slivers: <Widget>[
            discover(),
          ],
        ),
      ),
    ),);
  }

  SliverGrid discover() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 15.0,
        childAspectRatio: 1.0,
      ),
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return Container(
            child: Image.asset(getImage(index),fit: BoxFit.fill,),
          );
        },
        childCount: 20,
      ),
    );
  }

  String getImage(int index) {
    switch(index){
      case 0:return "images/nasa0.jpg";
             break;
      case 1:return "images/nasa1.jpg";
      break;
      case 2:return "images/nasa2.jpg";
      break;
      case 3:return "images/nasa3.png";
      break;
      case 4:return "images/nasa4.jpg";
      break;
      case 5:return "images/nasa5.jpg";
    break;
      case 6:return "images/nasa6.jpg";
      break;
      case 7:return "images/nasa7.jpg";
      break;
      case 8:return "images/nasa8.jpeg";
      break;
      case 9:return "images/nasa9.jpg";
      break;
      case 10:return "images/nasa10.jpg";
      break;
      case 11:return "images/nasa11.jpg";
      break;
      case 12:return "images/nasa12.jpg";
      break;
      case 13:return "images/nasa13.jpg";
      break;
      case 14:return "images/nasa14.jpg";
      break;
      case 15:return "images/nasa15.jpg";
      break;
      case 16:return "images/nasa16.jpg";
      break;
      case 17:return "images/nasa17.jpg";
      break;
      case 18:return "images/nasa18.jpg";
      break;
      case 19:return "images/nasa19.jpg";
      break;
    }
  }

}

