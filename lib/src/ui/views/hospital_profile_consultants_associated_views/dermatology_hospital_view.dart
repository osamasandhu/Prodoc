import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/list_view_builder_hospital_views_widget.dart';

class DermatologyHospitalView extends StatefulWidget {
  const DermatologyHospitalView({Key? key}) : super(key: key);

  @override
  State<DermatologyHospitalView> createState() => _DermatologyHospitalViewState();
}

class _DermatologyHospitalViewState extends State<DermatologyHospitalView> {
  @override
  Widget build(BuildContext context) {
    return const ListBuilderWidget(itemCount: 2);
  }
}
