import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_jigsaw_puzzle/flutter_jigsaw_puzzle.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../data/model/detail_materi_model.dart';
import '../../../shared/services/detail_materi_service.dart';

class ArController extends GetxController {
  InAppWebViewController? webViewController;
  String id = Get.arguments['id'];
  String urlAudio = Get.arguments['urlAudio'];
  final puzzleKey = GlobalKey<JigsawWidgetState>();
  int index = 0;
  void materi() {
    index = 0;
    update();
  }

  void augmented() {
    index = 1;
    update();
  }

  void kinestetik() {
    index = 2;
    update();
  }

  final List<YoutubePlayerController> controllers = [];
  OverlayEntry? overlayEntry;
  bool isLoading = true;
  DetailMateriModel? detailMateri;
  @override
  void onInit() {
    super.onInit();
    
    fetchDetailMateri();
  }

  void fetchDetailMateri() async {
    detailMateri = await DetailMateriService().getDetailMateri(id: id);
    isLoading = false;
    update();
  }

  final player = AudioPlayer();
  Future<void> init() async {
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      throw Exception(e);
    });
    // Try to load audio from a source and catch any errors.
    try {
      // AAC example: https://dl.espressif.com/dl/audio/ff-16b-2c-44100hz.aac
      await player.setAudioSource(AudioSource.uri(Uri.parse(urlAudio)));
      print(urlAudio);
    } catch (e) {
      throw Exception(e);
    }
  }
}
