class CartItem {
  int? id;
  String ?name;
  String? image;
  double ?price;
  int ?quantity;
  int? productId;

  CartItem({this.id,this.image , this.name,  this.price, this.quantity = 1,this.productId, });

  // Convert CartItem object to a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'productId': productId,
    };
  }

  // Extract CartItem object from a Map object
  static CartItem fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      price: map['price'],
      quantity: map['quantity'],
      productId: map['productId'],
    );
  }
}
