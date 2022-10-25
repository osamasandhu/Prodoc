import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/views/on_boarding_views/your_detail.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/utils/color.dart';

class AreaOfPracticeView extends StatefulWidget {
final  double? padding;

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
        selectedCities.isEmpty ? const SizedBox() : searchField(),
        selectedCities.isEmpty
            ? const SizedBox()
            : _textWidget(text: 'Your selected cities/towns'),
        const SizedBox(
          height: 20,
        ),
        for (int i = 0; i < selectedCities.length; i++)
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
        for (int j = 0; j < cities.length; j++)
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: selectedCities.contains(cities[j])
                    ? AppColors.blueColor
                    : null,
                border: Border.all(color: AppColors.blueColor),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                cities[j],
                style: TextStyle(
                  color: selectedCities.contains(cities[j])
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
            onTap: () {
              if (selectedCities.contains(cities[j])) {
                selectedCities.remove(cities[j]);
                setState(() {});
              } else {
                if (selectedCities.length < 5) {
                  if (!selectedCities.contains(cities[j])) {
                    selectedCities.add(cities[j]);
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
              selectedCities[i],
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
          ),
          InkWell(
              onTap: () {
                selectedCities.removeAt(i);
                setState(() {});
              },
              child: const Icon(Icons.cancel_outlined))
        ],
      ),
    );
  }

  List<String> cities = [
    'City A',
    'Town B',
    'City/town Abc',
    'Town I',
    'City/town xyz',
    'City E',
    'Town F',
    'City/town ghf',
    'Town h',
    'City/town faf',
  ];
  List<String> selectedCities = [
    'City A',
    'City/town faf',
    'Town h',
  ];
}
