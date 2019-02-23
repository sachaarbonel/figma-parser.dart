// To parse this JSON data, do
//
//     final figma = figmaFromJson(jsonString);

import 'dart:convert';

Figma figmaFromJson(String str) {
  final jsonData = json.decode(str);
  return Figma.fromJson(jsonData);
}

String figmaToJson(Figma data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Figma {
  Map<String, Component> components;
  Document document;
  String lastModified;
  String name;
  int schemaVersion;
  Map<String, StyleValue> styles;
  String thumbnailUrl;
  String version;

  Figma({
    this.components,
    this.document,
    this.lastModified,
    this.name,
    this.schemaVersion,
    this.styles,
    this.thumbnailUrl,
    this.version,
  });

  factory Figma.fromJson(Map<String, dynamic> json) => new Figma(
        components: new Map.from(json["components"]).map((k, v) =>
            new MapEntry<String, Component>(k, Component.fromJson(v))),
        document: Document.fromJson(json["document"]),
        lastModified: json["lastModified"],
        name: json["name"],
        schemaVersion: json["schemaVersion"],
        styles: new Map.from(json["styles"]).map((k, v) =>
            new MapEntry<String, StyleValue>(k, StyleValue.fromJson(v))),
        thumbnailUrl: json["thumbnailUrl"],
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "components": new Map.from(components)
            .map((k, v) => new MapEntry<String, dynamic>(k, v.toJson())),
        "document": document.toJson(),
        "lastModified": lastModified,
        "name": name,
        "schemaVersion": schemaVersion,
        "styles": new Map.from(styles)
            .map((k, v) => new MapEntry<String, dynamic>(k, v.toJson())),
        "thumbnailUrl": thumbnailUrl,
        "version": version,
      };
}

class Component {
  String description;
  dynamic key;
  String name;

  Component({
    this.description,
    this.key,
    this.name,
  });

  factory Component.fromJson(Map<String, dynamic> json) => new Component(
        description: json["description"],
        key: json["key"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "key": key,
        "name": name,
      };
}

class Color {
  double a;
  double b;
  double g;
  double r;

  Color({
    this.a,
    this.b,
    this.g,
    this.r,
  });

  factory Color.fromJson(Map<String, dynamic> json) => new Color(
        a: json["a"].toDouble(),
        b: json["b"].toDouble(),
        g: json["g"].toDouble(),
        r: json["r"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "a": a,
        "b": b,
        "g": g,
        "r": r,
      };
}

class AbsoluteBoundingBox {
  double height;
  double width;
  double x;
  double y;

  AbsoluteBoundingBox({
    this.height,
    this.width,
    this.x,
    this.y,
  });

  factory AbsoluteBoundingBox.fromJson(Map<String, dynamic> json) =>
      new AbsoluteBoundingBox(
        height: json["height"].toDouble(),
        width: json["width"].toDouble(),
        x: json["x"].toDouble(),
        y: json["y"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
        "x": x,
        "y": y,
      };
}

class BackgroundElement {
  EffectBlendMode blendMode;
  Color color;
  BackgroundType type;
  bool visible;
  List<Offset> gradientHandlePositions;
  List<GradientStop> gradientStops;
  double opacity;
  String imageRef;
  ScaleMode scaleMode;
  double scalingFactor;

  BackgroundElement({
    this.blendMode,
    this.color,
    this.type,
    this.visible,
    this.gradientHandlePositions,
    this.gradientStops,
    this.opacity,
    this.imageRef,
    this.scaleMode,
    this.scalingFactor,
  });

  factory BackgroundElement.fromJson(Map<String, dynamic> json) =>
      new BackgroundElement(
        blendMode: effectBlendModeValues.map[json["blendMode"]],
        color: json["color"] == null ? null : Color.fromJson(json["color"]),
        type: backgroundTypeValues.map[json["type"]],
        visible: json["visible"] == null ? null : json["visible"],
        gradientHandlePositions: json["gradientHandlePositions"] == null
            ? null
            : new List<Offset>.from(
                json["gradientHandlePositions"].map((x) => Offset.fromJson(x))),
        gradientStops: json["gradientStops"] == null
            ? null
            : new List<GradientStop>.from(
                json["gradientStops"].map((x) => GradientStop.fromJson(x))),
        opacity: json["opacity"] == null ? null : json["opacity"].toDouble(),
        imageRef: json["imageRef"] == null ? null : json["imageRef"],
        scaleMode: json["scaleMode"] == null
            ? null
            : scaleModeValues.map[json["scaleMode"]],
        scalingFactor: json["scalingFactor"] == null
            ? null
            : json["scalingFactor"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "blendMode": effectBlendModeValues.reverse[blendMode],
        "color": color == null ? null : color.toJson(),
        "type": backgroundTypeValues.reverse[type],
        "visible": visible == null ? null : visible,
        "gradientHandlePositions": gradientHandlePositions == null
            ? null
            : new List<dynamic>.from(
                gradientHandlePositions.map((x) => x.toJson())),
        "gradientStops": gradientStops == null
            ? null
            : new List<dynamic>.from(gradientStops.map((x) => x.toJson())),
        "opacity": opacity == null ? null : opacity,
        "imageRef": imageRef == null ? null : imageRef,
        "scaleMode":
            scaleMode == null ? null : scaleModeValues.reverse[scaleMode],
        "scalingFactor": scalingFactor == null ? null : scalingFactor,
      };
}

enum EffectBlendMode { NORMAL, OVERLAY, MULTIPLY }

final effectBlendModeValues = new EnumValues({
  "MULTIPLY": EffectBlendMode.MULTIPLY,
  "NORMAL": EffectBlendMode.NORMAL,
  "OVERLAY": EffectBlendMode.OVERLAY
});

class Offset {
  double x;
  double y;

  Offset({
    this.x,
    this.y,
  });

  factory Offset.fromJson(Map<String, dynamic> json) => new Offset(
        x: json["x"].toDouble(),
        y: json["y"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}

class GradientStop {
  Color color;
  double position;

  GradientStop({
    this.color,
    this.position,
  });

  factory GradientStop.fromJson(Map<String, dynamic> json) => new GradientStop(
        color: Color.fromJson(json["color"]),
        position: json["position"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "color": color.toJson(),
        "position": position,
      };
}

enum ScaleMode { FILL, TILE }

final scaleModeValues =
    new EnumValues({"FILL": ScaleMode.FILL, "TILE": ScaleMode.TILE});

enum BackgroundType { SOLID, GRADIENT_LINEAR, IMAGE }

final backgroundTypeValues = new EnumValues({
  "GRADIENT_LINEAR": BackgroundType.GRADIENT_LINEAR,
  "IMAGE": BackgroundType.IMAGE,
  "SOLID": BackgroundType.SOLID
});

enum BlendMode { PASS_THROUGH, MULTIPLY, NORMAL }

final blendModeValues = new EnumValues({
  "MULTIPLY": BlendMode.MULTIPLY,
  "NORMAL": BlendMode.NORMAL,
  "PASS_THROUGH": BlendMode.PASS_THROUGH
});

class Fill {
  StrokeBlendMode blendMode;
  Color color;
  BackgroundType type;
  double opacity;
  bool visible;

  Fill({
    this.blendMode,
    this.color,
    this.type,
    this.opacity,
    this.visible,
  });

  factory Fill.fromJson(Map<String, dynamic> json) => new Fill(
        blendMode: strokeBlendModeValues.map[json["blendMode"]],
        color: Color.fromJson(json["color"]),
        type: backgroundTypeValues.map[json["type"]],
        opacity: json["opacity"] == null ? null : json["opacity"].toDouble(),
        visible: json["visible"] == null ? null : json["visible"],
      );

  Map<String, dynamic> toJson() => {
        "blendMode": strokeBlendModeValues.reverse[blendMode],
        "color": color.toJson(),
        "type": backgroundTypeValues.reverse[type],
        "opacity": opacity == null ? null : opacity,
        "visible": visible == null ? null : visible,
      };
}

enum StrokeBlendMode { NORMAL, SCREEN, MULTIPLY }

final strokeBlendModeValues = new EnumValues({
  "MULTIPLY": StrokeBlendMode.MULTIPLY,
  "NORMAL": StrokeBlendMode.NORMAL,
  "SCREEN": StrokeBlendMode.SCREEN
});

enum BooleanOperation { SUBTRACT, EXCLUDE }

final booleanOperationValues = new EnumValues({
  "EXCLUDE": BooleanOperation.EXCLUDE,
  "SUBTRACT": BooleanOperation.SUBTRACT
});

class Document {
  AbsoluteBoundingBox absoluteBoundingBox;
  List<Fill> background;
  Color backgroundColor;
  BlendMode blendMode;
  List<Document> children;
  bool clipsContent;
  Constraints constraints;
  List<EffectElement> effects;
  String id;
  String name;
  Type type;
  List<int> characterStyleOverrides;
  String characters;
  List<BackgroundElement> fills;
  StrokeAlign strokeAlign;
  double strokeWeight;
  List<Fill> strokes;
  Style style;
  StyleOverrideTable styleOverrideTable;
  Styles styles;
  List<ExportSetting> exportSettings;
  String componentId;
  double opacity;
  double cornerRadius;
  List<double> rectangleCornerRadii;
  BooleanOperation booleanOperation;
  bool preserveRatio;
  bool visible;
  List<dynamic> layoutGrids;
  bool isMask;
  dynamic prototypeStartNodeId;

  Document({
    this.absoluteBoundingBox,
    this.background,
    this.backgroundColor,
    this.blendMode,
    this.children,
    this.clipsContent,
    this.constraints,
    this.effects,
    this.id,
    this.name,
    this.type,
    this.characterStyleOverrides,
    this.characters,
    this.fills,
    this.strokeAlign,
    this.strokeWeight,
    this.strokes,
    this.style,
    this.styleOverrideTable,
    this.styles,
    this.exportSettings,
    this.componentId,
    this.opacity,
    this.cornerRadius,
    this.rectangleCornerRadii,
    this.booleanOperation,
    this.preserveRatio,
    this.visible,
    this.layoutGrids,
    this.isMask,
    this.prototypeStartNodeId,
  });

  factory Document.fromJson(Map<String, dynamic> json) => new Document(
        absoluteBoundingBox:
            AbsoluteBoundingBox.fromJson(json["absoluteBoundingBox"]),
        background: json["background"] == null
            ? null
            : new List<Fill>.from(
                json["background"].map((x) => Fill.fromJson(x))),
        backgroundColor: json["backgroundColor"] == null
            ? null
            : Color.fromJson(json["backgroundColor"]),
        blendMode: blendModeValues.map[json["blendMode"]],
        children: json["children"] == null
            ? null
            : new List<Document>.from(
                json["children"].map((x) => Document.fromJson(x))),
        clipsContent:
            json["clipsContent"] == null ? null : json["clipsContent"],
        constraints: Constraints.fromJson(json["constraints"]),
        effects: new List<EffectElement>.from(
            json["effects"].map((x) => EffectElement.fromJson(x))),
        id: json["id"],
        name: json["name"],
        type: typeValues.map[json["type"]],
        characterStyleOverrides: json["characterStyleOverrides"] == null
            ? null
            : new List<int>.from(json["characterStyleOverrides"].map((x) => x)),
        characters: json["characters"] == null ? null : json["characters"],
        fills: json["fills"] == null
            ? null
            : new List<BackgroundElement>.from(
                json["fills"].map((x) => BackgroundElement.fromJson(x))),
        strokeAlign: json["strokeAlign"] == null
            ? null
            : strokeAlignValues.map[json["strokeAlign"]],
        strokeWeight: json["strokeWeight"] == null
            ? null
            : json["strokeWeight"].toDouble(),
        strokes: json["strokes"] == null
            ? null
            : new List<Fill>.from(json["strokes"].map((x) => Fill.fromJson(x))),
        style: json["style"] == null ? null : Style.fromJson(json["style"]),
        styleOverrideTable: json["styleOverrideTable"] == null
            ? null
            : StyleOverrideTable.fromJson(json["styleOverrideTable"]),
        styles: json["styles"] == null ? null : Styles.fromJson(json["styles"]),
        exportSettings: json["exportSettings"] == null
            ? null
            : new List<ExportSetting>.from(
                json["exportSettings"].map((x) => ExportSetting.fromJson(x))),
        componentId: json["componentId"] == null ? null : json["componentId"],
        opacity: json["opacity"] == null ? null : json["opacity"].toDouble(),
        cornerRadius: json["cornerRadius"] == null
            ? null
            : json["cornerRadius"].toDouble(),
        rectangleCornerRadii: json["rectangleCornerRadii"] == null
            ? null
            : new List<double>.from(
                json["rectangleCornerRadii"].map((x) => x.toDouble())),
        booleanOperation: json["booleanOperation"] == null
            ? null
            : booleanOperationValues.map[json["booleanOperation"]],
        preserveRatio:
            json["preserveRatio"] == null ? null : json["preserveRatio"],
        visible: json["visible"] == null ? null : json["visible"],
        layoutGrids: json["layoutGrids"] == null
            ? null
            : new List<dynamic>.from(json["layoutGrids"].map((x) => x)),
        isMask: json["isMask"] == null ? null : json["isMask"],
        prototypeStartNodeId: json["prototypeStartNodeID"],
      );

  Map<String, dynamic> toJson() => {
        "absoluteBoundingBox": absoluteBoundingBox.toJson(),
        "background": background == null
            ? null
            : new List<dynamic>.from(background.map((x) => x.toJson())),
        "backgroundColor":
            backgroundColor == null ? null : backgroundColor.toJson(),
        "blendMode": blendModeValues.reverse[blendMode],
        "children": children == null
            ? null
            : new List<dynamic>.from(children.map((x) => x.toJson())),
        "clipsContent": clipsContent == null ? null : clipsContent,
        "constraints": constraints.toJson(),
        "effects": new List<dynamic>.from(effects.map((x) => x.toJson())),
        "id": id,
        "name": name,
        "type": typeValues.reverse[type],
        "characterStyleOverrides": characterStyleOverrides == null
            ? null
            : new List<dynamic>.from(characterStyleOverrides.map((x) => x)),
        "characters": characters == null ? null : characters,
        "fills": fills == null
            ? null
            : new List<dynamic>.from(fills.map((x) => x.toJson())),
        "strokeAlign":
            strokeAlign == null ? null : strokeAlignValues.reverse[strokeAlign],
        "strokeWeight": strokeWeight == null ? null : strokeWeight,
        "strokes": strokes == null
            ? null
            : new List<dynamic>.from(strokes.map((x) => x.toJson())),
        "style": style == null ? null : style.toJson(),
        "styleOverrideTable":
            styleOverrideTable == null ? null : styleOverrideTable.toJson(),
        "styles": styles == null ? null : styles.toJson(),
        "exportSettings": exportSettings == null
            ? null
            : new List<dynamic>.from(exportSettings.map((x) => x.toJson())),
        "componentId": componentId == null ? null : componentId,
        "opacity": opacity == null ? null : opacity,
        "cornerRadius": cornerRadius == null ? null : cornerRadius,
        "rectangleCornerRadii": rectangleCornerRadii == null
            ? null
            : new List<dynamic>.from(rectangleCornerRadii.map((x) => x)),
        "booleanOperation": booleanOperation == null
            ? null
            : booleanOperationValues.reverse[booleanOperation],
        "preserveRatio": preserveRatio == null ? null : preserveRatio,
        "visible": visible == null ? null : visible,
        "layoutGrids": layoutGrids == null
            ? null
            : new List<dynamic>.from(layoutGrids.map((x) => x)),
        "isMask": isMask == null ? null : isMask,
        "prototypeStartNodeID": prototypeStartNodeId
      };
}

class Constraints {
  Horizontal horizontal;
  Vertical vertical;

  Constraints({
    this.horizontal,
    this.vertical,
  });

  factory Constraints.fromJson(Map<String, dynamic> json) => new Constraints(
        horizontal: horizontalValues.map[json["horizontal"]],
        vertical: verticalValues.map[json["vertical"]],
      );

  Map<String, dynamic> toJson() => {
        "horizontal": horizontalValues.reverse[horizontal],
        "vertical": verticalValues.reverse[vertical],
      };
}

enum Horizontal { CENTER, SCALE, LEFT_RIGHT, LEFT, RIGHT }

final horizontalValues = new EnumValues({
  "CENTER": Horizontal.CENTER,
  "LEFT": Horizontal.LEFT,
  "LEFT_RIGHT": Horizontal.LEFT_RIGHT,
  "RIGHT": Horizontal.RIGHT,
  "SCALE": Horizontal.SCALE
});

enum Vertical { CENTER, SCALE, TOP_BOTTOM, TOP, BOTTOM }

final verticalValues = new EnumValues({
  "BOTTOM": Vertical.BOTTOM,
  "CENTER": Vertical.CENTER,
  "SCALE": Vertical.SCALE,
  "TOP": Vertical.TOP,
  "TOP_BOTTOM": Vertical.TOP_BOTTOM
});

enum StrokeAlign { INSIDE, OUTSIDE, CENTER }

final strokeAlignValues = new EnumValues({
  "CENTER": StrokeAlign.CENTER,
  "INSIDE": StrokeAlign.INSIDE,
  "OUTSIDE": StrokeAlign.OUTSIDE
});

enum Type {
  VECTOR,
  RECTANGLE,
  GROUP,
  FRAME,
  TEXT,
  LINE,
  BOOLEAN_OPERATION,
  INSTANCE,
  COMPONENT,
  ELLIPSE,
  CANVAS
}

final typeValues = new EnumValues({
  "BOOLEAN_OPERATION": Type.BOOLEAN_OPERATION,
  "COMPONENT": Type.COMPONENT,
  "ELLIPSE": Type.ELLIPSE,
  "FRAME": Type.FRAME,
  "GROUP": Type.GROUP,
  "INSTANCE": Type.INSTANCE,
  "LINE": Type.LINE,
  "RECTANGLE": Type.RECTANGLE,
  "TEXT": Type.TEXT,
  "VECTOR": Type.VECTOR,
  "CANVAS": Type.CANVAS
});

class EffectElement {
  EffectBlendMode blendMode;
  Color color;
  Offset offset;
  double radius;
  EffectType type;
  bool visible;

  EffectElement({
    this.blendMode,
    this.color,
    this.offset,
    this.radius,
    this.type,
    this.visible,
  });

  factory EffectElement.fromJson(Map<String, dynamic> json) =>
      new EffectElement(
        blendMode: json["blendMode"] == null
            ? null
            : effectBlendModeValues.map[json["blendMode"]],
        color: json["color"] == null ? null : Color.fromJson(json["color"]),
        offset: json["offset"] == null ? null : Offset.fromJson(json["offset"]),
        radius: json["radius"].toDouble(),
        type: effectTypeValues.map[json["type"]],
        visible: json["visible"],
      );

  Map<String, dynamic> toJson() => {
        "blendMode":
            blendMode == null ? null : effectBlendModeValues.reverse[blendMode],
        "color": color == null ? null : color.toJson(),
        "offset": offset == null ? null : offset.toJson(),
        "radius": radius,
        "type": effectTypeValues.reverse[type],
        "visible": visible,
      };
}

enum EffectType { DROP_SHADOW, BACKGROUND_BLUR, LAYER_BLUR }

final effectTypeValues = new EnumValues({
  "BACKGROUND_BLUR": EffectType.BACKGROUND_BLUR,
  "DROP_SHADOW": EffectType.DROP_SHADOW,
  "LAYER_BLUR": EffectType.LAYER_BLUR
});

class Style {
  String fontFamily;
  String fontPostScriptName;
  double fontSize;
  int fontWeight;
  double letterSpacing;
  double lineHeightPercent;
  double lineHeightPx;
  Horizontal textAlignHorizontal;
  Vertical textAlignVertical;

  Style({
    this.fontFamily,
    this.fontPostScriptName,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    this.lineHeightPercent,
    this.lineHeightPx,
    this.textAlignHorizontal,
    this.textAlignVertical,
  });

  factory Style.fromJson(Map<String, dynamic> json) => new Style(
        fontFamily: json["fontFamily"],
        fontPostScriptName: json["fontPostScriptName"],
        fontSize: json["fontSize"].toDouble(),
        fontWeight: json["fontWeight"],
        letterSpacing: json["letterSpacing"].toDouble(),
        lineHeightPercent: json["lineHeightPercent"].toDouble(),
        lineHeightPx: json["lineHeightPx"].toDouble(),
        textAlignHorizontal: horizontalValues.map[json["textAlignHorizontal"]],
        textAlignVertical: verticalValues.map[json["textAlignVertical"]],
      );

  Map<String, dynamic> toJson() => {
        "fontFamily": fontFamily,
        "fontPostScriptName": fontPostScriptName,
        "fontSize": fontSize,
        "fontWeight": fontWeight,
        "letterSpacing": letterSpacing,
        "lineHeightPercent": lineHeightPercent,
        "lineHeightPx": lineHeightPx,
        "textAlignHorizontal": horizontalValues.reverse[textAlignHorizontal],
        "textAlignVertical": verticalValues.reverse[textAlignVertical],
      };
}

class Styles {
  String fill;
  String text;
  String stroke;
  String effect;
  String background;

  Styles({
    this.fill,
    this.text,
    this.stroke,
    this.effect,
    this.background,
  });

  factory Styles.fromJson(Map<String, dynamic> json) => new Styles(
        fill: json["fill"] == null ? null : json["fill"],
        text: json["text"] == null ? null : json["text"],
        stroke: json["stroke"] == null ? null : json["stroke"],
        effect: json["effect"] == null ? null : json["effect"],
        background: json["background"] == null ? null : json["background"],
      );

  Map<String, dynamic> toJson() => {
        "fill": fill == null ? null : fill,
        "text": text == null ? null : text,
        "stroke": stroke == null ? null : stroke,
        "effect": effect == null ? null : effect,
        "background": background == null ? null : background,
      };
}

class ExportSetting {
  Constraint constraint;
  Format format;
  String suffix;

  ExportSetting({
    this.constraint,
    this.format,
    this.suffix,
  });

  factory ExportSetting.fromJson(Map<String, dynamic> json) =>
      new ExportSetting(
        constraint: Constraint.fromJson(json["constraint"]),
        format: formatValues.map[json["format"]],
        suffix: json["suffix"],
      );

  Map<String, dynamic> toJson() => {
        "constraint": constraint.toJson(),
        "format": formatValues.reverse[format],
        "suffix": suffix,
      };
}

class Constraint {
  ConstraintType type;
  double value;

  Constraint({
    this.type,
    this.value,
  });

  factory Constraint.fromJson(Map<String, dynamic> json) => new Constraint(
        type: constraintTypeValues.map[json["type"]],
        value: json["value"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "type": constraintTypeValues.reverse[type],
        "value": value,
      };
}

enum ConstraintType { SCALE, WIDTH }

final constraintTypeValues = new EnumValues(
    {"SCALE": ConstraintType.SCALE, "WIDTH": ConstraintType.WIDTH});

enum Format { PNG }

final formatValues = new EnumValues({"PNG": Format.PNG});

class StyleOverrideTable {
  String fontFamily;
  String fontPostScriptName;
  int fontWeight;
  List<Fill> fills;
  String textDecoration;

  StyleOverrideTable({
    this.fontFamily,
    this.fontPostScriptName,
    this.fontWeight,
    this.fills,
    this.textDecoration,
  });

  factory StyleOverrideTable.fromJson(Map<String, dynamic> json) =>
      new StyleOverrideTable(
        fontFamily: json["fontFamily"] == null ? null : json["fontFamily"],
        fontPostScriptName: json["fontPostScriptName"] == null
            ? null
            : json["fontPostScriptName"],
        fontWeight: json["fontWeight"] == null ? null : json["fontWeight"],
        fills: json["fills"] == null
            ? null
            : new List<Fill>.from(json["fills"].map((x) => Fill.fromJson(x))),
        textDecoration:
            json["textDecoration"] == null ? null : json["textDecoration"],
      );

  Map<String, dynamic> toJson() => {
        "fontFamily": fontFamily == null ? null : fontFamily,
        "fontPostScriptName":
            fontPostScriptName == null ? null : fontPostScriptName,
        "fontWeight": fontWeight == null ? null : fontWeight,
        "fills": fills == null
            ? null
            : new List<dynamic>.from(fills.map((x) => x.toJson())),
        "textDecoration": textDecoration == null ? null : textDecoration,
      };
}

class StyleValue {
  String key;
  String name;
  StyleType styleType;

  StyleValue({
    this.key,
    this.name,
    this.styleType,
  });

  factory StyleValue.fromJson(Map<String, dynamic> json) => new StyleValue(
        key: json["key"] == null ? null : json["key"],
        name: json["name"],
        styleType: styleTypeValues.map[json["styleType"]],
      );

  Map<String, dynamic> toJson() => {
        "key": key == null ? null : key,
        "name": name,
        "styleType": styleTypeValues.reverse[styleType],
      };
}

enum StyleType { FILL, TEXT, EFFECT }

final styleTypeValues = new EnumValues({
  "EFFECT": StyleType.EFFECT,
  "FILL": StyleType.FILL,
  "TEXT": StyleType.TEXT
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
