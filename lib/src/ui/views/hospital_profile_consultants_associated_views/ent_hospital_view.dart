import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/widgets/list_view_builder_hospital_views_widget.dart';

class EntHospitalView extends StatefulWidget {
  const EntHospitalView({Key? key}) : super(key: key);

  @override
  State<EntHospitalView> createState() => _EntHospitalViewState();
}

class _EntHospitalViewState extends State<EntHospitalView> {
  @override
  Widget build(BuildContext context) {
    return const ListBuilderWidget(itemCount: 1);
  }
}
