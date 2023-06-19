import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme/color_app.dart';
import '../../../shared/widgets/header_widget.dart';
import '../../../shared/widgets/input_header_widget.dart';
import '../controllers/ar_controller.dart';

class ArView extends GetView<ArController> with WidgetsBindingObserver {
  const ArView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArController>(dispose: (_) {
      ambiguate(WidgetsBinding.instance)!.removeObserver(this);
    }, initState: (_) async {
      await Permission.camera.request();
      await Permission.microphone.request();
      ambiguate(WidgetsBinding.instance)!.addObserver(this);
    }, builder: (_) {
      return Scaffold(
          appBar: const Header(
            title: 'Modul Materi Belajar',
          ),
          body: controller.isLoading ? const Center(child: CircularProgressIndicator()) : SingleChildScrollView(
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
                        children: [
                          Container(
                            width: double.infinity,
                            height: 187,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    controller.detailMateri!.fileUrl!),
                              ),
                            ),
                            child: const Center(
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.play_arrow_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          const InputHeader(
                              text: 'Pembahasan Materi Anatomi Jantung'),
                          const SizedBox(height: 6),
                          const Text(
                            'Di video ini kita akan membahas terkait dengan summary dari materi anatomi jantung yang dapat menambah wawasan lebih.',
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  child: const Text(
                                    'Lihat Summary Materi',
                                  ),
                                  onPressed: () {
                                    Get.toNamed(Routes.SUMMARY);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  
                      Column(
                        children: [
                          const SizedBox(height:22),
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
                                controller.webViewController = controllerInApp;
                              },
                              androidOnPermissionRequest:
                                  (InAppWebViewController controller, String origin,
                                      List<String> resources) async {
                                return PermissionRequestResponse(
                                    resources: resources,
                                    action: PermissionRequestResponseAction.GRANT);
                              },
                            ),
                          ),
                        ],
                      ),
                      const Text(''),
                    ],
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
