import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:get/get.dart';

import '../../../shared/theme/color_app.dart';
import '../../../shared/widgets/header_widget.dart';
import '../controllers/isi_survey_controller.dart';

class IsiSurveyView extends GetView<IsiSurveyController> {
  const IsiSurveyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Isi Survey',
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
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(
            'https://larvaacademy.id/abdimasy-survey/${controller.id}',
          ),
        ),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            mediaPlaybackRequiresUserGesture: false,
          ),
        ),
        onWebViewCreated: (InAppWebViewController controllerInApp) {
          controller.webViewController = controllerInApp;
        },
      ),
    );
  }
}
