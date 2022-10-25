import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prodoc/src/ui/pages/term_conditions.dart';
import 'package:prodoc/src/ui/views/on_boarding_views/your_detail.dart';
import 'package:prodoc/src/ui/widgets/buttons.dart';
import 'package:prodoc/src/ui/widgets/dialog_widget.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/utils/color.dart';
import 'package:prodoc/src/utils/images.dart';
import 'package:prodoc/src/utils/nav.dart';

class YourAvatarView extends StatefulWidget {
  const YourAvatarView({Key? key}) : super(key: key);

  @override
  State<YourAvatarView> createState() => _YourAvatarViewState();
}

class _YourAvatarViewState extends State<YourAvatarView> {
  File? selectedImage;

  Future<void> selectImage({required ImageSource imageSource}) async {
    XFile? file = await ImagePicker().pickImage(source: imageSource);
    if (file != null) {
      selectedImage = File(file.path);
      setState(() {});
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return OnBoardingPageViewsBodyWidget(
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.only(bottom: 50),
            height: 180,
            width: 180,
            decoration: BoxDecoration(
              // shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(120),
              border: Border.all(color: AppColors.blueColor, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(120),
              child: selectedImage == null
                  ? Image.asset(
                      AppImages.selectedImage,
                      fit: BoxFit.fill,
                    )
                  : Image.file(
                      selectedImage!,
                      fit: BoxFit.fill,
                    ),
            ),
          ),
        ),
        Center(
          child: InkWell(
            child: DottedBorder(
              borderType: BorderType.RRect,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: AppColors.blueColor,
              dashPattern: const [6, 6],
              radius: const Radius.circular(20),
              // borderType: BorderType.Circle,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: TextButton.icon(
                  onPressed: () {
                    CustomPermissionDialog(
                      children: [
                        const Font14Weight400(
                          text: 'Add your profile picture!',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        OutlineIconButtonWidget(
                          text: 'Add from camera',
                          onPressed: () async {
                            AppNavigation.pop(context);
                            await selectImage(imageSource: ImageSource.camera);
                          },
                          icon: Icons.camera_alt_outlined,
                        ),
                        const SizedBox(height: 12),
                        OutlineIconButtonWidget(
                          text: 'Add from gallery',
                          onPressed: () async {
                            AppNavigation.pop(context);
                            await selectImage(imageSource: ImageSource.gallery);
                          },
                          icon: Icons.image_outlined,
                        ),
                      ],
                    ).show(context);
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'Add your picture',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            Checkbox(
                value: isChecked,
                onChanged: (v) {
                  isChecked = v!;
                  setState(() {});
                }),
            InkWell(
              child: Text(
                'Accept terms and conditions',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blueColor,
                    fontSize: 14),
              ),
              onTap: () {
                AppNavigation.to(context, const TermAndConditions());
              },
            )
          ],
        ),
      ],
    );
  }

  bool isChecked = false;
}
