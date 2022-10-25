import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/list_view_builder_hospital_views_widget.dart';

class GynaecologyHospitalView extends StatefulWidget {
  const GynaecologyHospitalView({Key? key}) : super(key: key);

  @override
  State<GynaecologyHospitalView> createState() => _GynaecologyHospitalViewState();
}

class _GynaecologyHospitalViewState extends State<GynaecologyHospitalView> {
  @override
  Widget build(BuildContext context) {
    return const ListBuilderWidget(itemCount: 3);
  }
}
