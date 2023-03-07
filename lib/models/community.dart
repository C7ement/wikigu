import 'package:equatable/equatable.dart';
import 'package:wikigu/models/cell.dart';
import 'package:wikigu/models/page.dart';
import 'package:wikigu/models/page_header.dart';

class Community extends Equatable {
  const Community({
    required this.cells,
    required this.page,
  });
  factory Community.empty() => Community(
        cells: {},
        page: Page.mock(),
      );

  factory Community.mock() =>
      Community(cells: {'0': Cell.mock()}, page: Page.mock());
  factory Community.fromMap(Map<String, dynamic> map) => Community(
        cells: Cell.fromList(map['cells'] as Map<String, dynamic>),
        page: Page.fromMap(map['page'] as Map<String, dynamic>),
      );

  final Map<String, Cell> cells;
  final Page page;

  @override
  List<Object> get props => [
        cells,
        page,
      ];
}
