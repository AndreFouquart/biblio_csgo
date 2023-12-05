class Weapon {
  final String id;
  final String name;

  Weapon(this.id, this.name);

  String getId() {
    return this.id;
  }

  String getName() {
    return this.name;
  }

  factory Weapon.fromJson(Map<String, dynamic> json) {
    return Weapon(
      json['weapon']['id'],
      json['weapon']['name'],
    );
  }
}
