import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/page_view_widgets.dart';
import 'package:prodoc/src/utils/images.dart';

class MediaSlider extends StatefulWidget {
  const MediaSlider({Key? key}) : super(key: key);

  @override
  State<MediaSlider> createState() => _MediaSliderState();
}

class _MediaSliderState extends State<MediaSlider> {
  final _mediaPageController = PageController(initialPage: 0);
  int _mediaCurrentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedContainer(
        child: Column(
          children: [
            SizedBox(
              height: 330,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _mediaPageController,
                onPageChanged: (page) => setState(
                  () => _mediaCurrentPage = page,
                ),
                itemBuilder: (c, i) {
                  return Image.asset(AppImages.mediaHospital);
                },
                itemCount: 5,
              ),
            ),
            SliderDotsWidget(currentPage: _mediaCurrentPage, list: 5)
          ],
        ),
      ),
    );
  }
}
