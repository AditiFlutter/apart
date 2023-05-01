class SelectDesignationtModel {
  List<Designation>? designation;

  SelectDesignationtModel({this.designation});

  SelectDesignationtModel.fromJson(Map<String, dynamic> json) {
    if (json['designation'] != null) {
      designation = <Designation>[];
      json['designation'].forEach((v) {
        designation!.add(new Designation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.designation != null) {
      data['designation'] = this.designation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Designation {
  int? id;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;

  Designation(
      {this.id, this.name, this.status, this.createdAt, this.updatedAt});

  Designation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
