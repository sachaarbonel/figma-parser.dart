import 'package:figma_parser/figma_parser.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

main(List<String> args) async {
  String token = args[0];
  String file_id = args[1];
  String node_id = args[2];
  Figma figma = figmaFromFile(node_id);

  print(figma.document.children.map((child) {
    print(child.absoluteBoundingBox.toJson());
    print(child.id);
    print(child.name);
  }));
}
