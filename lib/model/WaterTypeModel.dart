class WaterTypeModel {
  List<WaterType>? waterType;

  WaterTypeModel({this.waterType});

  WaterTypeModel.fromJson(Map<String, dynamic> json) {
    if (json['water_type'] != null) {
      waterType = <WaterType>[];
      json['water_type'].forEach((v) {
        waterType!.add(new WaterType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.waterType != null) {
      data['water_type'] = this.waterType!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WaterType {
  int? id;
  String? name;
  Null? createdAt;
  Null? updatedAt;

  WaterType({this.id, this.name, this.createdAt, this.updatedAt});

  WaterType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
