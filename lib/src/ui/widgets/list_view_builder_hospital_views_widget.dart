import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/utils/color.dart';
import 'package:prodoc/src/utils/images.dart';

class ListBuilderWidget extends StatefulWidget {
  final int itemCount;

  const ListBuilderWidget({super.key, required this.itemCount});

  @override
  State<ListBuilderWidget> createState() => _ListBuilderWidgetState();
}

class _ListBuilderWidgetState extends State<ListBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (c, i) {
        return const HospitalScreenTileData();
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemCount: widget.itemCount,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
    );
  }
}

class HospitalScreenTileData extends StatefulWidget {
  const HospitalScreenTileData({Key? key}) : super(key: key);

  @override
  State<HospitalScreenTileData> createState() => _HospitalScreenTileDataState();
}

class _HospitalScreenTileDataState extends State<HospitalScreenTileData> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.blueColor),
              borderRadius: BorderRadius.circular(120),
              color: Colors.white),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(120),
            child: Image.asset(
              AppImages.profilePerson,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Font14Weight400(
              text: 'Dr. Suresh Mishra',
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: const [
                Expanded(
                  child: Font14Weight400(
                    text:
                        'MBBS, DNB',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Font14Weight400(
                  text: 'MBBS, DNB',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                )
              ],
            )
          ],
        ))
      ],
    );
  }
}
