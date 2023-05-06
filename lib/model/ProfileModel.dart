class profileModel {
  User? user;

  profileModel({this.user});

  profileModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? city;
  String? apartment;
  String? address;
  String? avatar;
  String? designation;

  User(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.city,
        this.apartment,
        this.address,
        this.avatar,
        this.designation});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    city = json['city'];
    apartment = json['apartment'];
    address = json['address'];
    avatar = json['avatar'];
    designation = json['designation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['city'] = this.city;
    data['apartment'] = this.apartment;
    data['address'] = this.address;
    data['avatar'] = this.avatar;
    data['designation'] = this.designation;
    return data;
  }
}
