class ProductModel {
  String? idCategory;
  String? category;
  String? image;
  String? status;
  List<Product>? product;

  ProductModel({
    this.idCategory,
    this.category,
    this.image,
    this.status,
    this.product,
  });

  ProductModel.fromJson(Map<dynamic, dynamic> json) {
    idCategory = json['idCategory'];
    category = json['category'];
    image = json['image'];
    status = json['status'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map data = new Map<dynamic, dynamic>();
    data['idCategory'] = this.idCategory;
    data['category'] = this.category;
    data['image'] = this.image;
    data['status'] = this.status;
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  String? idProduct;
  String? idCategory;
  String? name;
  String? description;
  String? image;
  String? price;
  String? status;
  String? createdAt;

  Product({
    this.idProduct,
    this.idCategory,
    this.name,
    this.description,
    this.image,
    this.price,
    this.status,
    this.createdAt,
  });

  Product.fromJson(Map<dynamic, dynamic> json) {
    idProduct = json['id_product'];
    idCategory = json['id_category'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map data = new Map<dynamic, dynamic>();
    data['id_product'] = this.idProduct;
    data['id_category'] = this.idCategory;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}
