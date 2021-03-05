import 'package:flutter/material.dart';
import 'package:netflix_clone/json/video_detail_json.dart';
import 'package:video_player/video_player.dart';

class VideoDetailPage extends StatefulWidget {
  final String videoUrl;

  const VideoDetailPage({Key key, this.videoUrl}) : super(key: key);
  @override
  _VideoDetailPageState createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  int activeEpisode = 0;

  // for video player
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

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
      elevation: 0,
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
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
    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          _controller.value.initialized
              ? Container(
                  height: 220,
                  child: Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2))),
                      AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                              _controller.value.isPlaying
                                  ? null
                                  : Icons.play_arrow,
                              size: 50,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _controller.value.isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                              });
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        left: 5,
                        bottom: 20,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 13, left: 13, top: 8, bottom: 8),
                            child: Row(
                              children: [
                                Text(
                                  "Preview",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 5,
                        bottom: 20,
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                          child: Center(
                            child: Icon(
                              Icons.volume_mute,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : Container(
                  height: 220,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/banner.webp"),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                ),
          Container(
            height: size.height - 320,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Age of Samuria: Battle for Japan",
                      style: TextStyle(
                          height: 1.4,
                          fontSize: 28,
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "New",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "2021",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.white.withOpacity(0.2)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 6, right: 6, top: 4, bottom: 4),
                            child: Text(
                              "18+",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "1 Season",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                  width: 2,
                                  color: Colors.white.withOpacity(0.2))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 4, right: 4, top: 2, bottom: 2),
                            child: Text(
                              "HD",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Watch Season 1 Now",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: size.width,
                      height: 38,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Resume",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: size.width,
                      height: 38,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey.withOpacity(0.3)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.file_download,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Download",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "S1:E1 The Rise of Nobunaga",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (size.width - 30) * 0.75,
                          child: Stack(
                            children: [
                              Container(
                                width: (size.width - 30) * 0.75,
                                height: 2.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.withOpacity(0.5)),
                              ),
                              Container(
                                width: (size.width - 30) * 0.2,
                                height: 2.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.red.withOpacity(0.8)),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "35m remaining",
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Considered a fool and unfit to lead, Nobunaga rises to power as the head of the Oda clan, spurring dissent among those in his family vying for control.",
                      style: TextStyle(
                          height: 1.4, color: Colors.white.withOpacity(0.9)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Cast: Masayoshi Haneda, Masami Kosaka, Hideaki Ito... more",
                      style: TextStyle(
                          fontSize: 13,
                          height: 1.4,
                          color: Colors.grey.withOpacity(0.9)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: List.generate(likesList.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: Column(
                              children: [
                                Icon(
                                  likesList[index]['icon'],
                                  size: 25,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(likesList[index]['text'],
                                    style: TextStyle(
                                        fontSize: 12,
                                        height: 1.4,
                                        color: Colors.grey.withOpacity(0.9)))
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(episodesList.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                activeEpisode = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                width: 4,
                                                color: activeEpisode == index
                                                    ? Colors.red
                                                        .withOpacity(0.8)
                                                    : Colors.transparent))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Text(
                                        episodesList[index],
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: activeEpisode == index
                                                ? Colors.white.withOpacity(0.9)
                                                : Colors.white.withOpacity(0.5),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Season 1",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white.withOpacity(0.5),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(movieList.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: (size.width - 30) * 0.85,
                                    height: 100,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 150,
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: 150,
                                                height: 90,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            movieList[index]
                                                                ['img']),
                                                        fit: BoxFit.cover)),
                                              ),
                                              Container(
                                                width: 150,
                                                height: 90,
                                                decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(0.3)),
                                              ),
                                              Positioned(
                                                top: 30,
                                                left: 57,
                                                child: Container(
                                                  width: 38,
                                                  height: 38,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          width: 2,
                                                          color: Colors.white),
                                                      color: Colors.black
                                                          .withOpacity(0.4)),
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.play_arrow,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: (size.width) * 0.35,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  movieList[index]['title'],
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      height: 1.3,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white
                                                          .withOpacity(0.9)),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  movieList[index]['duration'],
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white
                                                          .withOpacity(0.5)),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: (size.width - 30) * 0.15,
                                    height: 100,
                                    child: Center(
                                      child: Icon(
                                        Icons.file_download,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                movieList[index]['description'],
                                style: TextStyle(
                                    height: 1.4,
                                    color: Colors.white.withOpacity(0.5)),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
