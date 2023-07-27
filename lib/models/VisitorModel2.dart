class Visitor {
  final String visitor_name;
  final String visitor_email;
  final String visitor_nric;

  const Visitor({
    required this.visitor_name,
    required this.visitor_email,
    required this.visitor_nric,
  });

  factory Visitor.fromJson(Map<String, dynamic> json) {
    return Visitor(
      visitor_name: json['visitor_name'],
      visitor_email: json['visitor_email'],
      visitor_nric: json['visitor_nric'],
    );
  }
}