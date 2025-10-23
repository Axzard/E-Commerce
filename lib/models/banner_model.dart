class BannerModel {
  final String imagePath;

  BannerModel({required this.imagePath});
}

final List<BannerModel> bannerList = [
  BannerModel(imagePath: 'assets/banner1.png'),
  BannerModel(imagePath: 'assets/banner2.jpg'),
  BannerModel(imagePath: 'assets/banner3.jpg'),
];
