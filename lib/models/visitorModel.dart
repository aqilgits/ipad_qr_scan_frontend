class Visitor {
  final String ic;
  final String name;
  final String email;
  final String image;

  const Visitor(
      {required this.ic,
      required this.name,
      required this.email,
      required this.image});

  factory Visitor.fromJson(Map<String, dynamic> json) {
    return Visitor(
        ic: json['ic'],
        name: json['name'],
        email: json['email'],
        image: json['image']);
  }
  Map<String, dynamic> toJson() =>
      {"ic": ic, "name": name, "email": email, "image": image};
}
