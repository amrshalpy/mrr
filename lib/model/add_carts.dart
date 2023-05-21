class ADDTOCart {
  bool? status;
  List<Data>? data;

  ADDTOCart({this.status, this.data});

  ADDTOCart.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? productId;
  String? productName;
  String? productRegularPrice;
  String? productSalePrice;
  String? thumbnail;
  int? qty;
  List<Null>? attribute;
  dynamic lineSubtotal;
  dynamic lineTotal;
  dynamic variationId;

  Data(
      {this.productId,
      this.productName,
      this.productRegularPrice,
      this.productSalePrice,
      this.thumbnail,
      this.qty,
      this.attribute,
      this.lineSubtotal,
      this.lineTotal,
      this.variationId});

  Data.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productRegularPrice = json['product_regular_price'];
    productSalePrice = json['product_sale_price'];
    thumbnail = json['thumbnail'];
    qty = json['qty'];
    if (json['attribute'] != null) {
      attribute = <Null>[];
      json['attribute'].forEach((v) {
        attribute!.add(v);
      });
    }
    lineSubtotal = json['line_subtotal'];
    lineTotal = json['line_total'];
    variationId = json['variation_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_regular_price'] = this.productRegularPrice;
    data['product_sale_price'] = this.productSalePrice;
    data['thumbnail'] = this.thumbnail;
    data['qty'] = this.qty;
    if (this.attribute != null) {
      data['attribute'] = this.attribute!.map((v) => v).toList();
    }
    data['line_subtotal'] = this.lineSubtotal;
    data['line_total'] = this.lineTotal;
    data['variation_id'] = this.variationId;
    return data;
  }
}