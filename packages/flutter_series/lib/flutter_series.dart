library flutter_series;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizedHeight extends StatelessWidget {
  const SizedHeight(this.height, {Key? key}) : super(key: key);
  final double height;
  @override
  Widget build(BuildContext context) => SizedBox(height: height);
}

class SizedWidth extends StatelessWidget {
  const SizedWidth(this.width, {Key? key}) : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) => SizedBox(width: width);
}

void navPush(BuildContext context, Widget page, {double pops = 0}) {
  for (var i = 0; i < pops; i++) {
    Navigator.pop(context);
  }
  Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
}

class HDivider extends StatelessWidget {
  const HDivider(this.height, {Key? key}) : super(key: key);

  final double height;
  @override
  Widget build(BuildContext context) {
    return Divider(height: height, color: Colors.white.withOpacity(0.3));
  }
}

class VDivider extends StatelessWidget {
  const VDivider(this.width, {Key? key}) : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) {
    return VerticalDivider(width: width, color: Colors.white.withOpacity(0.3));
  }
}

enum Interleaving { none, full, inBetween, fullDivided, inBetweenDivided }
enum _ListType { column, row }

class PadColumn extends StatelessWidget {
  const PadColumn({
    Key? key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.padding = EdgeInsets.zero,
    this.interleaving = Interleaving.none,
    this.spacing,
  }) : super(key: key);

  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsetsGeometry padding;
  final Interleaving interleaving;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    Interleaving localInterleaving = interleaving;
    if (spacing != null && interleaving == Interleaving.none) {
      localInterleaving = Interleaving.inBetween;
    }
    List<Widget> widgets = children;
    if (localInterleaving != Interleaving.none) {
      widgets = divideWidgets(
        children: children,
        interleaving: localInterleaving,
        spacing: spacing ?? 10,
        listType: _ListType.column,
      );
    }
    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: widgets,
      ),
    );
  }
}

class PadRow extends StatelessWidget {
  const PadRow({
    Key? key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.padding = EdgeInsets.zero,
    this.interleaving = Interleaving.none,
    this.spacing,
  }) : super(key: key);

  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsetsGeometry padding;
  final Interleaving interleaving;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    Interleaving localInterleaving = interleaving;
    if (spacing != null && interleaving == Interleaving.none) {
      localInterleaving = Interleaving.inBetween;
    }
    List<Widget> widgets = children;
    if (localInterleaving != Interleaving.none && children.isNotEmpty) {
      widgets = divideWidgets(
        children: children,
        interleaving: localInterleaving,
        spacing: spacing ?? 10,
        listType: _ListType.row,
      );
    }
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: widgets,
      ),
    );
  }
}

List<Widget> divideWidgets({
  required List<Widget> children,
  required Interleaving interleaving,
  required double spacing,
  required _ListType listType,
}) {
  List<Widget> widgets = children;
  int childIndex = -1;

  bool type = interleaving == Interleaving.inBetween ||
      interleaving == Interleaving.inBetweenDivided;
  bool divider = interleaving == Interleaving.inBetweenDivided ||
      interleaving == Interleaving.fullDivided;

  int length = type ? children.length * 2 - 1 : children.length * 2 + 1;
  int comparisonNum = type ? 1 : 0;

  widgets = List.generate(length, (index) {
    if (index % 2 == comparisonNum) {
      if (listType == _ListType.column) {
        return divider ? HDivider(spacing) : SizedHeight(spacing);
      } else {
        return divider ? VDivider(spacing) : SizedWidth(spacing);
      }
    }
    childIndex++;
    return children[childIndex];
  });
  return widgets;
}
