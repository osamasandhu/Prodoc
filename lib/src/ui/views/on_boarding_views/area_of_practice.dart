import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/views/on_boarding_views/your_detail.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/utils/app_utils.dart';
import 'package:prodoc/src/utils/color.dart';

class AreaOfPracticeView extends StatefulWidget {
  final double? padding;

  const AreaOfPracticeView({Key? key, this.padding}) : super(key: key);

  @override
  State<AreaOfPracticeView> createState() => _AreaOfPracticeViewState();
}

class _AreaOfPracticeViewState extends State<AreaOfPracticeView> {
  @override
  Widget build(BuildContext context) {
    return OnBoardingPageViewsBodyWidget(
      padding: widget.padding ?? 24,
      children: [
        cityTownNameWidget(),
        _citiesListWidget(),
        DropDownListUtils.selectedCities.isEmpty
            ? const SizedBox()
            : searchField(),
        DropDownListUtils.selectedCities.isEmpty
            ? const SizedBox()
            : _textWidget(text: 'Your selected cities/towns'),
        const SizedBox(
          height: 20,
        ),
        for (int i = 0; i < DropDownListUtils.selectedCities.length; i++)
          selectedCitiesWidget(i: i)
      ],
    );
  }

  Widget _textWidget({required String text, double? fontSize}) {
    return Font14Weight400(
      text: text,
      fontSize: fontSize ?? 14,
    );
  }

  Widget cityTownNameWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _textWidget(
            text: 'Select city/town names',
          ),
          _textWidget(text: 'MAXIMUM 5', fontSize: 10),
        ],
      ),
    );
  }

  Widget _citiesListWidget() {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      children: [
        for (int j = 0; j < DropDownListUtils.cities.length; j++)
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: DropDownListUtils.selectedCities
                        .contains(DropDownListUtils.cities[j])
                    ? AppColors.blueColor
                    : null,
                border: Border.all(color: AppColors.blueColor),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                DropDownListUtils.cities[j],
                style: TextStyle(
                  color: DropDownListUtils.selectedCities
                          .contains(DropDownListUtils.cities[j])
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
            onTap: () {
              if (DropDownListUtils.selectedCities
                  .contains(DropDownListUtils.cities[j])) {
                DropDownListUtils.selectedCities
                    .remove(DropDownListUtils.cities[j]);
                setState(() {});
              } else {
                if (DropDownListUtils.selectedCities.length < 5) {
                  if (!DropDownListUtils.selectedCities
                      .contains(DropDownListUtils.cities[j])) {
                    DropDownListUtils.selectedCities
                        .add(DropDownListUtils.cities[j]);
                    setState(() {});
                  }
                }
              }
            },
          )
      ],
    );
  }

  Widget searchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: TextFormField(
        // controller: _phone,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          hintText: 'Search for city/town names',
          hintStyle: TextStyle(
            color: AppColors.greyText,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.greyText,
          ),
        ),
      ),
    );
  }

  Widget selectedCitiesWidget({required int i}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.blueColor)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              DropDownListUtils.selectedCities[i],
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
          ),
          InkWell(
              onTap: () {
                DropDownListUtils.selectedCities.removeAt(i);
                setState(() {});
              },
              child: const Icon(Icons.cancel_outlined))
        ],
      ),
    );
  }
}
