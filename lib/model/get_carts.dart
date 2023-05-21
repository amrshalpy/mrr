class GetCarts {
  dynamic cartHash;
  dynamic cartKey;
  Currency? currency;
  Customer? customer;
  List<ItemsCarts>? items;
  dynamic itemCount;
  dynamic itemsWeight;
  // List<Null>? coupons;
  bool? needsPayment;
  bool? needsShipping;
  Shipping? shipping;
  // List<Null>? fees;
  // List<Null>? taxes;
  Totals? totals;
  // List<Null>? removedItems;
  // List<Null>? crossSells;
  // List<Null>? notices;

  GetCarts(
      {this.cartHash,
      this.cartKey,
      this.currency,
      this.customer,
      this.items,
      this.itemCount,
      this.itemsWeight,
      // this.coupons,
      this.needsPayment,
      this.needsShipping,
      this.shipping,
      // this.fees,
      // this.taxes,
      this.totals,
      // this.removedItems,
      // this.crossSells,
      // this.notices
      });

  GetCarts.fromJson(Map<String, dynamic> json) {
    cartHash = json['cart_hash'];
    cartKey = json['cart_key'];
    currency = json['currency'] != null
        ? new Currency.fromJson(json['currency'])
        : null;
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    if (json['items'] != null) {
      items = <ItemsCarts>[];
      json['items'].forEach((v) {
        items!.add(new ItemsCarts.fromJson(v));
      });
    }
    itemCount = json['item_count'];
    itemsWeight = json['items_weight'];
    // if (json['coupons'] != null) {
    //   coupons = <Null>[];
    //   json['coupons'].forEach((v) {
    //     coupons!.add(v);
    //   });
    // }
    needsPayment = json['needs_payment'];
    needsShipping = json['needs_shipping'];
    shipping = json['shipping'] != null
        ? new Shipping.fromJson(json['shipping'])
        : null;
    // if (json['fees'] != null) {
    //   fees = <Null>[];
    //   json['fees'].forEach((v) {
    //     fees!.add(v);
    //   });
    // }
    // if (json['taxes'] != null) {
    //   taxes = <Null>[];
    //   json['taxes'].forEach((v) {
    //     taxes!.add(v);
    //   });
    // }
    totals =
        json['totals'] != null ? new Totals.fromJson(json['totals']) : null;
    // if (json['removed_items'] != null) {
    //   removedItems = <Null>[];
    //   json['removed_items'].forEach((v) {
    //     removedItems!.add(v);
    //   });
    // }
    // if (json['cross_sells'] != null) {
    //   crossSells = <Null>[];
    //   json['cross_sells'].forEach((v) {
    //     crossSells!.add(v);
    //   });
    // }
    // if (json['notices'] != null) {
    //   notices = <Null>[];
    //   json['notices'].forEach((v) {
    //     notices!.add(v);
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_hash'] = this.cartHash;
    data['cart_key'] = this.cartKey;
    if (this.currency != null) {
      data['currency'] = this.currency!.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['item_count'] = this.itemCount;
    data['items_weight'] = this.itemsWeight;
    // if (this.coupons != null) {
    //   data['coupons'] = this.coupons!.map((v) => v).toList();
    // }
    data['needs_payment'] = this.needsPayment;
    data['needs_shipping'] = this.needsShipping;
    if (this.shipping != null) {
      data['shipping'] = this.shipping!.toJson();
    }
    // if (this.fees != null) {
    //   data['fees'] = this.fees!.map((v) => v).toList();
    // }
    // if (this.taxes != null) {
    //   data['taxes'] = this.taxes!.map((v) => v).toList();
    // }
    if (this.totals != null) {
      data['totals'] = this.totals!.toJson();
    }
    // if (this.removedItems != null) {
    //   data['removed_items'] =
    //       this.removedItems!.map((v) => v).toList();
    // }
    // if (this.crossSells != null) {
    //   data['cross_sells'] = this.crossSells!.map((v) => v).toList();
    // }
    // if (this.notices != null) {
    //   data['notices'] = this.notices!.map((v) => v).toList();
    // }
    return data;
  }
}

class Currency {
  dynamic currencyCode;
  dynamic currencySymbol;
  dynamic currencyMinorUnit;
  dynamic currencyDecimalSeparator;
  dynamic currencyThousandSeparator;
  dynamic currencyPrefix;
  dynamic currencySuffix;

  Currency(
      {this.currencyCode,
      this.currencySymbol,
      this.currencyMinorUnit,
      this.currencyDecimalSeparator,
      this.currencyThousandSeparator,
      this.currencyPrefix,
      this.currencySuffix});

  Currency.fromJson(Map<String, dynamic> json) {
    currencyCode = json['currency_code'];
    currencySymbol = json['currency_symbol'];
    currencyMinorUnit = json['currency_minor_unit'];
    currencyDecimalSeparator = json['currency_decimal_separator'];
    currencyThousandSeparator = json['currency_thousand_separator'];
    currencyPrefix = json['currency_prefix'];
    currencySuffix = json['currency_suffix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency_code'] = this.currencyCode;
    data['currency_symbol'] = this.currencySymbol;
    data['currency_minor_unit'] = this.currencyMinorUnit;
    data['currency_decimal_separator'] = this.currencyDecimalSeparator;
    data['currency_thousand_separator'] = this.currencyThousandSeparator;
    data['currency_prefix'] = this.currencyPrefix;
    data['currency_suffix'] = this.currencySuffix;
    return data;
  }
}

class Customer {
  BillingAddress? billingAddress;
  ShippingAddress? shippingAddress;

  Customer({this.billingAddress, this.shippingAddress});

  Customer.fromJson(Map<String, dynamic> json) {
    billingAddress = json['billing_address'] != null
        ? new BillingAddress.fromJson(json['billing_address'])
        : null;
    shippingAddress = json['shipping_address'] != null
        ? new ShippingAddress.fromJson(json['shipping_address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.billingAddress != null) {
      data['billing_address'] = this.billingAddress!.toJson();
    }
    if (this.shippingAddress != null) {
      data['shipping_address'] = this.shippingAddress!.toJson();
    }
    return data;
  }
}

class BillingAddress {
  dynamic billingFirstName;
  dynamic billingLastName;
  dynamic billingPhone;
  dynamic billingEmail;
  dynamic billingState;
  dynamic billingCity;
  dynamic billingAddress1;
  dynamic billingCountry;

  BillingAddress(
      {this.billingFirstName,
      this.billingLastName,
      this.billingPhone,
      this.billingEmail,
      this.billingState,
      this.billingCity,
      this.billingAddress1,
      this.billingCountry});

  BillingAddress.fromJson(Map<String, dynamic> json) {
    billingFirstName = json['billing_first_name'];
    billingLastName = json['billing_last_name'];
    billingPhone = json['billing_phone'];
    billingEmail = json['billing_email'];
    billingState = json['billing_state'];
    billingCity = json['billing_city'];
    billingAddress1 = json['billing_address_1'];
    billingCountry = json['billing_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['billing_first_name'] = this.billingFirstName;
    data['billing_last_name'] = this.billingLastName;
    data['billing_phone'] = this.billingPhone;
    data['billing_email'] = this.billingEmail;
    data['billing_state'] = this.billingState;
    data['billing_city'] = this.billingCity;
    data['billing_address_1'] = this.billingAddress1;
    data['billing_country'] = this.billingCountry;
    return data;
  }
}

class ShippingAddress {
  dynamic shippingFirstName;
  dynamic shippingLastName;
  dynamic shippingCountry;
  dynamic shippingState;
  dynamic shippingCity;
  dynamic shippingAddress1;

  ShippingAddress(
      {this.shippingFirstName,
      this.shippingLastName,
      this.shippingCountry,
      this.shippingState,
      this.shippingCity,
      this.shippingAddress1});

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    shippingFirstName = json['shipping_first_name'];
    shippingLastName = json['shipping_last_name'];
    shippingCountry = json['shipping_country'];
    shippingState = json['shipping_state'];
    shippingCity = json['shipping_city'];
    shippingAddress1 = json['shipping_address_1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shipping_first_name'] = this.shippingFirstName;
    data['shipping_last_name'] = this.shippingLastName;
    data['shipping_country'] = this.shippingCountry;
    data['shipping_state'] = this.shippingState;
    data['shipping_city'] = this.shippingCity;
    data['shipping_address_1'] = this.shippingAddress1;
    return data;
  }
}

class ItemsCarts {
  dynamic itemKey;
  int? id;
  dynamic name;
  dynamic title;
  dynamic price;
  Quantity? quantity;
  Totals? totals;
  dynamic slug;
  Meta? meta;
  dynamic backorders;
  // List<Null>? cartItemData;
  dynamic featuredImage;

  ItemsCarts(
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
      // this.cartItemData,
      this.featuredImage});

  ItemsCarts.fromJson(Map<String, dynamic> json) {
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
    // if (json['cart_item_data'] != null) {
    //   cartItemData = <Null>[];
    //   json['cart_item_data'].forEach((v) {
    //     cartItemData!.add(v);
    //   });
    // }
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
    // if (this.cartItemData != null) {
    //   data['cart_item_data'] =
    //       this.cartItemData!.map((v) => v).toList();
    // }
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

class Shipping {
  dynamic totalPackages;
  bool? showPackageDetails;
  bool? hasCalculatedShipping;
  // List<Null>? packages;

  Shipping(
      {this.totalPackages,
      this.showPackageDetails,
      this.hasCalculatedShipping,
      // this.packages
      });

  Shipping.fromJson(Map<String, dynamic> json) {
    totalPackages = json['total_packages'];
    showPackageDetails = json['show_package_details'];
    hasCalculatedShipping = json['has_calculated_shipping'];
    // if (json['packages'] != null) {
    //   packages = <Null>[];
    //   json['packages'].forEach((v) {
    //     packages!.add(v);
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_packages'] = this.totalPackages;
    data['show_package_details'] = this.showPackageDetails;
    data['has_calculated_shipping'] = this.hasCalculatedShipping;
    // if (this.packages != null) {
    //   data['packages'] = this.packages!.map((v) => v).toList();
    // }
    return data;
  }
}

class Totalss {
  dynamic subtotal;
  dynamic subtotalTax;
  dynamic feeTotal;
  dynamic feeTax;
  dynamic discountTotal;
  dynamic discountTax;
  dynamic shippingTotal;
  dynamic shippingTax;
  dynamic total;
  dynamic totalTax;

  Totalss(
      {this.subtotal,
      this.subtotalTax,
      this.feeTotal,
      this.feeTax,
      this.discountTotal,
      this.discountTax,
      this.shippingTotal,
      this.shippingTax,
      this.total,
      this.totalTax});

  Totalss.fromJson(Map<String, dynamic> json) {
    subtotal = json['subtotal'];
    subtotalTax = json['subtotal_tax'];
    feeTotal = json['fee_total'];
    feeTax = json['fee_tax'];
    discountTotal = json['discount_total'];
    discountTax = json['discount_tax'];
    shippingTotal = json['shipping_total'];
    shippingTax = json['shipping_tax'];
    total = json['total'];
    totalTax = json['total_tax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subtotal'] = this.subtotal;
    data['subtotal_tax'] = this.subtotalTax;
    data['fee_total'] = this.feeTotal;
    data['fee_tax'] = this.feeTax;
    data['discount_total'] = this.discountTotal;
    data['discount_tax'] = this.discountTax;
    data['shipping_total'] = this.shippingTotal;
    data['shipping_tax'] = this.shippingTax;
    data['total'] = this.total;
    data['total_tax'] = this.totalTax;
    return data;
  }
}
