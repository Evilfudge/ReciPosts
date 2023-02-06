class Ingredients {
  final String name;
  final String unit;
  final int quantity;
  final bool required;

  Ingredients({
    required this.name,
    required this.unit,
    required this.quantity,
    required this.required});

  Map toJson() => {
    "name": name,
    "unit": unit,
    "quantity": quantity,
    "required": required
  };
  static Ingredients fromJson(Map<String, dynamic> json) => Ingredients(
      name: json['name'],
      unit: json['unit'],
      quantity: json['quantity'],
      required: json['required']
  );
}
