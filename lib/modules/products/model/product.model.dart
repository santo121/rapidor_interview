

import 'package:hive/hive.dart';
part 'product.model.g.dart';
@HiveType(typeId: 1)
class ProductListModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  double? price;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? category;
  @HiveField(5)
  String? image;
  @HiveField(6)
  Rating? rating;
  @HiveField(7)
  int? itemCount;

  ProductListModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating,
      this.itemCount = 0
      });

  ProductListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = 
    
    double.tryParse((json['price']??0).toString());
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
        json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['title'] = this.title;
  //   data['price'] = this.price;
  //   data['description'] = this.description;
  //   data['category'] = this.category;
  //   data['image'] = this.image;
  //   if (this.rating != null) {
  //     data['rating'] = this.rating!.toJson();
  //   }
  //   return data;
  // }
}
@HiveType(typeId: 2)
class Rating {
  @HiveField(0)
  double? rate;
  @HiveField(1)
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate =double.tryParse((json['rate']??0).toString());
    count = json['count'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['rate'] = this.rate;
  //   data['count'] = this.count;
  //   return data;
  // }
}