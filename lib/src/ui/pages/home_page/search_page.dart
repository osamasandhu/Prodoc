import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/app_bar_widget.dart';
import 'package:prodoc/src/utils/images.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var _initialData = <SearchModel>[];
  var _data = <SearchModel>[];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    _initialData = searchModel;
    _data = _initialData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Search'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.grey)),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      hintStyle: const TextStyle(
                          color: Color(0xff858889),
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                      hintText: 'Search for doctors and more...',
                    ),
                    cursorColor: Colors.grey,
                    onChanged: (c) {
                      if (c.isEmpty) {
                        _data = _initialData;
                        setState(() {});
                        return;
                      }
                      _data = _initialData.where((element) {
                        return element.title
                                .toLowerCase()
                                .contains(c.toLowerCase()) ||
                            element.specilization
                                .toLowerCase()
                                .contains(c.toLowerCase()) ||
                            element.location
                                .toLowerCase()
                                .contains(c.toLowerCase());
                      }).toList();
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  child: Image.asset(
                    AppImages.sortLogo,
                    height: 24,
                    width: 24,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Divider(),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              itemBuilder: (c, i) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue)),
                      width: 38,
                      height: 38,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: Image.asset(
                          _data[i].image ?? '',
                          fit: BoxFit.cover,
                       ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_data[i].title),
                          _greyTextList(text: _data[i].specilization),
                          _greyTextList(text: _data[i].location),
                          _data[i].distance == null
                              ? const SizedBox()
                              : Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.grey,
                                      size: 14,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    _greyTextList(
                                        text: _data[i].distance!, bottom: 0)
                                  ],
                                )
                        ],
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (c, i) {
                return const SizedBox(
                  height: 30,
                );
              },
              itemCount: _data.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _greyTextList({required String text, double? bottom}) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottom ?? 2),
      child: Text(
        text,
        style: const TextStyle(color: Colors.grey, fontSize: 10),
      ),
    );
  }
}

class SearchModel {
  String title;

  String? image;
  String specilization;
  String location;
  String? distance;

  SearchModel({
    required this.location,
    this.distance,
    this.image,
    required this.title,
    required this.specilization,
  });
}

List<SearchModel> searchModel = [
  SearchModel(
    title: 'Red Cherry Zone Hospital',
    location: 'Pune, Maharshtra',
    specilization: 'Pediatrician | Single-speciality hospital',
    distance: '0.5 km',
    image: AppImages.hospitalImage,
  ),
  SearchModel(
    title: 'Cherry Bhardwaj',
    location: 'in Red Cherry Zone Hospital',
    specilization: 'MBBS, MD | Gynaecologist',
    image: AppImages.hospitalLogo,
  ),
  SearchModel(
    title: 'Cherryl John',
    location: 'in Red Cherry Zone Hospital',
    specilization: 'MBBS, MD | Cardiologist',
    image: AppImages.onlineDoctor,
  ),
  SearchModel(
    title: 'Red Cherry Zone Hospital',
    location: 'Kolkata',
    specilization: 'Heart care center | Single-speciality hospital',
    distance: '2 km',
    image: AppImages.onlineDoctor,
  ),
  SearchModel(
    title: 'Red Cherry Zone Hospital',
    location: 'Mumbai',
    specilization: 'Trauma | Multi-speciality hospital',
    distance: '10 km',
    image: AppImages.onlineDoctor,
  ),
];
