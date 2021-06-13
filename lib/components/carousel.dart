import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class CarouselWidget extends StatefulWidget {
  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  VideoPlayerController _controller;
  int _current = 0;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/video_001.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.setLooping(true);
    _controller.setVolume(0.0);
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    List<Widget> widgets = [
      Builder(
        builder: (BuildContext context) {
          return Center(
            child: _controller.value.initialized
                ? SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller.value.size?.width ?? 0,
                        height: _controller.value.size?.height ?? 0,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  )
                : Center(child: CircularProgressIndicator()),
          );
        },
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img_001.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img_002.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ];

    return Stack(
      children: [
        Stack(
          children: [
            Container(
              child: CarouselSlider(
                  options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                      height: queryData.size.height * 0.4,
                      viewportFraction: 1),
                  items: widgets),
            ),
            Positioned(
              width: queryData.size.width,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent
                      ],
                      begin: const FractionalOffset(0.0, 1.0),
                      end: const FractionalOffset(0.0, 0.0),
                      tileMode: TileMode.clamp),
                ),
                padding: EdgeInsets.only(left: 24, right: 24, bottom: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Learjet 60',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 30),
                        ),
                        Text(
                          '7 asientos',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 16),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.fastfood,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.wc,
                              color: Colors.white,
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 4, top: 4),
                          padding: EdgeInsets.only(
                              left: 12, right: 12, top: 2, bottom: 2),
                          decoration: BoxDecoration(
                              color: const Color(0xffEDEDED),
                              borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(5),
                                  topRight: const Radius.circular(5),
                                  bottomLeft: const Radius.circular(5),
                                  bottomRight: const Radius.circular(5))),
                          child: Center(
                            child: Text(
                              r'$ PRECIO ESTIMADO',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: const Color(0xff494949),
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        Text(
                          '14.750 USD',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'por pasajero',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              width: queryData.size.width,
              bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widgets.map((url) {
                  int index = widgets.indexOf(url);
                  return Container(
                    width: 6.0,
                    height: 6.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _current == index ? Colors.white : Colors.white30),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ],
    );
  }
}
