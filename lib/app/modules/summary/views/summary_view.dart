import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/theme/color_app.dart';
import '../../../shared/theme/font.dart';
import '../../../shared/widgets/header_widget.dart';
import '../../../shared/widgets/input_header_widget.dart';
import '../controllers/summary_controller.dart';

class SummaryView extends GetView<SummaryController> {
  const SummaryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SummaryController>(builder: (_) {
      return Scaffold(
        appBar: Header(
          title: '${controller.title} summary',
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20,
              ),
              child: InputHeader(text: 'Belajar  ${controller.title}'),
            ),
            IndexedStack(
              index: controller.index,
              children: controller.summary.map((data) {
                return FlipCardWidget(
                  image: data.front!,
                  text: data.back!,
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20,
              ),
              child: Text(
                  '${controller.index }/${controller.totalElements} '),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  controller.index > 0
                      ? OutlinedButton(
                          onPressed: controller.back,
                          child: const Text('Kembali'),
                        )
                      : const SizedBox(),
                  ElevatedButton(
                      onPressed: controller.next, child: const Text('Next'))
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class FlipCardWidget extends StatelessWidget {
  final String image;
  final String text;
  const FlipCardWidget({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      margin: const EdgeInsets.symmetric(
        horizontal: 29,
      ),
      width: double.infinity,
      height: 374,
      child: Card(
        elevation: 0.0,
        margin: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        color: blueLight,
        child: FlipCard(
          direction: FlipDirection.HORIZONTAL,
          side: CardSide.FRONT,
          speed: 500,
          onFlipDone: (status) {},
          front: Container(
            decoration: const BoxDecoration(
              color: blueLight,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  image,
                  height: 300,
                ),
              ],
            ),
          ),
          back: Container(
            decoration: const BoxDecoration(
              color: blueLight,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    text,
                    style: bodyRegular.copyWith(
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
