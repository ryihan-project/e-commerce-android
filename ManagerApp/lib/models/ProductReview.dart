
import 'package:ManagerApp/models/Product.dart';

import 'User.dart';

class ProductReview{

  int id,rating,orderId,productId,userId;
  String review;
  DateTime createdAt;
  User user;
  Product product;
  ProductReview(this.id, this.rating, this.orderId, this.productId, this.userId,
      this.review,this.createdAt,this.user,this.product);

  ProductReview.dummy(this.id, this.rating, this.orderId, this.productId, this.userId,
      this.review);
  static ProductReview fromJson(Map<String, dynamic> jsonObject) {

    int id = int.parse(jsonObject['id'].toString());
    int rating = int.parse(jsonObject['rating'].toString());
    int productId = int.parse(jsonObject['product_id'].toString());
    int orderId = int.parse(jsonObject['order_id'].toString());
    int userId = int.parse(jsonObject['user_id'].toString());
}