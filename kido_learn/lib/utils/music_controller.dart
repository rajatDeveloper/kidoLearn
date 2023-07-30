import 'dart:convert';

import 'package:just_audio/just_audio.dart';
import 'package:flutter/services.dart';
import 'package:kido_learn/utils/assets.dart';

class MusicController {
  static AudioPlayer audioPlayer = AudioPlayer();

  static bool isPlaying = true;

  static void loadAndPlayMusic() async {
    // ByteData data = await rootBundle
    //     .load(musicFile); // Replace with your actual asset file path

    // // Convert the asset data to base64
    // String audioUri =
    //     'data:audio/mp3;base64,' + base64Encode(data.buffer.asUint8List());

    await audioPlayer.setAsset(musicFile);
    audioPlayer.setLoopMode(LoopMode.one);
    await audioPlayer.play();
    isPlaying = true;
  }

  static void playMusic() async {
    isPlaying = true;
    await audioPlayer.play();
  }

  static void pauseMusic() async {
    isPlaying = false;
    await audioPlayer.pause();
  }
}
