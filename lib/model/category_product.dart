class ProductCategory {
  List<Products>? products;

  ProductCategory({this.products});

  ProductCategory.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? title;
  int? id;
  String? createdAt;
  String? updatedAt;
  String? type;
  String? status;
  bool? downloadable;
  bool? virtual;
  String? permalink;
  String? sku;
  dynamic price;
  String? regularPrice;
  Null? salePrice;
  String? priceHtml;
  bool? taxable;
  String? taxStatus;
  String? taxClass;
  bool? managingStock;
  Null? stockQuantity;
  bool? inStock;
  bool? backordersAllowed;
  bool? backordered;
  bool? soldIndividually;
  bool? purchaseable;
  bool? featured;
  bool? visible;
  String? catalogVisibility;
  bool? onSale;
  Null? weight;
  Dimensions? dimensions;
  bool? shippingRequired;
  bool? shippingTaxable;
  String? shippingClass;
  Null? shippingClassId;
  String? description;
  String? shortDescription;
  bool? reviewsAllowed;
  String? averageRating;
  int? ratingCount;
  List<int>? relatedIds;
  List<Null>? upsellIds;
  List<Null>? crossSellIds;
  List<String>? categories;
  List<Null>? tags;
  List<Images>? images;
  String? featuredSrc;
  List<Null>? attributes;
  List<Null>? downloads;
  int? downloadLimit;
  int? downloadExpiry;
  String? downloadType;
  String? purchaseNote;
  int? totalSales;
  List<Null>? variations;
  List<Null>? parent;

  Products(
      {this.title,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.type,
      this.status,
      this.downloadable,
      this.virtual,
      this.permalink,
      this.sku,
      this.price,
      this.regularPrice,
      this.salePrice,
      this.priceHtml,
      this.taxable,
      this.taxStatus,
      this.taxClass,
      this.managingStock,
      this.stockQuantity,
      this.inStock,
      this.backordersAllowed,
      this.backordered,
      this.soldIndividually,
      this.purchaseable,
      this.featured,
      this.visible,
      this.catalogVisibility,
      this.onSale,
      this.weight,
      this.dimensions,
      this.shippingRequired,
      this.shippingTaxable,
      this.shippingClass,
      this.shippingClassId,
      this.description,
      this.shortDescription,
      this.reviewsAllowed,
      this.averageRating,
      this.ratingCount,
      this.relatedIds,
      this.upsellIds,
      this.crossSellIds,
      this.categories,
      this.tags,
      this.images,
      this.featuredSrc,
      this.attributes,
      this.downloads,
      this.downloadLimit,
      this.downloadExpiry,
      this.downloadType,
      this.purchaseNote,
      this.totalSales,
      this.variations,
      this.parent});

  Products.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
    status = json['status'];
    downloadable = json['downloadable'];
    virtual = json['virtual'];
    permalink = json['permalink'];
    sku = json['sku'];
    price = double.parse(json['price']);
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    priceHtml = json['price_html'];
    taxable = json['taxable'];
    taxStatus = json['tax_status'];
    taxClass = json['tax_class'];
    managingStock = json['managing_stock'];
    stockQuantity = json['stock_quantity'];
    inStock = json['in_stock'];
    backordersAllowed = json['backorders_allowed'];
    backordered = json['backordered'];
    soldIndividually = json['sold_individually'];
    purchaseable = json['purchaseable'];
    featured = json['featured'];
    visible = json['visible'];
    catalogVisibility = json['catalog_visibility'];
    onSale = json['on_sale'];
    weight = json['weight'];
    dimensions = json['dimensions'] != null
        ? new Dimensions.fromJson(json['dimensions'])
        : null;
    shippingRequired = json['shipping_required'];
    shippingTaxable = json['shipping_taxable'];
    shippingClass = json['shipping_class'];
    shippingClassId = json['shipping_class_id'];
    description = json['description'];
    shortDescription = json['short_description'];
    reviewsAllowed = json['reviews_allowed'];
    averageRating = json['average_rating'];
    ratingCount = json['rating_count'];
    relatedIds = json['related_ids'].cast<int>();
    if (json['upsell_ids'] != null) {
      upsellIds = <Null>[];
      json['upsell_ids'].forEach((v) {
        upsellIds!.add(v);
      });
    }
    if (json['cross_sell_ids'] != null) {
      crossSellIds = <Null>[];
      json['cross_sell_ids'].forEach((v) {
        crossSellIds!.add(v);
      });
    }
    categories = json['categories'].cast<String>();
    if (json['tags'] != null) {
      tags = <Null>[];
      json['tags'].forEach((v) {
        tags!.add(v);
      });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    featuredSrc = json['featured_src'];
    if (json['attributes'] != null) {
      attributes = <Null>[];
      json['attributes'].forEach((v) {
        attributes!.add(v);
      });
    }
    if (json['downloads'] != null) {
      downloads = <Null>[];
      json['downloads'].forEach((v) {
        downloads!.add(v);
      });
    }
    downloadLimit = json['download_limit'];
    downloadExpiry = json['download_expiry'];
    downloadType = json['download_type'];
    purchaseNote = json['purchase_note'];
    totalSales = json['total_sales'];
    if (json['variations'] != null) {
      variations = <Null>[];
      json['variations'].forEach((v) {
        variations!.add(v);
      });
    }
    if (json['parent'] != null) {
      parent = <Null>[];
      json['parent'].forEach((v) {
        parent!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['type'] = this.type;
    data['status'] = this.status;
    data['downloadable'] = this.downloadable;
    data['virtual'] = this.virtual;
    data['permalink'] = this.permalink;
    data['sku'] = this.sku;
    data['price'] = this.price;
    data['regular_price'] = this.regularPrice;
    data['sale_price'] = this.salePrice;
    data['price_html'] = this.priceHtml;
    data['taxable'] = this.taxable;
    data['tax_status'] = this.taxStatus;
    data['tax_class'] = this.taxClass;
    data['managing_stock'] = this.managingStock;
    data['stock_quantity'] = this.stockQuantity;
    data['in_stock'] = this.inStock;
    data['backorders_allowed'] = this.backordersAllowed;
    data['backordered'] = this.backordered;
    data['sold_individually'] = this.soldIndividually;
    data['purchaseable'] = this.purchaseable;
    data['featured'] = this.featured;
    data['visible'] = this.visible;
    data['catalog_visibility'] = this.catalogVisibility;
    data['on_sale'] = this.onSale;
    data['weight'] = this.weight;
    if (this.dimensions != null) {
      data['dimensions'] = this.dimensions!.toJson();
    }
    data['shipping_required'] = this.shippingRequired;
    data['shipping_taxable'] = this.shippingTaxable;
    data['shipping_class'] = this.shippingClass;
    data['shipping_class_id'] = this.shippingClassId;
    data['description'] = this.description;
    data['short_description'] = this.shortDescription;
    data['reviews_allowed'] = this.reviewsAllowed;
    data['average_rating'] = this.averageRating;
    data['rating_count'] = this.ratingCount;
    data['related_ids'] = this.relatedIds;
    if (this.upsellIds != null) {
      data['upsell_ids'] = this.upsellIds!.map((v) => v).toList();
    }
    if (this.crossSellIds != null) {
      data['cross_sell_ids'] = this.crossSellIds!.map((v) => v).toList();
    }
    data['categories'] = this.categories;
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v).toList();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v).toList();
    }
    data['featured_src'] = this.featuredSrc;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.map((v) => v).toList();
    }
    if (this.downloads != null) {
      data['downloads'] = this.downloads!.map((v) => v).toList();
    }
    data['download_limit'] = this.downloadLimit;
    data['download_expiry'] = this.downloadExpiry;
    data['download_type'] = this.downloadType;
    data['purchase_note'] = this.purchaseNote;
    data['total_sales'] = this.totalSales;
    if (this.variations != null) {
      data['variations'] = this.variations!.map((v) => v).toList();
    }
    if (this.parent != null) {
      data['parent'] = this.parent!.map((v) => v).toList();
    }
    return data;
  }
}

class Dimensions {
  String? length;
  String? width;
  String? height;
  String? unit;

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

class Images {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? src;
  String? title;
  String? alt;
  int? position;

  Images(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.src,
      this.title,
      this.alt,
      this.position});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    src = json['src'];
    title = json['title'];
    alt = json['alt'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['src'] = this.src;
    data['title'] = this.title;
    data['alt'] = this.alt;
    data['position'] = this.position;
    return data;
  }
}
