import 'package:equatable/equatable.dart';
import 'package:wikigu/models/page_header.dart';
import 'package:wikigu/models/util/JsonExtension.dart';

class Cell extends Equatable {
  const Cell({
    required this.headers,
    required this.name,
  });
  factory Cell.empty() => const Cell(
        headers: [],
        name: '',
      );

  factory Cell.mock() => Cell(headers: [PageHeader.mock()], name: 'Maison');
  factory Cell.fromMap(Map<String, dynamic> map) => Cell(
        headers: (map['headers'] as Map<String, dynamic>)
            .values
            .map(
              (value) => PageHeader.fromMap(
                value as Map<String, dynamic>,
              ),
            )
            .toList(),
        name: map['name'] as String,
      );

  static Map<String, Cell> fromList(Map<String, dynamic> cells) => cells.map(
        (key, value) => MapEntry(
          key,
          Cell.fromMap(value as Map<String, dynamic>),
        ),
      );

  final List<PageHeader> headers;
  final String name;

  @override
  List<Object> get props => [
        headers,
        name,
      ];
}
