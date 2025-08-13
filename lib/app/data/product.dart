part of 'data.dart';

class Product {
  final String upc;
  final String title;
  final String brand;
  final String labels;
  final String quantity;
  final String imageUrl;
  final String? score;
  final String? reasoning;
  final List<Nutrient> nutrients;

  const Product({
    required this.upc,
    required this.title,
    required this.brand,
    required this.labels,
    required this.quantity,
    required this.imageUrl,
    this.score,
    this.reasoning,
    required this.nutrients,
  });

  factory Product.fromJson(Map<String, dynamic> data) => Product(
        upc: data['upc'],
        title: data['title'],
        brand: data['brand'] ?? '',
        labels: data['labels'] != null ? data['labels'].split(',')[0] : '',
        quantity: data['quantity'] ?? '',
        imageUrl: data['image'],
        score: data['score'] != null ? data['score']['evaluation'] : '',
        reasoning: data['score'] != null ? data['score']['reasoning'] : '',
        nutrients: data['nutrition'] != null
            ? (data['nutrition'] as List)
                .map((e) => Nutrient.fromJson(e))
                .toList()
            : [],
      );

  Product copyWith({
    String? upc,
    String? title,
    String? brand,
    String? labels,
    String? quantity,
    String? imageUrl,
    String? score,
    String? reasoning,
    List<Nutrient>? nutrients,
  }) =>
      Product(
        upc: upc ?? this.upc,
        title: title ?? this.title,
        brand: brand ?? this.brand,
        labels: labels ?? this.labels,
        quantity: quantity ?? this.quantity,
        imageUrl: imageUrl ?? this.imageUrl,
        score: score ?? this.score,
        reasoning: reasoning ?? this.reasoning,
        nutrients: nutrients ?? this.nutrients,
      );
}

class Nutrient {
  final String name;
  final num amount;
  final String unit;
  final String description;

  const Nutrient({
    required this.name,
    required this.amount,
    required this.unit,
    required this.description,
  });

  factory Nutrient.fromJson(Map<String, dynamic> data) => Nutrient(
        name: data['name'],
        amount: data['amount'],
        unit: data['unit'],
        description: data['description'],
      );

  Nutrient copyWith({
    String? name,
    num? amount,
    String? unit,
    String? description,
  }) =>
      Nutrient(
        name: name ?? this.name,
        amount: amount ?? this.amount,
        unit: unit ?? this.unit,
        description: description ?? this.description,
      );
}
