class ManpowerWorkersDataModel {
  List<Manpower>? manpower;

  ManpowerWorkersDataModel({this.manpower});

  ManpowerWorkersDataModel.fromJson(Map<String, dynamic> json) {
    if (json['manpower'] != null) {
      manpower = <Manpower>[];
      json['manpower'].forEach((v) {
        manpower!.add(new Manpower.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.manpower != null) {
      data['manpower'] = this.manpower!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Manpower {
  int? id;
  String? date;
  String? shiftId;
  String? categoryId;
  int? subcategoryId;
  String? subcategoryName;
  int? apartmentId;
  int? employeeCount;
  List<Employee>? employee;

  Manpower(
      {this.id,
        this.date,
        this.shiftId,
        this.categoryId,
        this.subcategoryId,
        this.subcategoryName,
        this.apartmentId,
        this.employeeCount,
        this.employee});

  Manpower.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    shiftId = json['shift_id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    subcategoryName = json['subcategory_name'];
    apartmentId = json['apartment_id'];
    employeeCount = json['employee_count'];
    if (json['employee'] != null) {
      employee = <Employee>[];
      json['employee'].forEach((v) {
        employee!.add(new Employee.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['shift_id'] = this.shiftId;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['subcategory_name'] = this.subcategoryName;
    data['apartment_id'] = this.apartmentId;
    data['employee_count'] = this.employeeCount;
    if (this.employee != null) {
      data['employee'] = this.employee!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Employee {
  int? id;
  String? employeeId;
  String? employeeName;

  Employee({this.id, this.employeeId, this.employeeName});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employee_id'];
    employeeName = json['employee_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employee_id'] = this.employeeId;
    data['employee_name'] = this.employeeName;
    return data;
  }
}
