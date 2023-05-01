class SelectApartmentModel {
  List<Apartment>? apartment;

  SelectApartmentModel({this.apartment});

  SelectApartmentModel.fromJson(Map<String, dynamic> json) {
    if (json['apartment'] != null) {
      apartment = <Apartment>[];
      json['apartment'].forEach((v) {
        apartment!.add(new Apartment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.apartment != null) {
      data['apartment'] = this.apartment!.map((v) => v.toJson()).toList();
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
  String? createdAt;
  String? updatedAt;
  String? cityId;

  Apartment(
      {this.id,
        this.nameOfApartment,
        this.noOfFlats,
        this.address,
        this.email,
        this.startDate,
        this.createdAt,
        this.updatedAt,
        this.cityId});

  Apartment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameOfApartment = json['name_of_apartment'];
    noOfFlats = json['no_of_flats'];
    address = json['address'];
    email = json['email'];
    startDate = json['start_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cityId = json['city_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_of_apartment'] = this.nameOfApartment;
    data['no_of_flats'] = this.noOfFlats;
    data['address'] = this.address;
    data['email'] = this.email;
    data['start_date'] = this.startDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['city_id'] = this.cityId;
    return data;
  }
}
