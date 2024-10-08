
class Data {
  int? id;
  String? name;
  String? description;
  int? regularPrice;
  int? largePrice;
  String? category;
  String? image;
  bool? isLiked;
  int? favoritesCount;
  bool? stock;

  Data(
      {this.id,
      this.name,
      this.description,
      this.regularPrice,
      this.largePrice,
      this.category,
      this.image,
      this.isLiked,
      this.favoritesCount,
      this.stock});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    regularPrice = json['regular_price'];
    largePrice = json['large_price'];
    category = json['category'];
    image = json['image'];
    isLiked = json['isLiked'];
    favoritesCount = json['favorites_count'];
    stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['regular_price'] = this.regularPrice;
    data['large_price'] = this.largePrice;
    data['category'] = this.category;
    data['image'] = this.image;
    data['isLiked'] = this.isLiked;
    data['favorites_count'] = this.favoritesCount;
    data['stock'] = this.stock;
    return data;
  }
}
