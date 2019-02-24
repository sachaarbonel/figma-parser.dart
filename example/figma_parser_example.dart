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

List<List<double>> group_runs(List<double> l, double threshold) {
  l.sort();
  List<List<double>> out = <List<double>>[];
  List<double> temp = <double>[];
  temp.add(l[0]);
  for (var i = 0; i < l.length - 1; i++) {
    if (l[i + 1] <= l[i] + threshold) {
      temp.add(l[i + 1]);
    } else {
      out.add(temp);
      temp = <double>[];
      temp.add(l[i + 1]);
    }
  }
  out.add(temp);
  return out;
}

double normalize(int value, int min, int max) {
  return 1 - ((value - min) / (max - min));
}

main(List<String> args) async {
  // String token = args[0];
  // String file_id = args[1];
  // String node_id = args[2];
  //Figma figma = figmaFromFile(node_id);
  List<int> listInts = [1010, 790, 810, 990, 590, 610];
  listInts.sort();
  print(listInts.reversed);
  int _max = listInts.reduce(max);
  int _min = listInts.reduce(min);
  List<double> normalizedList = <double>[];
  for (int i in listInts) {
    normalizedList.add(normalize(i, _max, _min));
  }
  print(normalizedList.reversed);
  print(group_runs(normalizedList, 0.1).reversed);
}
