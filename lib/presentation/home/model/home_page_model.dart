// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:yoilday_assessment/core/asset/app_images.dart';

class CardItemModel {
  final String image;
  final String title;
  final String subTitle;
  final String subTitle2;
  CardItemModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.subTitle2,
  });
}

class HomePageModelController extends GetxController {
  var cardItem = <CardItemModel>[].obs;
  var searchValue = ''.obs;

  get getcardItems => cardItem;

  List<CardItemModel> get filteredCardItems {
    if (searchValue.value.isEmpty) {
      return cardItem;
    }
    return cardItem.where((item) {
      return item.title.toLowerCase().contains(
            searchValue.value.toLowerCase(),
          ) ||
          item.subTitle.toLowerCase().contains(
            searchValue.value.toLowerCase(),
          ) ||
          item.subTitle2.toLowerCase().contains(
            searchValue.value.toLowerCase(),
          );
    }).toList();
  }

  @override
  void onInit() {
    super.onInit();
    cardItem.assignAll([
      CardItemModel(
        image: AppAssets.cardImage1,
        title: "Kemampuan Merangkum Tulisan",
        subTitle: "BAHASA SUNDA",
        subTitle2: "Oleh Al-Baiqi Samaan",
      ),
      CardItemModel(
        image: AppAssets.cardImage2,
        title: "Intisari Bahasa Sunda",
        subTitle: "BAHASA SUNDA",
        subTitle2: "Oleh Al-Baiqi Samaan",
      ),
      CardItemModel(
        image: AppAssets.cardImage3,
        title: "Garis Besar Keren",
        subTitle: "BAHASA SUNDA",
        subTitle2: "Oleh Al-Baiqi Samaan",
      ),
      CardItemModel(
        image: AppAssets.cardImage4,
        title: "Poin-Poin Penting",
        subTitle: "BAHASA SUNDA",
        subTitle2: "Oleh Al-Baiqi Samaan",
      ),
      CardItemModel(
        image: AppAssets.cardImage5,
        title: "Kemampuan Merangkum Tulisan",
        subTitle: "BAHASA SUNDA",
        subTitle2: "Oleh Al-Baiqi Samaan",
      ),
    ]);
  }

  void updateSearchValue(String value) {
    if (value == searchValue.value) return;

    searchValue(value);
  }

  void resetSearchValue() {
    searchValue("");
  }
}
