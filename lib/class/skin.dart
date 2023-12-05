class Skin {
  final String _id;
  final String _name;
  final String _image;

  Skin(this._id, this._name, this._image);

  factory Skin.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      // Gestion du cas où le JSON est null
      throw FormatException("Failed to load skin. JSON is null.");
    }

    return Skin(
      json['id'] ?? '',
      json['pattern']['name'] ?? '',
      json['image'] ?? '',
    );
  }

  String getId() {
    return this._id;
  }

  String getName() {
    return this._name;
  }

  String getImage() {
    return this._image;
  }
}
