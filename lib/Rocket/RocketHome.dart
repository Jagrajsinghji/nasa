import 'package:flutter/material.dart';
import 'package:nasa/Rocket/UI/LaunchTile.dart';
import 'package:nasa/Rocket/Model/ModelClass.dart';
import 'package:nasa/Rocket/Utils/Utils.dart';

import 'UI/LaunchDetails.dart';

class RocketHome extends StatefulWidget {
  @override
  _RocketHomeState createState() => _RocketHomeState();
}

class _RocketHomeState extends State<RocketHome> {
  PageController _discoverScrollController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(11, 61, 145, 1.0),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: CustomScrollView(
            primary: true,
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[discover(), upcomingLaunches()],
          ),
        ),
      ),
    );
  }

  SliverList discover() {
    return SliverList(
        delegate: SliverChildListDelegate([
      Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Text(
          "Discover",
          style: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0, right: 15.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white70,
              border: Border.all(color: Colors.black26)),
          height: 200.0,
          child: FutureBuilder(
              future: getLaunches(),
              builder: (context, data) {
                if (data.hasData && data.data != null) {
                  List<Launch> _lauches = data.data;

                  return Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PageView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          controller: _discoverScrollController,
                          itemBuilder: (c, i) {
                            if (i < _lauches.length) {
                              String name = _lauches[i].rocket['name'] ?? " ";
                              return InkWell(onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(builder: (c) => LaunchDetails(key: Key('launchDetails'),
                                    windowStart: _lauches[i].windowStart,windowEnd: _lauches[i].windowEnd,
                                    vidURLs: _lauches[i].vidURLs,status: _lauches[i].status,name: _lauches[i].name,
                                    rocket: _lauches[i].rocket,infoURLs: _lauches[i].infoURLs,id: _lauches[i].id,
                                    holdReason: _lauches[i].holdReason,failReason: _lauches[i].failReason,))),
                                child: Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(height: 150,
                                        width: 100,child:  ClipRRect(
                                          borderRadius: BorderRadius.circular(5.0),
                                          child: Image.network(
                                            "${_lauches[i].rocket['imageURL']}",
                                            fit: BoxFit.fill,
                                          )),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                            border:
                                                Border.all(color: Colors.black),
                                            color: Colors.white70),
                                      ),
                                      Container(
                                        width: 150.0,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Text(
                                              name,
                                              style: TextStyle(fontSize: 25.0),
                                            ),
                                            Text(
                                              "${_lauches[i].windowStart}",
                                              style: TextStyle(fontSize: 15.0),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ),
                      Container(
                          height: 20.0,
                          transform: Matrix4.translationValues(220, 170, 0),
                          child: ListView.builder(
                            itemBuilder: (c, i) {
                              return Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              );
                            },
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 6,
                          )),
                      ScrollingContainer(
                        key: UniqueKey(),
                        controller: _discoverScrollController,
                      )
                    ],
                  );
                } else
                  return Center(
                      child: Text(
                    'Launching Results...',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ));
              }),
        ),
      )
    ]));
  }

  SliverList upcomingLaunches() {
    return SliverList(
        delegate: SliverChildListDelegate([
      Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Text(
          "Upcoming Launches",
          style: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          height: 500.0,
          decoration: BoxDecoration(
              color: Colors.white70, borderRadius: BorderRadius.circular(5.0)),
          child: Center(
            child: Container(
                child: FutureBuilder(
                    future: getLaunches(),
                    builder: (c, data) {
                      if (data.hasData && data.data != null) {
                        List<Launch> _lauches = data.data;

                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          physics: BouncingScrollPhysics(),
                          primary: false,
                          itemCount: _lauches.length,
                          itemBuilder: (c, i) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: LaunchTile(
                                key: Key('$i'),
                                failReason: _lauches[i].failReason,
                                holdReason: _lauches[i].holdReason,
                                id: _lauches[i].id,
                                infoURLs: _lauches[i].infoURLs,
                                name: _lauches[i].name,
                                rocket: _lauches[i].rocket,
                                status: _lauches[i].status,
                                vidURLs: _lauches[i].vidURLs,
                                windowEnd: _lauches[i].windowEnd,
                                windowStart: _lauches[i].windowStart,
                              ),
                            );
                          },
                        );
                      }
                      return Center(
                          child: Text(
                        'Launching Results...',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ));
                    })),
          ),
        ),
      )
    ]));
  }
}

/// circular container with black color on the discover tab cards which slides when we change the discover slides
class ScrollingContainer extends StatefulWidget {
  final PageController controller;

  ScrollingContainer({Key key, this.controller}) : super(key: key);

  @override
  _ScrollingContainerState createState() => _ScrollingContainerState();
}

class _ScrollingContainerState extends State<ScrollingContainer> {
  double discoverIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      discoverIndex = widget.controller.page;
      if (this.mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 20.0,
        transform:
            Matrix4.translationValues((220 + (16 * discoverIndex)), 170, 0),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
        ));
  }
}
