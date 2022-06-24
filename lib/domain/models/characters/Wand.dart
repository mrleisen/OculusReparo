
class Wand {

  String? wood;
  String? core;
  double? length;

  Wand({
    this.wood,
    this.core,
    this.length
  });

  Wand.fromJson(Map<String, dynamic> json) {
    wood = json['wood'];
    core = json['core'];
    length = json['length'].toString().isNotEmpty ? double.parse(json['length'].toString()) : 0.0;
  }
}