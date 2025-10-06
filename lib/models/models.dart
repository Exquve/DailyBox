class ActivityType {
  static const String note = 'note';
  static const String budget = 'budget';
  static const String qrCode = 'qr_code';
  static const String linkShortener = 'link_shortener';
  static const String fileConverter = 'file_converter';
}

class UserActivity {
  final int? id;
  final String type;
  final String title;
  final String content;
  final double? latitude;
  final double? longitude;
  final DateTime timestamp;

  UserActivity({
    this.id,
    required this.type,
    required this.title,
    required this.content,
    this.latitude,
    this.longitude,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'content': content,
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': timestamp.millisecondsSinceEpoch,
    };
  }

  factory UserActivity.fromMap(Map<String, dynamic> map) {
    return UserActivity(
      id: map['id'],
      type: map['type'],
      title: map['title'],
      content: map['content'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp']),
    );
  }
}

class Note {
  final int? id;
  final String title;
  final String content;
  final DateTime timestamp;
  final double? latitude;
  final double? longitude;

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.timestamp,
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp']),
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }
}

class BudgetEntry {
  final int? id;
  final String currency;
  final double amount;
  final String description;
  final bool isIncome; // true for income, false for expense
  final DateTime timestamp;
  final double? latitude;
  final double? longitude;

  BudgetEntry({
    this.id,
    required this.currency,
    required this.amount,
    required this.description,
    required this.isIncome,
    required this.timestamp,
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'currency': currency,
      'amount': amount,
      'description': description,
      'is_income': isIncome ? 1 : 0,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory BudgetEntry.fromMap(Map<String, dynamic> map) {
    return BudgetEntry(
      id: map['id'],
      currency: map['currency'],
      amount: map['amount'],
      description: map['description'],
      isIncome: map['is_income'] == 1,
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp']),
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }
}