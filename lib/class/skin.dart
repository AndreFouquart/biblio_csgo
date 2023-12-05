import 'dart:ffi';

class Skin {
  final String _id;
  final String _name;
  final String _description;
  final String _rarity;
  final String _image;

  Skin(this._id, this._name, this._description, this._rarity, this._image);

  String getId() {
    return this._id;
  }

  String getName() {
    return this._name;
  }

  String getDescription() {
    return this._description;
  }

  String getRarity() {
    return this._rarity;
  }

  String getImage() {
    return this._image;
  }
}
