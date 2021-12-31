import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class IntroductionVideo extends StatefulWidget {
  final String videoId;
  IntroductionVideo({required this.videoId});

  @override
  _IntroductionVideoState createState() => _IntroductionVideoState();
}

class _IntroductionVideoState extends State<IntroductionVideo> {
  YoutubePlayerController? _controller;

  @override
  void dispose() {
    super.dispose();
    log("Going to dispose method");
    _controller!.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Intro Video"),
      ),
      body: YoutubePlayer(
        controller: _controller!,
        showVideoProgressIndicator: true,
      ),
    );
  }
}
