import 'dart:io';

import 'package:flutter/material.dart';


class imageScreen extends StatefulWidget {

  final File Image;

  const imageScreen({Key key, this.Image}) : super(key: key);

  @override
  _imageScreenState createState() => _imageScreenState();
}

class _imageScreenState extends State<imageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Image Captured',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0,color: Colors.orangeAccent,),textAlign: TextAlign.center,),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 400.0,
            height: 400.0,
            child:  Image.file(
                widget.Image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 50, 8, 8),
            child: Container(
              height: 60.0,
              width: 150.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.green,
                  onPressed: () {
                  //  sendImage(context);
                  },
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.near_me),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(3, 8, 8, 8),
                        child: Text(
                          'NEXT',
                          style: TextStyle(
                              color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
