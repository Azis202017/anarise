import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_jigsaw_puzzle/flutter_jigsaw_puzzle.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart' as audio;
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart' as youtube;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme/color_app.dart';
import '../../../shared/widgets/header_widget.dart';
import '../../../shared/widgets/input_header_widget.dart';
import '../controllers/ar_controller.dart';

class ArView extends GetView<ArController> with WidgetsBindingObserver {
  const ArView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void showVideoOverlay(
        BuildContext context, youtube.YoutubePlayerController youtubeC) {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
      controller.overlayEntry = OverlayEntry(
        builder: (context) => Positioned.fill(
          child: Container(
            color: Colors.black,
            child: Container(
              // Wrap Stack with Container
              color: Colors.black, // Set the background color of the Container
              child: Stack(
                children: [
                  Center(
                    child: youtube.YoutubePlayer(
                      controller: youtubeC,
                      showVideoProgressIndicator: true,
                      onReady: () {
                        youtubeC.toggleFullScreenMode();
                      },
                      onEnded: (_) {
                        SystemChrome.setPreferredOrientations(
                            [DeviceOrientation.portraitUp]);
                        controller.overlayEntry?.remove();
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              SystemChrome.setPreferredOrientations(
                                  [DeviceOrientation.portraitUp]);
                              controller.overlayEntry?.remove();
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                top: 50,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white.withOpacity(0.5),
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      Overlay.of(context).insert(controller.overlayEntry!);
    }

    return GetBuilder<ArController>(dispose: (_) {
      ambiguate(WidgetsBinding.instance)!.removeObserver(this);
      controller.player.dispose();
      for (var video in controller.controllers) {
        video.dispose();
      }
    }, initState: (_) async {
      await Permission.camera.request();
      await Permission.microphone.request();
      ambiguate(WidgetsBinding.instance)!.addObserver(this);
      controller.init();
    }, builder: (_) {
      return Scaffold(
        appBar: Header(
          leading: SizedBox(
            width: 40,
            height: 40,
            child: GestureDetector(
              child: const ImageIcon(
                NetworkImage(
                  'https://res.cloudinary.com/dkkga3pht/image/upload/v1686495248/Frame_99_2_gcpvpe.png',
                ),
                color: blueNormal,
              ),
              onTap: () {
                Get.back();
              },
            ),
          ),
          title: 'Modul Materi Belajar',
          actions: [
            controller.index == 1
                ? StreamBuilder<audio.PlayerState>(
                    stream: controller.player.playerStateStream,
                    builder: (context, snapshot) {
                      final playerState = snapshot.data;
                      final processingState = playerState?.processingState;
                      final playing = playerState?.playing;
                      if (processingState == audio.ProcessingState.loading ||
                          processingState == audio.ProcessingState.buffering) {
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          width: 24.0,
                          height: 24.0,
                          child: const CircularProgressIndicator(),
                        );
                      } else if (playing != true) {
                        return IconButton(
                          tooltip: 'Dengarkan audio disini',
                          icon: const Icon(Icons.music_note_outlined),
                          iconSize: 24.0,
                          color: blueNormal,
                          onPressed: controller.player.play,
                        );
                      } else if (processingState !=
                          audio.ProcessingState.completed) {
                        return IconButton(
                          tooltip: 'Dengarkan audio disini',
                          icon: const Icon(Icons.music_note),
                          color: blueNormal,
                          iconSize: 24.0,
                          onPressed: controller.player.pause,
                        );
                      } else {
                        return IconButton(
                          tooltip: 'Dengarkan audio disini',
                          icon: const Icon(Icons.replay),
                          color: blueNormal,
                          iconSize: 24.0,
                          onPressed: () =>
                              controller.player.seek(Duration.zero),
                        );
                      }
                    },
                  )
                : const SizedBox()
          ],
        ),
        body: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 106,
                            height: 40,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: controller.index == 0
                                      ? blueNormal
                                      : Colors.white),
                              onPressed: controller.materi,
                              child: Text('Materi',
                                  style: GoogleFonts.inter(
                                      fontSize: 13,
                                      color: controller.index == 0
                                          ? Colors.white
                                          : blueNormal)),
                            ),
                          ),
                          SizedBox(
                            width: 106,
                            height: 40,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: controller.index == 1
                                      ? blueNormal
                                      : Colors.white),
                              onPressed: controller.augmented,
                              child: Text(
                                'AR',
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  color: controller.index == 1
                                      ? Colors.white
                                      : blueNormal,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 106,
                            height: 40,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: controller.index == 2
                                      ? blueNormal
                                      : Colors.white),
                              onPressed: controller.kinestetik,
                              child: Text(
                                'Kinestetik',
                                style: GoogleFonts.inter(
                                    fontSize: 13,
                                    color: controller.index == 2
                                        ? Colors.white
                                        : blueNormal),
                              ),
                            ),
                          ),
                        ],
                      ),
                      IndexedStack(
                        index: controller.index,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: controller.detailMateri!.videos!.isEmpty
                                ? [
                                    Center(
                                      child: Lottie.network(
                                          'https://res.cloudinary.com/dkkga3pht/raw/upload/v1687330449/23403-watch-videos_izrqbi.json'),
                                    ),
                                    const Center(
                                      child: Text('Video masih kosong'),
                                    )
                                  ]
                                : controller.detailMateri!.videos!.map((data) {
                                    print(data);
                                    return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            child: Container(
                                              margin : const EdgeInsets.only(top:20),
                                              width: double.infinity,
                                              height: 187,
                                              decoration: BoxDecoration(

                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    controller
                                                        .detailMateri!.fileUrl!,
                                                  ),
                                                ),
                                              ),
                                              child: YoutubePlayer(
                                                controller:
                                                    YoutubePlayerController(
                                                  initialVideoId: YoutubePlayer
                                                      .convertUrlToId(
                                                          data.url!)!,
                                                  flags:
                                                      const YoutubePlayerFlags(
                                                    autoPlay: true,
                                                    mute: false,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          const InputHeader(
                                              text:
                                                  'Pembahasan Materi Anatomi Jantung'),
                                          const SizedBox(height: 6),
                                          const Text(
                                            'Di video ini kita akan membahas terkait dengan summary dari materi anatomi jantung yang dapat menambah wawasan lebih.',
                                          ),
                                        ]);
                                  }).toList(),
                          ),
                          Column(
                            children: [
                              const SizedBox(height: 22),
                              Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 650,
                                child: InAppWebView(
                                  initialUrlRequest: URLRequest(
                                    url: Uri.parse(
                                        controller.detailMateri!.arUrl!),
                                  ),
                                  initialOptions: InAppWebViewGroupOptions(
                                    crossPlatform: InAppWebViewOptions(
                                      mediaPlaybackRequiresUserGesture: false,
                                    ),
                                  ),
                                  onWebViewCreated:
                                      (InAppWebViewController controllerInApp) {
                                    controller.webViewController =
                                        controllerInApp;
                                  },
                                  androidOnPermissionRequest:
                                      (InAppWebViewController controller,
                                          String origin,
                                          List<String> resources) async {
                                    return PermissionRequestResponse(
                                        resources: resources,
                                        action: PermissionRequestResponseAction
                                            .GRANT);
                                  },
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              JigsawPuzzle(
                                gridSize: 3,
                                image: const AssetImage(
                                  'assets/img/bagian-jantung.jpg',
                                ),
                                onFinished: () {
                                  Get.defaultDialog(
                                    title: 'Selamat yeayy 👏',
                                    radius: 16,
                                    content: Container(
                                      margin: EdgeInsets.zero,
                                      padding: EdgeInsets.zero,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Lottie.network(
                                              'https://res.cloudinary.com/dkkga3pht/raw/upload/v1684689538/112891-puzzle-pieces_hn4rf8.json',
                                              height: 150,
                                              width: 150,
                                              fit: BoxFit.cover),
                                          const Text(
                                            'Kamu bisa menyelesaikan puzzle ini dengan akurat yeay 👏👏',
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                snapSensitivity: .5,
                                puzzleKey: controller.puzzleKey,
                              ),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await controller.puzzleKey.currentState!
                                        .generate();
                                  },
                                  child: const Text('Main Puzzle'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.summarize),
          onPressed: () {
            Get.toNamed(Routes.SUMMARY, arguments: {
              'id': controller.detailMateri!.id,
              'title': controller.detailMateri!.title,
            });
          },
        ),
      );
    });
  }
}
