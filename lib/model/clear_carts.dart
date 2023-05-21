class ClearCarts {
  String? cartHash;
  ClearCarts({this.cartHash});
  ClearCarts.fromJson(Map<String, dynamic> map) {
    cartHash = map['cart_hash'];
  }
}
