
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
}