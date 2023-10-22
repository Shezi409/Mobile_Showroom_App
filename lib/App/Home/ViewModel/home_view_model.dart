import 'package:get/get.dart';
import '../../Categories/Model/category_model.dart';
import '../../Featured/Model/featured_model.dart';
import '../../LatestPhone/Model/latest_phone.dart';
import '../../Product/Model/product_model.dart';
import '../Model/home_model.dart';

class HomeViewModel extends GetxController {
  Rx<HomeModel> homeData = HomeModel(categories: [
    CategoryModel(id: 1, name: "I phone", path: "assets/images/iphonelogo.png"),
    CategoryModel(
        id: 2, name: "Samsung", path: "assets/images/samsunglogo.png"),
    CategoryModel(id: 3, name: "Vivo", path: "assets/images/viviologo.png"),
    CategoryModel(id: 4, name: "One Plus", path: "assets/images/oneplus.png"),
    CategoryModel(id: 5, name: "Xiaomi", path: "assets/images/xiaomilogo.png"),
    CategoryModel(id: 6, name: "Oppo", path: "assets/images/oppologo.png"),
  ], latestphone: [
    LatestPhoneModel(id: 1, name: "I phone", path: "assets/images/iphone.png"),
    LatestPhoneModel(id: 1, name: "I phone", path: "assets/images/iphone.png"),
    LatestPhoneModel(id: 1, name: "I phone", path: "assets/images/iphone.png"),
    LatestPhoneModel(id: 1, name: "I phone", path: "assets/images/iphone.png"),
    LatestPhoneModel(id: 1, name: "I phone", path: "assets/images/iphone.png"),
  ], featured: [
    FeaturedModel(id: 1, name: "Android", path: "assets/images/andriod.jpg"),
    FeaturedModel(id: 1, name: "IOS", path: "assets/images/iphooone.png"),
    FeaturedModel(id: 1, name: "RAM", path: "assets/images/rame.jpg"),
    FeaturedModel(id: 1, name: "Display", path: "assets/images/display.png"),
    FeaturedModel(id: 1, name: "Camera", path: "assets/images/comoro.jpg"),
  ], products: [
    ProductModel(
        name: "Shoe 1",
        categoryId: 1,
        id: 1,
        path: "assets/images/boot-gfa699f720_1280.jpg",
        price: 200,
        rating: 3.4),
    ProductModel(
        name: "laptop 1",
        categoryId: 2,
        id: 2,
        path: "assets/images/laptop-gc4ce6a781_1280.png",
        price: 200,
        rating: 3.4),
    ProductModel(
        name: "Shoe 2",
        categoryId: 1,
        id: 3,
        path: "assets/images/shoes-g240ce4669_1280.png",
        price: 200,
        rating: 3.4),
    ProductModel(
        name: "Shoe 1",
        categoryId: 1,
        id: 4,
        path: "assets/images/boot-gfa699f720_1280.jpg",
        price: 200,
        rating: 3.4),
    ProductModel(
        name: "mac 1",
        categoryId: 2,
        id: 5,
        path: "assets/images/tablet-gf9173500d_1280.png",
        price: 200,
        rating: 3.4),
  ]).obs;
}
