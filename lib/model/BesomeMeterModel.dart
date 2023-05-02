class BescomMeterModel {
  List<BescomMeter>? bescomMeter;

  BescomMeterModel({this.bescomMeter});

  BescomMeterModel.fromJson(Map<String, dynamic> json) {
    if (json['bescom_meter'] != null) {
      bescomMeter = <BescomMeter>[];
      json['bescom_meter'].forEach((v) {
        bescomMeter!.add(BescomMeter.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bescomMeter != null) {
      data['bescom_meter'] = this.bescomMeter!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BescomMeter {
  int? id;
  String? apartmentId;
  String? meterNo;
  String? status;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  BescomMeter(
      {this.id,
        this.apartmentId,
        this.meterNo,
        this.status,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  BescomMeter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    apartmentId = json['apartment_id'];
    meterNo = json['meter_no'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
