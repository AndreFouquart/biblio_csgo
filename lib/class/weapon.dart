class Weapon {
  final String id;
  final String name;

  Weapon(this.id, this.name);

  String getId() {
    return id;
  }

  String getName() {
    return name;
  }

  factory Weapon.fromJson(Map<String, dynamic> json) {
    return Weapon(
      json['weapon']['id'],
      json['weapon']['name'],
    );
  }
}
