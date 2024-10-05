/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

ProductResponse productResponseFromJson(String str) => ProductResponse.fromJson(json.decode(str));

String productResponseToJson(ProductResponse data) => json.encode(data.toJson());

class ProductResponse {
    ProductResponse({
        required this.image,
        required this.price,
        required this.rating,
        required this.description,
        required this.id,
        required this.title,
        required this.category,
    });

    String image;
    double price;
    Rating rating;
    String description;
    int id;
    String title;
    String category;

    factory ProductResponse.fromJson(Map<dynamic, dynamic> json) => ProductResponse(
        image: json["image"],
        price: json["price"]?.toDouble(),
        rating: Rating.fromJson(json["rating"]),
        description: json["description"],
        id: json["id"],
        title: json["title"],
        category: json["category"],
    );

    Map<dynamic, dynamic> toJson() => {
        "image": image,
        "price": price,
        "rating": rating.toJson(),
        "description": description,
        "id": id,
        "title": title,
        "category": category,
    };
}

class Rating {
    Rating({
        this.rate,
        this.count,});

    Rating.fromJson(dynamic json) {
        rate = json['rate'] is int?(json['rate'] as int).toDouble():json['rate'].toDouble();;
        count = json['count'];
    }
    double? rate;
    int? count;

    Map<String, dynamic> toJson() {
        final map = <String, dynamic>{};
        map['rate'] = rate;
        map['count'] = count;
        return map;
    }

}
