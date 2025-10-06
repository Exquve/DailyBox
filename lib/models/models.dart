class ActivityType {
  static const String note = 'note';
  static const String budget = 'budget';
  static const String qrCode = 'qr_code';
  static const String linkShortener = 'link_shortener';
  static const String fileConverter = 'file_converter';
  static const String todo = 'todo';
  static const String mapLocation = 'map_location';
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

// To-Do Item Model
class TodoItem {
  final int? id;
  final String title;
  final String? description;
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime? completedAt;
  final double? latitude;
  final double? longitude;
  final String priority; // 'low', 'medium', 'high'

  TodoItem({
    this.id,
    required this.title,
    this.description,
    this.isCompleted = false,
    required this.createdAt,
    this.completedAt,
    this.latitude,
    this.longitude,
    this.priority = 'medium',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'is_completed': isCompleted ? 1 : 0,
      'created_at': createdAt.millisecondsSinceEpoch,
      'completed_at': completedAt?.millisecondsSinceEpoch,
      'latitude': latitude,
      'longitude': longitude,
      'priority': priority,
    };
  }

  factory TodoItem.fromMap(Map<String, dynamic> map) {
    return TodoItem(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      isCompleted: map['is_completed'] == 1,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      completedAt: map['completed_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['completed_at'])
          : null,
      latitude: map['latitude'],
      longitude: map['longitude'],
      priority: map['priority'] ?? 'medium',
    );
  }

  TodoItem copyWith({
    int? id,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? createdAt,
    DateTime? completedAt,
    double? latitude,
    double? longitude,
    String? priority,
  }) {
    return TodoItem(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      priority: priority ?? this.priority,
    );
  }
}

// Todo Model (simplified version for database)
class Todo {
  final int? id;
  final String title;
  final String? content;
  final bool isCompleted;
  final String priority;
  final String? dueDate;
  final int createdAt;
  final double? latitude;
  final double? longitude;

  Todo({
    this.id,
    required this.title,
    this.content,
    this.isCompleted = false,
    this.priority = 'medium',
    this.dueDate,
    required this.createdAt,
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'isCompleted': isCompleted ? 1 : 0,
      'priority': priority,
      'dueDate': dueDate,
      'createdAt': createdAt,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      isCompleted: map['isCompleted'] == 1,
      priority: map['priority'],
      dueDate: map['dueDate'],
      createdAt: map['createdAt'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }
}

// Map Location Model (for tracking where activities happened)
class MapLocation {
  final int? id;
  final String activityType;
  final String title;
  final String description;
  final double latitude;
  final double longitude;
  final DateTime timestamp;
  final String? address; // Human readable address

  MapLocation({
    this.id,
    required this.activityType,
    required this.title,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.timestamp,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'activity_type': activityType,
      'title': title,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'address': address,
    };
  }

  factory MapLocation.fromMap(Map<String, dynamic> map) {
    return MapLocation(
      id: map['id'],
      activityType: map['activity_type'],
      title: map['title'],
      description: map['description'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp']),
      address: map['address'],
    );
  }
}