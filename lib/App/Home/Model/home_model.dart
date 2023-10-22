import '../../Categories/Model/category_model.dart';
import '../../Featured/Model/featured_model.dart';
import '../../LatestPhone/Model/latest_phone.dart';
import '../../Product/Model/product_model.dart';

class HomeModel {
  List<LatestPhoneModel> latestphone;
  List<CategoryModel> categories;
  List<ProductModel> products;
  List<FeaturedModel> featured;
  HomeModel(
      {required this.latestphone,
      required this.categories,
      required this.products,
      required this.featured});
}
