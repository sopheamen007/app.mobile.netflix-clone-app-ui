import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netflix_clone/pages/home_page.dart';
import 'package:netflix_clone/pages/video_detail_page.dart';

class DownloadPage extends StatefulWidget {
  @override
  _DownloadPageState createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
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
        "My Downloads",
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Icon(Icons.info_outline),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Smart Downloads",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "ON",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 60,
        ),
        Column(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey.withOpacity(0.2)),
              child: Center(
                child: Icon(
                  Icons.file_download,
                  size: 80,
                  color: Colors.grey.withOpacity(0.3),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Never be without Netflix",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Text(
                "Download shows and movies so you'll never be without something to watch even when you're offline",
                style: TextStyle(
                    height: 1.5, fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Center(
                    child: Text(
                      "See What You Can Download",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Spacer()
      ],
    );
  }
}
