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
}
