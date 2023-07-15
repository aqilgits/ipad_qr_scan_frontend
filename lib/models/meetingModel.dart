class Meeting {
  final String email;
  final String time;
  final String venue;
  final String host;
  final String visitor;

  const Meeting(
      {required this.email,
      required this.time,
      required this.venue,
      required this.host,
      required this.visitor});

  factory Meeting.fromJson(Map<String, dynamic> json) {
    return Meeting(
        email: json['meeting']['email'],
        time: json['meeting']['time'],
        venue: json['meeting']['venue'],
        host: json['meeting']['host'],
        visitor: json['meeting']['visitor']);
  }
  Map<String, dynamic> toJson() => {
        "email": email,
        "time": time,
        "venue": venue,
        "host": host,
        "visitor": visitor
      };
}
