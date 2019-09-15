import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'imageSreen.dart';

class wildFire extends StatefulWidget {
  @override
  _wildFireState createState() => _wildFireState();
}

class _wildFireState extends State<wildFire> {

  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Wild Fire',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0,color: Colors.orangeAccent,),textAlign: TextAlign.center,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openCamera();
        },
        tooltip: 'fire',
        child: Image.asset('images/fire.png'),
        elevation: 2.0,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 65.0,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0,right: 50.0),
            child: Text("Report A Fire",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0,color: Colors.orangeAccent,),textAlign: TextAlign.center,),
          ),
        ),
      ),
    );
  }

  Future<void> openCamera() async {
    var image = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    if(image!=null){
    setState(() {
      _image = image;
    });

    ///bridge for next screen
    var router = MaterialPageRoute(builder: (BuildContext context) {
      return imageScreen(Image: _image,);
    });
    ///calling next screen
    Navigator.of(context).push(router);}
  }

}
