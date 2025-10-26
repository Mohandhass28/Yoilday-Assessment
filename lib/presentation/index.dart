import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yoilday_assessment/core/asset/app_images.dart';
import 'package:yoilday_assessment/core/theme/app_color.dart';
import 'package:yoilday_assessment/presentation/home/page/home_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => RootPageState();
}

class RootPageState extends State<RootPage>
    with SingleTickerProviderStateMixin {
  final List<Widget> _pages = [
    SizedBox.shrink(),
    HomePage(),
    SizedBox.shrink(),
    SizedBox.shrink(),
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          controller: _tabController,
          indicatorColor: AppColor.primaryColor,
          labelColor: AppColor.primaryColor,
          overlayColor: WidgetStatePropertyAll(
            const Color.fromARGB(48, 223, 85, 50),
          ),
          labelStyle: TextStyle(
            color: AppColor.iconInactiveColor,
            fontSize: 12.sp,
          ),

          unselectedLabelColor: AppColor.iconInactiveColor,
          indicator: TopIndicator(),
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Tab(
              icon: SvgPicture.asset(
                AppAssets.homeSvg,
                color: _tabController.index == 0
                    ? AppColor.primaryColor
                    : AppColor.iconInactiveColor,
                width: 16.w,
                height: 16.h,
              ),
              text: 'Home',
            ),
            Tab(
              icon: SvgPicture.asset(
                AppAssets.portfoliaSvg,
                color: _tabController.index == 1
                    ? AppColor.primaryColor
                    : AppColor.iconInactiveColor,
                width: 16.w,
                height: 16.h,
              ),
              text: 'Portfolio',
            ),
            Tab(
              icon: SvgPicture.asset(
                AppAssets.inputSvg,
                color: _tabController.index == 2
                    ? AppColor.primaryColor
                    : AppColor.iconInactiveColor,
                width: 16.w,
                height: 16.h,
              ),
              text: 'Input',
            ),
            Tab(
              icon: SvgPicture.asset(
                AppAssets.profileSvg,
                color: _tabController.index == 3
                    ? AppColor.primaryColor
                    : AppColor.iconInactiveColor,
                width: 16.w,
                height: 16.h,
              ),
              text: 'Profile',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _pages,
      ),
    );
  }
}

class TopIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TopIndicatorBox();
  }
}

class _TopIndicatorBox extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    Paint paint = Paint()
      ..color = AppColor.primaryColor
      ..strokeWidth = 3.w
      ..isAntiAlias = true;

    double indicatorWidth = 24.w; // Fixed width for the indicator
    double startX = offset.dx + (cfg.size!.width - indicatorWidth) / 2;
    double endX = startX + indicatorWidth;
    canvas.drawLine(Offset(startX, 0), Offset(endX, 0), paint);
  }
}
