import 'package:wikigu/models/chat.dart';
import 'package:wikigu/models/page_version.dart';

class Page {
  Page({
    required this.pushId,
    required this.versions,
    required this.chat,
  });

  factory Page.mock() {
    return Page(
      pushId: 'pushId',
      versions: {'0': PageVersion.mock()},
      chat: Chat.mock(),
    );
  }

  factory Page.fromMap(Map<String, dynamic> map) {
    return Page(
      pushId: map['pushId'] as String,
      versions: PageVersion.fromList(map['versions'] as Map<String, dynamic>),
      chat: Chat.fromMap(map['chat'] as Map<String, dynamic>),
    );
  }

  final String pushId;
  final Map<String, PageVersion> versions;
  final Chat chat;
}
