class ProductModel {
  int id;
  int categoryId;
  String path;
  String name;
  double price;
  double rating;
  ProductModel(
      {required this.name,
      required this.categoryId,
      required this.id,
      required this.path,
      required this.price,
      required this.rating});
}
