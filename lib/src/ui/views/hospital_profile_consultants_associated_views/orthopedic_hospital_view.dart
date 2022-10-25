import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/list_view_builder_hospital_views_widget.dart';

class OrthopedicHospitalView extends StatefulWidget {
  const OrthopedicHospitalView({Key? key}) : super(key: key);

  @override
  State<OrthopedicHospitalView> createState() => _OrthopedicHospitalViewState();
}

class _OrthopedicHospitalViewState extends State<OrthopedicHospitalView> {
  @override
  Widget build(BuildContext context) {
    return const ListBuilderWidget(itemCount: 7);
  }
}
