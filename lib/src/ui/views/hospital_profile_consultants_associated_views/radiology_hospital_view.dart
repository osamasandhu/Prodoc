import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/list_view_builder_hospital_views_widget.dart';

class RadiologyHospitalView extends StatefulWidget {
  const RadiologyHospitalView({Key? key}) : super(key: key);

  @override
  State<RadiologyHospitalView> createState() => _RadiologyHospitalViewState();
}

class _RadiologyHospitalViewState extends State<RadiologyHospitalView> {
  @override
  Widget build(BuildContext context) {
    return const ListBuilderWidget(itemCount: 17);
  }
}
