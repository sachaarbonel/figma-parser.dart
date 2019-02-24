import 'package:figma_parser/figma_parser.dart';
import 'package:collection/collection.dart';
import 'package:queries/collections.dart';
import 'dart:math';

class Results {
  List<Result> results;
  Results(this.results);
}

class Result {
  String name;
  Coordinates coordinates;
  String id;
  Result({this.id, this.coordinates, this.name});
}

class Coordinates {
  double x;
  double y;

  Coordinates({this.x, this.y});

  factory Coordinates.fromJson(Map<String, dynamic> json) => new Coordinates(
        x: json["x"].toDouble(),
        y: json["y"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}

List<List<int>> group_runs(List<int> l, int threshold) {
  l.sort();
  List<List<int>> out = <List<int>>[];
  List<int> temp = <int>[];
  temp.add(l[0]);
  for (var i = 0; i < l.length - 1; i++) {
    if (l[i + 1] == l[i] + threshold) {
      temp.add(l[i + 1]);
    } else {
      out.add(temp);
      temp = <int>[];
      temp.add(l[i + 1]);
    }
  }
  out.add(temp);
  return out;
}

main(List<String> args) async {
  // String token = args[0];
  // String file_id = args[1];
  // String node_id = args[2];
  // Figma figma = figmaFromFile(node_id);
  List<int> listInts = [0, 1, 3, 4, 5, 10, 11, 12, 13, 20, 21, 22];
  print(group_runs(listInts, 2));
}
