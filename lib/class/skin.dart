class Skin {
  final String _id;
  final String _name;
  final String _image;
  final double _minFloat;
  final double _maxFloat;

  Skin(this._id, this._name, this._image, this._minFloat, this._maxFloat);

  factory Skin.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException("Failed to load skin. JSON is null.");
    }

    return Skin(
      json['id'] ?? '',
      json['pattern']['name'] ?? '',
      json['image'] ?? '',
      json['min_float'] != null ? json['min_float'].toDouble() : 0.0,
      json['max_float'] != null ? json['max_float'].toDouble() : 0.0,
    );
  }

  String getId() {
    return _id;
  }

  String getName() {
    return _name;
  }

  String getImage() {
    return _image;
  }

  double getMinFloat() {
    return _minFloat;
  }

  double getMaxFloat() {
    return _maxFloat;
  }
}
