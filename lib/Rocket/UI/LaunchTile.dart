import 'package:flutter/material.dart';

class LaunchTile extends StatefulWidget {
 final int  id;
 final String  name;
 final Map  rocket;
 final int  status;
 final String  windowStart;
 final String  windowEnd;
 final List  infoURLs;
 final List  vidURLs;
 final String  holdReason;
 final String  failReason;

  const LaunchTile({Key key, this.id, this.name, this.rocket, this.status, this.windowStart, this.windowEnd, this.infoURLs, this.vidURLs, this.holdReason, this.failReason}) : super(key: key);

  @override
  _LaunchTileState createState() => _LaunchTileState();
}

class _LaunchTileState extends State<LaunchTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (c) => null)),
        child: Container(
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            border: Border.all(color: Colors.black),
            color: Colors.white70,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
