import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/list_view_builder_hospital_views_widget.dart';

class AnesthesiaHospitalView extends StatefulWidget {
  const AnesthesiaHospitalView({Key? key}) : super(key: key);

  @override
  State<AnesthesiaHospitalView> createState() => _AnesthesiaHospitalViewState();
}

class _AnesthesiaHospitalViewState extends State<AnesthesiaHospitalView> {
  @override
  Widget build(BuildContext context) {
    return const ListBuilderWidget(itemCount: 4);
  }
}
