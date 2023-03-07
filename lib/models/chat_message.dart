import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ChatMessage extends Equatable {
  const ChatMessage({
    required this.content,
    required this.userColor,
    required this.userName,
    required this.date,
  });

  factory ChatMessage.mock() {
    return ChatMessage(
      content: 'coucou',
      userColor: Colors.teal,
      userName: 'userName',
      date: DateTime.parse('2022-11-02T06:09:30.388694'),
    );
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      content: map['content'] as String,
      userColor: Color(map['userColor'] as int),
      userName: map['userName'] as String,
      date: DateTime.parse(map['date'] as String),
    );
  }

  static List<ChatMessage> fromList(Map<String, dynamic> versions) {
    return versions.values
        .map(
          (map) => ChatMessage.fromMap(
            map as Map<String, dynamic>,
          ),
        )
        .toList();
  }

  final String content;
  final Color userColor;
  final String userName;
  final DateTime date;

  @override
  List<Object> get props => [
        content,
        userColor,
        userName,
        date,
      ];
}
