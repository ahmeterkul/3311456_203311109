// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';

class videolar extends StatefulWidget {
  final String url;

  const videolar({super.key, required this.url});

  @override
  State<videolar> createState() => _videolarState();
}

class _videolarState extends State<videolar> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

      videoPlayerController = VideoPlayerController.asset(widget.url);
      chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          aspectRatio: 16 / 9,
          autoPlay: true);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Chewie(controller: chewieController));
  }
}
