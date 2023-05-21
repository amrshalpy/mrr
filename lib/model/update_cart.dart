class UpdateCarts {
  dynamic itemKey;
  dynamic id;
  dynamic name;
  dynamic title;
  dynamic price;
  Quantity? quantity;
  Totals? totals;
  dynamic slug;
  Meta? meta;
  dynamic backorders;
  List<Null>? cartItemData;
  dynamic featuredImage;

  UpdateCarts(
      {this.itemKey,
      this.id,
      this.name,
      this.title,
      this.price,
      this.quantity,
      this.totals,
      this.slug,
      this.meta,
      this.backorders,
      this.cartItemData,
      this.featuredImage});

  UpdateCarts.fromJson(Map<String, dynamic> json) {
    itemKey = json['item_key'];
    id = json['id'];
    name = json['name'];
    title = json['title'];
    price = json['price'];
    quantity = json['quantity'] != null
        ? new Quantity.fromJson(json['quantity'])
        : null;
    totals =
        json['totals'] != null ? new Totals.fromJson(json['totals']) : null;
    slug = json['slug'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    backorders = json['backorders'];
    if (json['cart_item_data'] != null) {
      cartItemData = <Null>[];
      json['cart_item_data'].forEach((v) {
        cartItemData!.add(v);
      });
    }
    featuredImage = json['featured_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_key'] = this.itemKey;
    data['id'] = this.id;
    data['name'] = this.name;
    data['title'] = this.title;
    data['price'] = this.price;
    if (this.quantity != null) {
      data['quantity'] = this.quantity!.toJson();
    }
    if (this.totals != null) {
      data['totals'] = this.totals!.toJson();
    }
    data['slug'] = this.slug;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['backorders'] = this.backorders;
    if (this.cartItemData != null) {
      data['cart_item_data'] =
          this.cartItemData!.map((v) => v).toList();
    }
    data['featured_image'] = this.featuredImage;
    return data;
  }
}

class Quantity {
  dynamic value;
  dynamic minPurchase;
  dynamic maxPurchase;

  Quantity({this.value, this.minPurchase, this.maxPurchase});

  Quantity.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    minPurchase = json['min_purchase'];
    maxPurchase = json['max_purchase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['min_purchase'] = this.minPurchase;
    data['max_purchase'] = this.maxPurchase;
    return data;
  }
}

class Totals {
  dynamic subtotal;
  dynamic subtotalTax;
  dynamic total;
  dynamic tax;

  Totals({this.subtotal, this.subtotalTax, this.total, this.tax});

  Totals.fromJson(Map<String, dynamic> json) {
    subtotal = json['subtotal'];
    subtotalTax = json['subtotal_tax'];
    total = json['total'];
    tax = json['tax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subtotal'] = this.subtotal;
    data['subtotal_tax'] = this.subtotalTax;
    data['total'] = this.total;
    data['tax'] = this.tax;
    return data;
  }
}

class Meta {
  dynamic productType;
  dynamic sku;
  Dimensions? dimensions;
  dynamic weight;
  List<Null>? variation;

  Meta(
      {this.productType,
      this.sku,
      this.dimensions,
      this.weight,
      this.variation});

  Meta.fromJson(Map<String, dynamic> json) {
    productType = json['product_type'];
    sku = json['sku'];
    dimensions = json['dimensions'] != null
        ? new Dimensions.fromJson(json['dimensions'])
        : null;
    weight = json['weight'];
    if (json['variation'] != null) {
      variation = <Null>[];
      json['variation'].forEach((v) {
        variation!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_type'] = this.productType;
    data['sku'] = this.sku;
    if (this.dimensions != null) {
      data['dimensions'] = this.dimensions!.toJson();
    }
    data['weight'] = this.weight;
    if (this.variation != null) {
      data['variation'] = this.variation!.map((v) => v).toList();
    }
    return data;
  }
}

class Dimensions {
  dynamic length;
  dynamic width;
  dynamic height;
  dynamic unit;

  Dimensions({this.length, this.width, this.height, this.unit});

  Dimensions.fromJson(Map<String, dynamic> json) {
    length = json['length'];
    width = json['width'];
    height = json['height'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['length'] = this.length;
    data['width'] = this.width;
    data['height'] = this.height;
    data['unit'] = this.unit;
    return data;
  }
}
