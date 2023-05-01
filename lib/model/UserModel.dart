class UserModel {
  int? id;
  String? name;
  String? email;
  String? avatar;
  String? avatarOriginal;
  String? phone;
  List<Apartment>? apartment;
  Designation? designation;

  UserModel(
      {this.id,
        this.name,
        this.email,
        this.avatar,
        this.avatarOriginal,
        this.phone,
        this.apartment,
        this.designation});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    avatarOriginal = json['avatar_original'];
    phone = json['phone'];
    if (json['apartment'] != null) {
      apartment = <Apartment>[];
      json['apartment'].forEach((v) {
        apartment!.add(Apartment.fromJson(v));
      });
    }
    designation = json['designation'] != null
        ? Designation.fromJson(json['designation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['avatar'] = avatar;
    data['avatar_original'] = avatarOriginal;
    data['phone'] = phone;
    if (apartment != null) {
      data['apartment'] = apartment!.map((v) => v.toJson()).toList();
    }
    if (designation != null) {
      data['designation'] = designation!.toJson();
    }
    return data;
  }
}

class Apartment {
  int? id;
  String? nameOfApartment;
  String? noOfFlats;
  String? address;
  String? email;
  String? startDate;
  String? city;

  Apartment(
      {this.id,
        this.nameOfApartment,
        this.noOfFlats,
        this.address,
        this.email,
        this.startDate,
        this.city});

  Apartment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameOfApartment = json['name_of_apartment'];
    noOfFlats = json['no_of_flats'];
    address = json['address'];
    email = json['email'];
    startDate = json['start_date'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name_of_apartment'] = nameOfApartment;
    data['no_of_flats'] = this.noOfFlats;
    data['address'] = this.address;
    data['email'] = this.email;
    data['start_date'] = this.startDate;
    data['city'] = this.city;
    return data;
  }
}

class Designation {
  int? id;
  String? name;
  String? status;

  Designation(
      {this.id, this.name, this.status,});

  Designation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    return data;
  }
}
