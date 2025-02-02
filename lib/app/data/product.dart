part of 'data.dart';

class Product {
  final int id;
  final String title;
  final String imageUrl;
  final String? upc;
  final String? score;
  final String? reasoning;
  final List<Nutrient> nutrients;

  const Product({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.upc,
    this.score,
    this.reasoning,
    required this.nutrients,
  });

  factory Product.fromJson(Map<String, dynamic> data) => Product(
        id: data['id'] is String ? data['idSpoonacular'] : data['id'],
        title: data['title'],
        imageUrl: data['image'],
        upc: data['upc'],
        score: data['score'] != null ? data['score']['evaluation'] : '',
        reasoning: data['score'] != null ? data['score']['reasoning'] : '',
        nutrients: data['nutrition'] != null
            ? (data['nutrition']['nutrients'] as List)
                .map((e) => Nutrient.fromJson(e))
                .toList()
            : [],
      );

  Product copyWith({
    int? id,
    String? title,
    String? imageUrl,
    String? upc,
    String? score,
    String? reasoning,
    List<Nutrient>? nutrients,
  }) =>
      Product(
        id: id ?? this.id,
        title: title ?? this.title,
        imageUrl: imageUrl ?? this.imageUrl,
        upc: upc ?? this.upc,
        score: score ?? this.score,
        reasoning: reasoning ?? this.reasoning,
        nutrients: nutrients ?? this.nutrients,
      );
}

class Nutrient {
  final String name;
  final String unit;
  final num amount;

  const Nutrient({
    required this.name,
    required this.unit,
    required this.amount,
  });

  factory Nutrient.fromJson(Map<String, dynamic> data) => Nutrient(
        name: data['name'],
        unit: data['unit'],
        amount: data['amount'],
      );

  Nutrient copyWith({
    String? name,
    String? unit,
    num? amount,
  }) =>
      Nutrient(
        name: name ?? this.name,
        unit: unit ?? this.unit,
        amount: amount ?? this.amount,
      );
}
