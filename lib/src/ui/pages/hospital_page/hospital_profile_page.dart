import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:prodoc/src/ui/pages/drawer/profile/profile_page.dart';
import 'package:prodoc/src/ui/pages/hospital_page/hospital_blog_detail_page.dart';
import 'package:prodoc/src/ui/pages/hospital_page/hospital_profile_consultants_associated.dart';
import 'package:prodoc/src/ui/widgets/text.dart';
import 'package:prodoc/src/utils/color.dart';
import 'package:prodoc/src/utils/const.dart';
import 'package:prodoc/src/utils/images.dart';
import 'package:prodoc/src/utils/nav.dart';

class HospitalProfilePage extends StatefulWidget {
  const HospitalProfilePage({Key? key}) : super(key: key);

  @override
  State<HospitalProfilePage> createState() => _HospitalProfilePageState();
}

class _HospitalProfilePageState extends State<HospitalProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopContainer(),
            const _HospitalProfilePageData(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.greenColor,
        image: const DecorationImage(
          image: AssetImage(AppImages.hospitalImage),
          colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          _buildTopButtonRow(),
          Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(120),
                  color: Colors.white),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(120),
                child: Image.asset(
                  AppImages.hospitalLogo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Font14Weight500Blue(
            text: 'MYTHRI HOSPITAL',
            fontSize: 16,
            textAlign: TextAlign.center,
            textColor: Colors.white,
          ),
          const Font14Weight500Blue(
            text: 'Health and Wellness Support ',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
            textColor: Colors.white,
          ),
          const SizedBox(
            height: 4,
          ),
          const Font14Weight500Blue(
            text: 'Ayodhya nagar, Sadashiv nagar,Belgum',
            fontSize: 10,
            fontWeight: FontWeight.w300,
            textAlign: TextAlign.center,
            textColor: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              _buildWhiteContainerButton(
                onTap: () {},
                child: Row(
                  children: const [
                    Icon(Icons.call),
                    SizedBox(
                      width: 5,
                    ),
                    Font14Weight500Blue(
                      text: 'Appointment',
                      fontSize: 12,
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              _buildWhiteContainerButton(
                onTap: () {},
                child: Image.asset(AppImages.email,height: 24,width: 24,),
              ),
            ],
          ),
          Row(
            children: [
              _buildWhiteContainerButton(
                onTap: () {},
                child: Row(
                  children: const [
                    Icon(
                      Icons.call,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Font14Weight500Blue(
                      text: 'Emergency   ',
                      fontSize: 12,
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              _buildWhiteContainerButton(
                  child: Image.asset(AppImages.location,height: 24,width: 24,)),
              _buildWhiteContainerButton(
                  child: Image.asset(AppImages.language,height: 24,width: 24,)),
              _buildWhiteContainerButton(
                  child: Image.asset(AppImages.facebook,height: 24,width: 24,)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildWhiteContainerButton(
      {VoidCallback? onTap, required Widget child}) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        margin: const EdgeInsets.only(right: 5, top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        padding: const EdgeInsets.all(5),
        child: child,
      ),
    );
  }

  Widget _buildTopButtonRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          ProfilePagesIconButtons(
            onTap: () {
              AppNavigation.pop(context);
            },
            icon: Icons.arrow_back,
          ),
          const Spacer(),
          ProfilePagesIconButtons(
            onTap: () {},
            icon: Icons.share_outlined,
          ),
          const SizedBox(
            width: 10,
          ),
          ProfilePagesIconButtons(
            onTap: () {},
            icon: Icons.notifications_none,
          ),
        ],
      ),
    );
  }
}

class _HospitalProfilePageData extends StatefulWidget {
  const _HospitalProfilePageData({Key? key}) : super(key: key);

  @override
  State<_HospitalProfilePageData> createState() =>
      _HospitalProfilePageDataState();
}

class _HospitalProfilePageDataState extends State<_HospitalProfilePageData> {
  bool showFacilities = false;
  bool showDepartments = false;
  bool showConsultants = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGreen16SizeText(title: 'About Us', top: 0),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: RichText(
                text: TextSpan(
                  text: loremIpsum.length < 250
                      ? loremIpsum + loremIpsum
                      : loremIpsum.substring(0, 250),
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w300,
                    color: AppColors.greyText,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      text: 'Know more',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.greenColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildGreen16SizeText(title: 'Accreditation'),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 40),
              child: Row(
                children: [
                  Image.asset(AppImages.accreditationLogo),
                  Image.asset(AppImages.accreditationLogo1),
                ],
              ),
            ),
            _buildExpansionTile(
                title: 'Facilities',
                show: showFacilities,
                onTap: () {
                  showFacilities = !showFacilities;

                  setState(() {});
                }),
            showFacilities ? _buildFacilitiesGrid() : const SizedBox(),
            showFacilities ? const SizedBox() : const Divider(height: 30),
            _buildExpansionTile(
                title: 'Departments',
                show: showDepartments,
                onTap: () {
                  showDepartments = !showDepartments;

                  setState(() {});
                }),
            showDepartments ? _buildDepartmentsGrid() : const SizedBox(),
            showDepartments ? const SizedBox() : const Divider(height: 30),
            _buildExpansionTile(
                title: 'Consultants associated',
                show: showConsultants,
                onTap: () {
                  showConsultants = !showConsultants;

                  setState(() {});
                }),
            showConsultants ? _buildConsultantGrid() : const SizedBox(),
            showConsultants ? const SizedBox() : const Divider(height: 30),
            _buildGreen16SizeText(title: 'Media'),
            _buildMediaSlider(),
            _buildDoctorsSlider(),
            _buildPageViewDots(
                currentPage: _doctorCurrentPage, listLength: doctorList.length),
            const SizedBox(
              height: 40,
            ),
            _buildGreen16SizeText(title: 'Our Blogs'),
            _buildBlogsSlider(),
            _buildGreen16SizeText(title: 'Insurance policies'),
            _buildInsurancePolicies(),
          ],
        ),
      ),
    );
  }

  final _mediaPageController = PageController(initialPage: 0);
  final _doctorPageController = PageController(initialPage: 0);
  final _blogsPageController =
      PageController(initialPage: 0, viewportFraction: 0.8);
  final _insurancePageController =
      PageController(initialPage: 0, viewportFraction: 0.8);
  int _policiesCurrentPage = 0;
  int _mediaCurrentPage = 0;
  int _blogsCurrentPage = 0;
  int _doctorCurrentPage = 0;

  Widget _buildMediaSlider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: _elevatedContainer(
          child: Column(
        children: [
          SizedBox(
            height: 330,
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _mediaPageController,
              onPageChanged: (page) => setState(
                () => _mediaCurrentPage = page,
              ),
              itemBuilder: (c, i) {
                return Image.asset(AppImages.mediaHospital);
              },
              itemCount: mediaList.length,
            ),
          ),
          _buildPageViewDots(
              currentPage: _mediaCurrentPage, listLength: mediaList.length)
        ],
      )),
    );
  }

  Widget _buildDoctorsSlider() {
    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 35,
        ),
        child: PageView.builder(
          physics: const BouncingScrollPhysics(),
          controller: _doctorPageController,
          onPageChanged: (page) => setState(
            () => _doctorCurrentPage = page,
          ),
          itemBuilder: (c, i) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
              child: _elevatedContainer(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        width: 94.15,
                        height: 94.15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.blueColor)),
                        child: Image.asset(AppImages.onlineDoctor),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Expanded(
                            child: Font14Weight400(
                                text: 'Lead Consultant', fontSize: 10),
                          ),
                          Expanded(
                            child: Font14Weight500Blue(
                              text: 'Dr. Seema Deshmukh',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Expanded(
                            child: Font14Weight400(
                              text: 'Lead Consultant',
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            child: Font14Weight400(
                              text: 'Orthopedic',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )),
                    ],
                  )),
            );
          },
          itemCount: doctorList.length,
        ),
      ),
    );
  }

  Widget _buildBlogsSlider() {
    return SizedBox(
      height: 410,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _blogsPageController,
        onPageChanged: (page) => setState(
          () => _blogsCurrentPage = page,
        ),
        itemBuilder: (c, i) {
          return InkWell(
            onTap: () {
              AppNavigation.to(
                context,
                const HospitalBlogDetailPage(),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: _elevatedContainer(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                        child: Image.asset(
                          AppImages.hospitalBlog,
                          height: 186,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 16, left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Font14Weight500Blue(
                              text: 'Conditions Treated with Arthroscopy',
                              textColor: AppColors.greenColor,
                            ),
                            Font14Weight400(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              text: 'August 10, 2022',
                              fontSize: 10,
                              textColor: AppColors.greyText,
                            ),
                            RichText(
                              text: TextSpan(
                                text: loremIpsum.length < 120
                                    ? loremIpsum + loremIpsum + loremIpsum
                                    : loremIpsum.substring(0, 120),
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    height: 1.3,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.black),
                                children: [
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                    text: 'Know more',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.greenColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInsurancePolicies() {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _insurancePageController,
        onPageChanged: (page) => setState(
          () => _policiesCurrentPage = page,
        ),
        itemBuilder: (c, i) {
          return InkWell(
            onTap: () {},
            child: Padding(
                padding: const EdgeInsets.all(5),
                child: _elevatedContainer(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColors.greenColor)),
                          child: Image.asset(AppImages.insurancePolicies),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Font14Weight400(
                                text: 'Insurance provider name', fontSize: 10),
                            const SizedBox(
                              height: 4,
                            ),
                            Font14Weight500Blue(
                              text: 'Insurance name',
                              textColor: AppColors.greenColor,
                              fontWeight: FontWeight.w600,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Expanded(
                              child: Text(
                                loremIpsum + loremIpsum,
                                maxLines: 6,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        )),
                      ],
                    ))),
          );
        },
      ),
    );
  }

  _buildPageViewDots({required int currentPage, required int listLength}) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < listLength; i++)
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: CircleAvatar(
                radius: 5,
                backgroundColor:
                    currentPage == i ? AppColors.blueColor : AppColors.greyText,
              ),
            )
        ],
      ),
    );
  }

  Widget _buildExpansionTile(
      {required String title,
      required bool show,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        color: show ? const Color(0xffF5F5F5) : null,
        margin: EdgeInsets.only(bottom: show ? 24 : 0),
        child: Row(
          children: [
            Expanded(
              child: show
                  ? Font14Weight400(
                      text: title,
                      fontWeight: FontWeight.w600,
                      textColor: AppColors.greenColor,
                      fontSize: 16,
                    )
                  : Font14Weight400(text: title),
            ),
            Icon(show ? Icons.expand_less : Icons.expand_more)
          ],
        ),
      ),
    );
  }

  List mediaList = ['1', '1', '1', '1', '1', '1'];
  List doctorList = [
    '1',
    '1',
    '1',
    '1',
    '1',
    '1',
    '1',
    '1',
    '1',
  ];

  Widget _gridContainer({
    required String count,
    required String title,
    VoidCallback? onTap,
  }) {
    return InkWell(
        child: _elevatedContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Font14Weight400(
                    text: count,
                    textColor: AppColors.greenColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 10,
                ),
                Font14Weight400(
                    text: title,
                    textColor: AppColors.greenColor,
                    fontSize: 10,
                    textAlign: TextAlign.center),
              ],
            ),
            onTap: onTap));
  }

  Widget _elevatedContainer({
    required Widget child,
    VoidCallback? onTap,
    EdgeInsetsGeometry? padding,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: AppColors.greyText.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5)
        ], borderRadius: BorderRadius.circular(24), color: Colors.white),
        child: child,
      ),
    );
  }

  Widget _buildFacilitiesGrid() {
    return SizedBox(
      height: 280,
      child: GridView.builder(
          itemCount: facilitiesList.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 18, mainAxisSpacing: 18),
          itemBuilder: (c, i) {
            return _gridContainer(
                count: facilitiesList[i]['count'],
                title: facilitiesList[i]['title']);
          }),
    );
  }

  Widget _buildDepartmentsGrid() {
    return SizedBox(
      height: 280,
      child: GridView.builder(
          itemCount: departmentsList.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 18, mainAxisSpacing: 18),
          itemBuilder: (c, i) {
            return _gridContainer(
                count: departmentsList[i]['count'],
                title: departmentsList[i]['title']);
          }),
    );
  }

  Widget _buildConsultantGrid() {
    return SizedBox(
      height: 280,
      child: GridView.builder(
          itemCount: consultantsList.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 18, mainAxisSpacing: 18),
          itemBuilder: (c, i) {
            return _gridContainer(
              onTap: () {
                AppNavigation.to(
                    context,
                    HospitalConsultantPage(
                      page: i,
                    ));
              },
              count: consultantsList[i]['count'],
              title: consultantsList[i]['title'],
            );
          }),
    );
  }

  Widget _buildGreen16SizeText({required String title, double? top}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24, top: top ?? 30, left: 24, right: 24),
      child: Font14Weight500Blue(
        text: title,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        textColor: AppColors.greenColor,
      ),
    );
  }

  List<Map<String, dynamic>> facilitiesList = [
    {'count': '52', 'title': 'Expert doctors'},
    {'count': '80', 'title': 'Patient beds'},
    {'count': '07', 'title': 'OTs'},
    {'count': '30', 'title': 'Hospital staff'},
    {'count': '12', 'title': 'Departments'},
    {'count': '10+', 'title': 'Experience'},
  ];
  List<Map<String, dynamic>> departmentsList = [
    {'count': 'logo', 'title': 'Orthopedic'},
    {'count': '01', 'title': 'Dermatology'},
    {'count': '03', 'title': 'Radiology'},
    {'count': 'logo', 'title': 'Anesthesia'},
    {'count': 'logo', 'title': 'ENT'},
    {'count': 'logo', 'title': 'Gynaecology'},
  ];
  List<Map<String, dynamic>> consultantsList = [
    {'count': '05', 'title': 'Orthopedic'},
    {'count': '02', 'title': 'Dermatology'},
    {'count': '02', 'title': 'Radiology'},
    {'count': '05', 'title': 'Anesthesia'},
    {'count': '02', 'title': 'ENT'},
    {'count': '02', 'title': 'Gynaecology'},
  ];
}
