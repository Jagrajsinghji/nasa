import 'package:flutter/material.dart';

import 'LaunchDetails.dart';

class LaunchTile extends StatefulWidget {
  final int id;
  final String name;
  final Map rocket;
  final int status;
  final String windowStart;
  final String windowEnd;
  final List infoURLs;
  final List vidURLs;
  final String holdReason;
  final String failReason;

  const LaunchTile(
      {Key key,
      this.id,
      this.name,
      this.rocket,
      this.status,
      this.windowStart,
      this.windowEnd,
      this.infoURLs,
      this.vidURLs,
      this.holdReason,
      this.failReason})
      : super(key: key);

  @override
  _LaunchTileState createState() => _LaunchTileState();
}

class _LaunchTileState extends State<LaunchTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () =>
            Navigator.of(context).push(MaterialPageRoute(builder: (c) => LaunchDetails(key: Key('launchDetails'),
            windowStart: widget.windowStart,windowEnd: widget.windowEnd,
            vidURLs: widget.vidURLs,status: widget.status,name: widget.name,
            rocket: widget.rocket,infoURLs: widget.infoURLs,id: widget.id,
            holdReason: widget.holdReason,failReason: widget.failReason,))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              border: Border.all(color: Colors.black),
              color: Colors.transparent),

          ///1 Green, 2 Red, 3 Success, 4 Failed
          child: Stack(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(7.0),
                  child: Image.network(
                    "${widget.rocket['imageURL']}",
                    height: 180,width: double.infinity,
                    fit: BoxFit.fill,
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.name,
                    style: TextStyle(color: Colors.white, fontSize: 18.0,fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.windowStart,
                      style: TextStyle(color: Colors.white, fontSize: 15.0,fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
