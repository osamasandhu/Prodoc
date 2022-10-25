import 'package:flutter/material.dart';

import '../../utils/images.dart';

class TopLogoContainerWidget extends StatelessWidget {
  final bool? imageRequired;
  final String? url;

  const TopLogoContainerWidget({Key? key, this.imageRequired = false, this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 45),
              child: Image.asset(AppImages.logo),
            ),
            imageRequired == true
                ? Image.asset(
                    url ?? '',
                    height: 239,
                    width: MediaQuery.of(context).size.width,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
