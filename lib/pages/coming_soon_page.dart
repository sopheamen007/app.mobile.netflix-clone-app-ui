import 'package:flutter/material.dart';
import 'package:netflix_clone/json/coming_soon_json.dart';

class ComingSoonPage extends StatefulWidget {
  @override
  _ComingSoonPageState createState() => _ComingSoonPageState();
}

class _ComingSoonPageState extends State<ComingSoonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0.0,
      title: Text(
        "Coming Soon",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
            icon: Icon(
              Icons.collections_bookmark,
              size: 28,
            ),
            onPressed: () {}),
        IconButton(
            icon: Image.asset(
              "assets/images/profile.jpeg",
              fit: BoxFit.cover,
              width: 26,
              height: 26,
            ),
            onPressed: () {}),
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.notifications_none_outlined,
                      size: 28,
                      color: Colors.white.withOpacity(0.9),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Notifications",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.9)),
                    )
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 22,
                  color: Colors.white.withOpacity(0.9),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(comingSoonJson.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 220,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        comingSoonJson[index]['img']),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2))),
                        ],
                      ),
                    ),
                    comingSoonJson[index]['duration']
                        ? Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Stack(
                                children: [
                                  Container(
                                    height: 2.5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey.withOpacity(0.7)),
                                  ),
                                  Container(
                                    width: size.width * 0.34,
                                    height: 2.5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.red.withOpacity(0.8)),
                                  )
                                ],
                              ),
                            ],
                          )
                        : Container(),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            comingSoonJson[index]['title_img'],
                            width: 120,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Icon(Icons.notifications_none_outlined),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Remind me",
                                    style: TextStyle(fontSize: 11),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                children: [
                                  Icon(Icons.info_outline),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Info",
                                    style: TextStyle(fontSize: 11),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        comingSoonJson[index]['date'],
                        style: TextStyle(color: Colors.white.withOpacity(0.5)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        comingSoonJson[index]['title'],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        comingSoonJson[index]['description'],
                        style: TextStyle(
                            height: 1.4, color: Colors.white.withOpacity(0.5)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        comingSoonJson[index]['type'],
                        style: TextStyle(
                            fontSize: 12,
                            height: 1.4,
                            color: Colors.white.withOpacity(0.9)),
                      ),
                    ),
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
