class WaterReadingModel {
  List<WaterReadings>? waterReadings;

  WaterReadingModel({this.waterReadings});

  WaterReadingModel.fromJson(Map<String, dynamic> json) {
    if (json['water_readings'] != null) {
      waterReadings = <WaterReadings>[];
      json['water_readings'].forEach((v) {
        waterReadings!.add(new WaterReadings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.waterReadings != null) {
      data['water_readings'] =
          this.waterReadings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WaterReadings {
  int? id;
  String? date;
  String? meterNo;
  int? meterId;
  String? startReading;
  String? endReading;
  String? consumption;
  int? apartmentId;
  String? status;

  WaterReadings(
      {this.id,
        this.date,
        this.meterNo,
        this.meterId,
        this.startReading,
        this.endReading,
        this.consumption,
        this.apartmentId,
        this.status});

  WaterReadings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    meterNo = json['meter_no'];
    meterId = json['meter_id'];
    startReading = json['start_reading'];
    endReading = json['end_reading'];
    consumption = json['consumption'];
    apartmentId = json['apartment_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['meter_no'] = this.meterNo;
    data['meter_id'] = this.meterId;
    data['start_reading'] = this.startReading;
    data['end_reading'] = this.endReading;
    data['consumption'] = this.consumption;
    data['apartment_id'] = this.apartmentId;
    data['status'] = this.status;
    return data;
  }
}
