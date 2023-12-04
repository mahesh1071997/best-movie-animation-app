

import 'dart:ui';

import 'package:flutter/material.dart';


class PageListviewPre extends StatefulWidget {
  const PageListviewPre(
      {Key? key,
        required this.children,
        required this.itemExtent,
        required this.visualizedItem,
        this.initialIndex = 0,
        this.padding = const EdgeInsets.all(0.0),
        this.onTapFrontItem,
        this.onChangeItem,
        this.backItemShadowColor = Colors.white})
      : super(key: key);

  final List<Widget> children;
  final double itemExtent;
  final int visualizedItem;
  final int initialIndex;
  final EdgeInsetsGeometry padding;
  final ValueChanged<int>? onTapFrontItem;
  final ValueChanged<int>? onChangeItem;
  final Color backItemShadowColor;

  @override
  State<PageListviewPre> createState() => _PageListviewPreState();
}

class _PageListviewPreState extends State<PageListviewPre>    with TickerProviderStateMixin {


  PageController? _pageController;
  double? _pagePercentage;
  int? _currentIndex;



  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final height = constraints.maxHeight;
      return Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: widget.padding,
            child: _PrespectiveItems(
              heightItem: widget.itemExtent,
              generateItems: widget.visualizedItem - 1,
              pagePercent: _pagePercentage,
              currentIndex: _currentIndex,
              children: widget.children,
            ),
          ),
          PageView.builder(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              physics: const AlwaysScrollableScrollPhysics(),
              onPageChanged: (value) {
                if (widget.onChangeItem != null) {
                  widget.onChangeItem!(value);
                }
              },
              itemCount: widget.children.length,
              itemBuilder: (_, index) {
                return const SizedBox();
              }),
          Positioned.fill(
              top: height-widget.itemExtent,
              child: Hero(
                key: UniqueKey(),
                tag: 'TAPIndex$_currentIndex',
                // transitionOnUserGestures: true,
                createRectTween: (begin, end) {
                  return DelayedRectTween(begin: begin!, end: end!, delay: 0.5); // Add a 0.5-second delay
                },
                child: GestureDetector(
                  onTap: () {
                    if (widget.onTapFrontItem != null) {
                      widget.onTapFrontItem!(_currentIndex!);
                    }
                  },
                ),
              ))
        ],
      );
    });

  }

  @override
  void initState() {
    _pageController = PageController(
        initialPage: widget.initialIndex,
        viewportFraction: 1 / widget.visualizedItem);
    _currentIndex = widget.initialIndex;
    _pagePercentage = 0.0;
    _pageController!.addListener(_pageListner);
    super.initState();
  }

  @override
  void dispose() {
    _pageController!.removeListener(_pageListner);
    _pageController!.dispose();
    super.dispose();
  }

  void _pageListner() {
    _currentIndex = _pageController!.page!.floor();
    _pagePercentage = (_pageController!.page! - _currentIndex!).abs();
    setState(() {});
  }
}

class _PrespectiveItems extends StatelessWidget {
  const _PrespectiveItems({

    required this.generateItems,
    required this.currentIndex,
    required this.heightItem,
    required this.pagePercent,
    required this.children,
  });

  final int? generateItems;
  final int? currentIndex;
  final double? heightItem;
  final double? pagePercent;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      final height = constrains.maxHeight;
      return Stack(
        fit: StackFit.expand,
        children: List.generate(generateItems!, (index) {
          final invertedIndex = (generateItems! - 2) - index;
          int indexPlus = index + 1;
          final positionPercentage = indexPlus / generateItems!;
          final endPositionPercentage = index / generateItems!;

          return (currentIndex! > invertedIndex)
              ? _TransformedItem(
            heightItem: heightItem!,
            factorChange: pagePercent!,
            scale: lerpDouble(.8, 1.0, positionPercentage),
            endScale: lerpDouble(.8, 1.0, endPositionPercentage),
            translateY: (height - heightItem!) * positionPercentage,
            endTranslateY: (height - heightItem!) * endPositionPercentage,
            child: children![currentIndex! - (invertedIndex + 1)],
          )
              : const SizedBox();
        })
          ..add((currentIndex! < (children!.length - 1))
              ? _TransformedItem(
            heightItem: heightItem!,
            factorChange: pagePercent!,
            translateY: height + 20,
            endTranslateY: (height - heightItem!),
            child: children![currentIndex! + 1],
          )
              : const SizedBox())
          ..insert(
              0,
              (currentIndex! > (generateItems! - 1)
                  ? _TransformedItem(
                heightItem: heightItem!,
                factorChange: 1.0,
                endScale: .8,
                child: children![currentIndex! - generateItems!],
              )
                  : const SizedBox())),
      );
    });
  }
}

class _TransformedItem extends StatelessWidget {
  const _TransformedItem({
    required this.child,
    required this.heightItem,
    required this.factorChange,
    this.scale = 1.0,
    this.endScale = 1.0,
    this.translateY = 0.0,
    this.endTranslateY = 0.0,
  });

  final Widget child;
  final double heightItem;
  final double? scale;
  final double? endScale;
  final double? translateY;
  final double? endTranslateY;
  final double factorChange;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..scale(lerpDouble(scale, endScale, factorChange))
        ..translate(
            0.0, lerpDouble(translateY!, endTranslateY!, factorChange)!, 0.0),alignment: Alignment.topCenter,filterQuality: FilterQuality.high,
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: heightItem,
          width: double.infinity,
          child: child,
        ),
      ),
    );
  }
}
class CustomRectTween extends RectTween {
  CustomRectTween({Rect? begin, Rect? end}) : super(begin: begin, end: end);

  @override
  Rect lerp(double t) {
    // Use Curves.easeInOut to create a curved transition
    final double easedT = Curves.bounceInOut.transform(t);
    return Rect.lerp(begin, end, easedT)!;
  }
}
class DelayedRectTween extends RectTween {
  final double delay; // Delay in seconds

  DelayedRectTween({
    required Rect begin,
    required Rect end,
    required this.delay,
  }) : super(begin: begin, end: end);

  @override
  Rect? lerp(double t) {
    if (t < delay) {
      // Apply a delay by keeping the initial state for a certain duration
      return begin;
    } else {
      // Normalize the time after the delay
      final double normalizedT = (t - delay) / (1.0 - delay);
      return Rect.lerp(begin, end, normalizedT)!;
    }
  }
}
