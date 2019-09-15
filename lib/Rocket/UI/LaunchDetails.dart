import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'RocketLaunchingAnimation.dart';

class LaunchDetails extends StatefulWidget {
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

  const LaunchDetails(
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
  _LaunchDetailsState createState() => _LaunchDetailsState();
}

class _LaunchDetailsState extends State<LaunchDetails> {
  @override
  Widget build(BuildContext context) {
    print(widget.rocket);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          LaunchScene(),
          ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color.fromRGBO(11, 61, 145, 1.0).withOpacity(0.5),
                    ),
                    child: Center(
                      child: ListTile(
                        title: Text(
                          "Name: ${widget.name}",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color.fromRGBO(11, 61, 145, 1.0).withOpacity(0.5),
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          "Time: ${widget.windowStart.split(',')[1].split(" ")[2]}",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                      ListTile(
                        trailing: CircleAvatar(
                          maxRadius: 10.0,
                          backgroundColor:
                              widget.status == 1 ? Colors.green : Colors.red,
                        ),
                        title: Text(
                          "Status:",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Date: ${widget.windowStart.split(',')[0]}",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 300.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color.fromRGBO(11, 61, 145, 1.0).withOpacity(0.5),
                  ),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(onTap: ()async{
                          var url = '${widget.rocket['wikiURL']}';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                          child: Container(
                              height: 150.0,
                              width: 150.0,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.network(
                                    "${widget.rocket['imageURL']}",
                                    fit: BoxFit.fill,
                                  ))),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top:20.0,right: 8.0,left: 8.0),
                          child: Column(crossAxisAlignment:CrossAxisAlignment.center ,children: <Widget>[
                            Text(
                              "Name: ${widget.rocket['name']}",
                              style: TextStyle(color: Colors.white, fontSize: 18.0),
                            ),
                            InkWell(onTap: ()async{
                              var url = '${widget.rocket['agencies'][0]['infoURLs'][0]}';
                              if (await canLaunch(url)) {
                              await launch(url);
                              } else {
                              throw 'Could not launch $url';
                              }
                            },
                              child: Text(
                                widget.rocket['agencies']!=null?"Family ${widget.rocket['familyname']}":    "Agency: ${widget.rocket['agencies'][0]['name']}",
                                style: TextStyle(color: Colors.white, fontSize: 18.0),
                              ),
                            ),
                          ],),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
