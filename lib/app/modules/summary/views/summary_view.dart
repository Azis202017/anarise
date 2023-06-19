import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/widgets/input_header_widget.dart';
import '../controllers/summary_controller.dart';

class SummaryView extends GetView<SummaryController> {
  const SummaryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SummaryController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Line Progress Indicator'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InputHeader(text: 'Belajar Anatomi Jantung'),
            IndexedStack(

              index: controller.index,
              children: controller.summary.map((data) {
                return FlipCardWidget(image: data.front!);
              }).toList(),
            ),
            Text('${controller.index}/${controller.totalElements } '),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed:
                      controller.back ,
                  child: const Text( 'Kembali'),
                ),
                ElevatedButton(
                    onPressed: controller.next, child: const Text('Next'))
              ],
            ),
          ],
        ),
      );
    });
  }
}

class FlipCardWidget extends StatelessWidget {
  final String image;
  const FlipCardWidget({
    super.key,
    required this.image,
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
        color: const Color(0x00000000),
        child: FlipCard(
          direction: FlipDirection.HORIZONTAL,
          side: CardSide.FRONT,
          speed: 500,
          onFlipDone: (status) {},
          front: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF006666),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Image.network(image)],
            ),
          ),
          back: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF006666),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Title', style: Theme.of(context).textTheme.displayLarge),
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
