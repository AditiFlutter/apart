class HomeDashboardModel {
  List<Categories>? categories;
  BescomReading? bescomReading;
  BescomReading? waterReading;
  BescomReading? dgReading;
  List<Services>? services;

  HomeDashboardModel(
      {this.categories,
        this.bescomReading,
        this.waterReading,
        this.dgReading,
        this.services});

  HomeDashboardModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    bescomReading = json['bescom_reading'] != null
        ? new BescomReading.fromJson(json['bescom_reading'])
        : null;
    waterReading = json['water_reading'] != null
        ? new BescomReading.fromJson(json['water_reading'])
        : null;
    dgReading = json['dg_reading'] != null
        ? new BescomReading.fromJson(json['dg_reading'])
        : null;
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.bescomReading != null) {
      data['bescom_reading'] = this.bescomReading!.toJson();
    }
    if (this.waterReading != null) {
      data['water_reading'] = this.waterReading!.toJson();
    }
    if (this.dgReading != null) {
      data['dg_reading'] = this.dgReading!.toJson();
    }
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? slug;
  String? icon;
  String? createdAt;
  String? updatedAt;

  Categories(
      {this.id,
        this.name,
        this.slug,
        this.icon,
        this.createdAt,
        this.updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['icon'] = this.icon;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}



class BescomReading {
  String? value;
  String? unit;

  BescomReading({this.value, this.unit});

  BescomReading.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['unit'] = this.unit;
    return data;
  }
}

class Services {
  String? name;
  String? status;

  Services({this.name, this.status});

  Services.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['status'] = this.status;
    return data;
  }
}