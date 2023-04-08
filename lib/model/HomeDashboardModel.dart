class HomeDashboardModel {
  List<Categories>? categories;
  String? bescomReading;
  String? waterReading;
  String? dgReading;
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
        categories!.add(Categories.fromJson(v));
      });
    }
    bescomReading = json['bescom_reading'];
    waterReading = json['water_reading'];
    dgReading = json['dg_reading'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['bescom_reading'] = bescomReading;
    data['water_reading'] = waterReading;
    data['dg_reading'] = dgReading;
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['icon'] = icon;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['status'] = status;
    return data;
  }
}
