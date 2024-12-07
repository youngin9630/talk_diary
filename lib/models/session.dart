class Session {
  final String sessionId;
  final String userId;
  final DateTime createdAt;
  final DateTime expiresAt;
  final bool isActive;

  Session({
    required this.sessionId,
    required this.userId,
    required this.createdAt,
    required this.expiresAt,
    this.isActive = true,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      sessionId: json['sessionId'],
      userId: json['userId'],
      createdAt: DateTime.parse(json['createdAt']),
      expiresAt: DateTime.parse(json['expiresAt']),
      isActive: json['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toJson() => {
        'sessionId': sessionId,
        'userId': userId,
        'createdAt': createdAt.toIso8601String(),
        'expiresAt': expiresAt.toIso8601String(),
        'isActive': isActive,
      };
}
