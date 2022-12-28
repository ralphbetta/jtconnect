class UserModel {
  late int id;
  late String username;
  late String? phone;
  late String email;
  late String country;
  late String countryCode;
  late double balance;
  late String? created_at;
  late String? updated_at;

  UserModel(
      {required this.id,
      required this.username,
      this.phone,
      this.balance = 0.00,
      required this.email,
      required this.country,
      required this.countryCode,
      this.created_at,
      this.updated_at});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      username: json['username'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      balance: json['balance'] as double,
      country: json['country'] as String,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
      countryCode: json['countryCode'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['balance'] = this.balance;
    data['country'] = this.country;
    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
    data['countryCode'] = this.countryCode;

    return data;
  }

  @override
  String toString() {
    return 'User:\n\tId: $id\n\tUsername: $username\n\tEmail: $email\n\tPhone: $phone\n\tBalance: $balance\n';
  }

  @override
  List<Object> get props => [username, email, id, phone!, country];

  @override
  static List<UserModel> get staticUsers => [
        UserModel(
          id: 0123,
          username: "Grace Jerry",
          email: "grace@gmail.com",
          country: "Nigeria",
          phone: "903645342",
          countryCode: "+234",
          balance: 45.30,
        )
      ];
}
