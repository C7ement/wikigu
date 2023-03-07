import 'package:equatable/equatable.dart';

class PageVersion extends Equatable {
  const PageVersion({
    required this.versionNote,
    required this.content,
    required this.date,
    required this.pushId,
  });

  factory PageVersion.fromMap(String pushId, Map<String, dynamic> map) =>
      PageVersion(
        versionNote: map['versionNote'] as String,
        content: map['content'] as String,
        date: DateTime.parse(map['date'] as String),
        pushId: pushId,
      );

  factory PageVersion.mock() => PageVersion(
        versionNote: 'versionNote',
        content: 'content',
        date: DateTime.parse('2022-11-02T06:09:30.388694'),
        pushId: 'pushId',
      );

  static Map<String, PageVersion> fromList(Map<String, dynamic> versions) {
    final versionList = versions.entries
        .map(
          (entry) => PageVersion.fromMap(
            entry.key,
            entry.value as Map<String, dynamic>,
          ),
        )
        .toList();

    return {for (var v in versionList) v.pushId: v};
  }

  final String versionNote;
  final String content;
  final DateTime date;
  final String pushId;

  @override
  List<Object> get props => [
        versionNote,
        content,
        date,
        pushId,
      ];
}
