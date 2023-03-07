import 'package:wikigu/models/chat_message.dart';

class Chat {
  Chat({
    required this.messages,
  });

  factory Chat.mock() => Chat(
        messages: [ChatMessage.mock()],
      );

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      messages: ChatMessage.fromList(map['messages'] as Map<String, dynamic>),
    );
  }

  final List<ChatMessage> messages;
}
