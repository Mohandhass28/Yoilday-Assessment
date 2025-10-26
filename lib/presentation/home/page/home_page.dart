import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yoilday_assessment/core/asset/app_images.dart';
import 'package:yoilday_assessment/core/theme/app_color.dart';
import 'package:yoilday_assessment/presentation/home/model/home_page_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        appBar: _getAppBar(),
        body: TabBarView(
          children: [
            ProjectTab(),
            SizedBox.shrink(),
            SizedBox.shrink(),
            SizedBox.shrink(),
          ],
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 10.h),
          height: 34.h,
          width: 104.w,
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: AppColor.primaryColor.withOpacity(0.4),
                blurRadius: 8.r,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: FloatingActionButton.extended(
            onPressed: () {},
            backgroundColor: AppColor.primaryColor,
            elevation: 0,
            splashColor: Color.fromRGBO(243, 149, 25, 1).withOpacity(.3),
            icon: const Icon(Icons.filter_list, color: Colors.white),
            label: Text(
              "Filter",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12.r,
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      title: Text(
        'Portfolio',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppAssets.shoppingBag,
            width: 24.w,
            height: 24.h,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppAssets.notificationsSvg,
            width: 24.w,
            height: 24.h,
          ),
        ),
      ],
      bottom: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: AppColor.primaryColor,
        labelColor: AppColor.primaryColor,
        labelStyle: TextStyle(fontSize: 14.sp),
        tabs: [
          Tab(
            text: "Project",
          ),
          Tab(
            text: "Saved",
          ),
          Tab(
            text: "Shared",
          ),
          Tab(
            text: "Achievment",
          ),
        ],
      ),
    );
  }
}

class ProjectTab extends StatefulWidget {
  const ProjectTab({super.key});

  @override
  State<ProjectTab> createState() => _ProjectTabState();
}

class _ProjectTabState extends State<ProjectTab> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageModelController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                16.verticalSpace,
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(224, 224, 224, 1),
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.r),
                    ),

                    labelStyle: TextStyle(color: AppColor.textColor),
                    labelText: "Search a project",
                    suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 5.h,
                      ),
                      child: IconButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            AppColor.primaryColor,
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(10.r),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(0),
                      ),
                    ),
                  ),

                  onChanged: (value) {
                    controller.updateSearchValue(value);
                  },
                ),
                // 16.verticalSpace,
                Expanded(
                  child:
                      controller.filteredCardItems.isEmpty &&
                          controller.searchValue.value.isNotEmpty
                      ? Center(
                          child: Text(
                            "No projects found",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: controller.filteredCardItems.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(top: 16.h),
                              child: CardWidget(
                                cardData: controller.filteredCardItems[index],
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CardWidget extends StatefulWidget {
  const CardWidget({
    super.key,
    required this.cardData,
  });

  final CardItemModel cardData;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(224, 224, 224, 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          kIsWeb
              ? Image.network(
                  widget.cardData.image,
                  width: 110.w,
                  height: 110.h,
                  fit: BoxFit.fill,
                )
              : Image.asset(
                  widget.cardData.image,
                  width: 110.w,
                  height: 110.h,
                  fit: BoxFit.fill,
                ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.cardData.title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                  ),
                  8.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.cardData.subTitle,
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Color.fromRGBO(48, 48, 48, 1),
                              ),
                            ),
                            Text(
                              widget.cardData.subTitle2,
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Color.fromRGBO(158, 149, 162, 1),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: 50.w,
                        height: 28.w,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: AppColor.buttonGradient,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Center(
                          child: Text(
                            "A",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
