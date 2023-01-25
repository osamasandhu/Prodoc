import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/views/home/home_view.dart';
import 'package:prodoc/src/ui/views/home/community_view.dart';
import 'package:prodoc/src/ui/views/home/services_view.dart';
import 'package:prodoc/src/ui/widgets/app_bar_widget.dart';
import 'package:prodoc/src/ui/widgets/bottom_nav_widget.dart';
import 'package:prodoc/src/ui/widgets/drawer.dart';
import 'package:prodoc/src/utils/app_utils.dart';

class HomePage extends StatefulWidget {
  final UserType userType;

  const HomePage({Key? key, required this.userType}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var _currentIndex = 0;
  int? _referIndex;

  onChange(int index) {
    _currentIndex = index;
    setState(() {});
  }

  late List<Widget> _widgets;

  void startViews() {
    _widgets = [
      BottomHomeView(
        onTapSent: () {
          _currentIndex = 1;
          _referIndex = 0;
          // startViews();
          setState(() {});
        },
        onTapReceived: () {
          _currentIndex = 1;
          _referIndex = 1;
          // startViews();
          setState(() {});
        },
      ),
      const Text('Referral'),
      AppSwitchCaseUtils.viewForCreateTaskManage(widget.userType),
      const CommunityView(),
      const ServicesView()
    ];
  }

  @override
  void initState() {
    super.initState();
    startViews();
  }

  // Color color = const Color(0xfffafafa);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title:AppSwitchCaseUtils.appBar(
          _currentIndex,
          userType: widget.userType,
        ),
        centerTitle: true,
      ),
      body: _widgets[_currentIndex],
      drawer: const AppDrawer(),
      bottomNavigationBar: BottomNavWidget(
        currentIndex: _currentIndex,
        onChanged: onChange,
        userType: widget.userType,
      ),
    );
  }
}
