class WaterMeterModel {
  List<WaterMeter>? waterMeter;

  WaterMeterModel({this.waterMeter});

  WaterMeterModel.fromJson(Map<String, dynamic> json) {
    if (json['water_meter'] != null) {
      waterMeter = <WaterMeter>[];
      json['water_meter'].forEach((v) {
        waterMeter!.add(new WaterMeter.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.waterMeter != null) {
      data['water_meter'] = this.waterMeter!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WaterMeter {
  int? id;
  String? apartmentId;
  String? meterNo;
  String? status;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  WaterMeter(
      {this.id,
        this.apartmentId,
        this.meterNo,
        this.status,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  WaterMeter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    apartmentId = json['apartment_id'];
    meterNo = json['meter_no'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['apartment_id'] = this.apartmentId;
    data['meter_no'] = this.meterNo;
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
