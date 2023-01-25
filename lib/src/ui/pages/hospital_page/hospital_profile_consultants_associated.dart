import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/views/hospital_profile_consultants_associated_views/anesthesia_hospital_view.dart';
import 'package:prodoc/src/ui/views/hospital_profile_consultants_associated_views/dermatology_hospital_view.dart';
import 'package:prodoc/src/ui/views/hospital_profile_consultants_associated_views/ent_hospital_view.dart';
import 'package:prodoc/src/ui/views/hospital_profile_consultants_associated_views/gynaecology_hospital_view.dart';
import 'package:prodoc/src/ui/views/hospital_profile_consultants_associated_views/orthopedic_hospital_view.dart';
import 'package:prodoc/src/ui/views/hospital_profile_consultants_associated_views/radiology_hospital_view.dart';
import 'package:prodoc/src/ui/widgets/app_bar_widget.dart';
import 'package:prodoc/src/utils/color.dart';

class HospitalConsultantPage extends StatefulWidget {
  final int? page;

  const HospitalConsultantPage({super.key, this.page});

  @override
  State<HospitalConsultantPage> createState() => _HospitalConsultantPageState();
}

class _HospitalConsultantPageState extends State<HospitalConsultantPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: 6, vsync: this, initialIndex: widget.page ?? 0);
  }


  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBarWidget(
        title: 'Consultants associated',
        backgroundColor: AppColors.greenColor,
      ),
      body:
      Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          TabBar(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              unselectedLabelColor: Colors.black,
              labelStyle:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              unselectedLabelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              labelColor: AppColors.blueColor,
              isScrollable: true,
              controller: tabController,
              tabs: const [
                Tab(
                  text: 'Orthopedic',
                ),
                Tab(
                  text: 'Dermatology',
                ),
                Tab(
                  text: 'Radiology',
                ),
                Tab(
                  text: 'Anesthesia',
                ),
                Tab(
                  text: 'ENT',
                ),
                Tab(
                  text: 'Gynaecology',
                ),
              ]),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                OrthopedicHospitalView(),
                DermatologyHospitalView(),
                RadiologyHospitalView(),
                AnesthesiaHospitalView(),
                EntHospitalView(),
                GynaecologyHospitalView()
              ],
            ),
          )
        ],
      ),
    );
  }
}
