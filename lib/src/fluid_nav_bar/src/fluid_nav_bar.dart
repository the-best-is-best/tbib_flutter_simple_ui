import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tbib_flutter_simple_ui/src/fluid_nav_bar/src/curves.dart';
import 'package:tbib_flutter_simple_ui/src/fluid_nav_bar/src/fluid_nav_bar_item.dart';
import 'package:tbib_flutter_simple_ui/tbib_flutter_simple_ui.dart';

typedef FluidNavBarChangeCallback = void Function(int selectedIndex);

typedef FluidNavBarItemBuilder = Widget Function(
  FluidNavBarIcon icon,
  FluidNavBarItem item,
);

/// A widget to display a fluid navigation bar with icon buttons.
///
///
/// # Basic usage
///
/// {@tool sample}
/// ```dart
/// FluidNavBar(
///   icons: [
///     FluidNavBarIcon(iconPath: "assets/home.svg"),
///     FluidNavBarIcon(iconPath: "assets/favorites.svg"),
///   ]
/// )
/// ```
/// {@end-tool}
///
///
class FluidNavBar extends StatefulWidget {
  const FluidNavBar({
    required this.icons,
    super.key,
    this.onChange,
    this.style,
    this.animationFactor = 1.0,
    this.scaleFactor = 1.2,
    this.defaultIndex = 0,
    this.height,
    FluidNavBarItemBuilder? itemBuilder,
  })  : itemBuilder = itemBuilder ?? _identityBuilder,
        assert(icons.length > 1);

  /// The list of icons to display
  final List<FluidNavBarIcon> icons;

  /// A callback called when an icon has been tapped with its index
  final FluidNavBarChangeCallback? onChange;

  /// The style to use to paint the fluid navigation bar and its icons
  final FluidNavBarStyle? style;

  /// Delay to adjust the overall delay of the animations
  ///   * < 1 is faster
  ///   * = 1 default velocity
  ///   * > 1 is slower
  final double animationFactor;

  /// The scale factor used when an icon is tapped
  /// 1.0 means that the icon is not scaled and 1.5 means the icons is scaled to +50%
  /// An optional builder to change or wrap the builded item
  ///
  /// This is where you can wrap the item with semantic or
  /// other widget
  final double scaleFactor;

  /// Default Index is used for setting up selected item on start of the application.
  /// By default set to 0, meaning that item with index 0 will be selected.
  final int defaultIndex;

  /// [FluidNavBar] height
  final double? height;

  final FluidNavBarItemBuilder itemBuilder;

  @override
  State createState() => _FluidNavBarState();

  static Widget _identityBuilder(FluidNavBarIcon icon, FluidNavBarItem item) =>
      item;
}

class _FluidNavBarState extends State<FluidNavBar>
    with TickerProviderStateMixin {
  int _currentIndex = 0;

  late final AnimationController _xController;
  late final AnimationController _yController;

  @override
  void initState() {
    super.initState();

    _currentIndex = widget.defaultIndex;

    _xController = AnimationController(
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
    );
    _yController = AnimationController(
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
    );

    Listenable.merge([_xController, _yController]).addListener(() {
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    _xController.value =
        _indexToPosition(_currentIndex) / MediaQuery.of(context).size.width;
    _yController.value = 1.0;

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appSize = MediaQuery.of(context).size;
    final height = Platform.isIOS ? 80.0 : 56.0;

    return SizedBox(
      width: appSize.width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            width: appSize.width,
            height: height,
            child: _buildBackground(),
          ),
          Positioned(
            left: (appSize.width - _getButtonContainerWidth()) / 2,
            top: 0,
            width: _getButtonContainerWidth(),
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _buildButtons(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return CustomPaint(
      painter: _BackgroundCurvePainter(
        _xController.value * MediaQuery.of(context).size.width,
        Tween<double>(
          begin: Curves.easeInExpo.transform(_yController.value),
          end: const ElasticOutCurve(0.38).transform(_yController.value),
        ).transform(_yController.velocity.sign * 0.5 + 0.5),
        widget.style?.barBackgroundColor ?? Theme.of(context).primaryColor,
      ),
    );
  }

  List<Widget> _buildButtons() {
    return widget.icons
        .asMap()
        .entries
        .map(
          (entry) => widget.itemBuilder(
            entry.value,
            FluidNavBarItem(
              entry.value.svgPath ?? entry.value.svgPath,
              entry.value.icon,
              _currentIndex == entry.key,
              () => _handleTap(entry.key),
              entry.value.selectedForegroundColor ??
                  widget.style?.iconSelectedForegroundColor ??
                  Theme.of(context).primaryColor.withOpacity(.1),
              entry.value.unselectedForegroundColor ??
                  widget.style?.iconUnselectedForegroundColor ??
                  Colors.black,
              entry.value.backgroundColor ??
                  widget.style?.iconBackgroundColor ??
                  widget.style?.barBackgroundColor ??
                  Theme.of(context).colorScheme.secondary,
              widget.scaleFactor,
              widget.animationFactor,
            ),
          ),
        )
        .toList();
  }

  double _getButtonContainerWidth() {
    var width = MediaQuery.of(context).size.width;
    if (width > 400.0) {
      width = 400.0;
    }
    return width;
  }

  double _indexToPosition(int index) {
    // Calculate button positions based off of their
    // index (works with `MainAxisAlignment.spaceAround`)
    final buttonCount = widget.icons.length;
    final appWidth = MediaQuery.of(context).size.width;
    final buttonsWidth = _getButtonContainerWidth();
    final startX = (appWidth - buttonsWidth) / 2;
    return startX +
        index.toDouble() * buttonsWidth / buttonCount +
        buttonsWidth / (buttonCount * 2.0);
  }

  void _handleTap(int index) {
    if (_currentIndex == index || _xController.isAnimating) return;

    setState(() {
      _currentIndex = index;
    });

    _yController.value = 1.0;
    _xController.animateTo(
      _indexToPosition(index) / MediaQuery.of(context).size.width,
      duration: const Duration(milliseconds: 620 ~/ 2) * widget.animationFactor,
    );
    Future.delayed(
      const Duration(milliseconds: 500 ~/ 2) * widget.animationFactor,
      () {
        _yController.animateTo(
          1,
          duration:
              const Duration(milliseconds: 1200 ~/ 2) * widget.animationFactor,
        );
      },
    );
    _yController.animateTo(
      0,
      duration: const Duration(milliseconds: 300 ~/ 2) * widget.animationFactor,
    );

    if (widget.onChange != null) {
      widget.onChange!(index);
    }
  }
}

class _BackgroundCurvePainter extends CustomPainter {
  _BackgroundCurvePainter(double x, double normalizedY, Color color)
      : _x = x,
        _normalizedY = normalizedY,
        _color = color;
  // Top: 0.6 point, 0.35 horizontal
  // Bottom:

  static const _radiusTop = 54.0;
  static const _radiusBottom = 44.0;
  static const _horizontalControlTop = 0.6;
  static const _horizontalControlBottom = 0.5;
  static const _pointControlTop = 0.35;
  static const _pointControlBottom = 0.85;
  static const _topY = -10.0;
  static const _bottomY = 54.0;
  static const _topDistance = 0.0;
  static const _bottomDistance = 6.0;

  final double _x;
  final double _normalizedY;
  final Color _color;

  @override
  void paint(Canvas canvas, Size size) {
    // Paint two cubic bezier curves using various linear interpolations based off of the `_normalizedY` value
    final norm = const LinearPointCurve(0.5, 2).transform(_normalizedY) / 2;

    final radius =
        Tween<double>(begin: _radiusTop, end: _radiusBottom).transform(norm);
    // Point colinear to the top edge of the background pane
    final anchorControlOffset = Tween<double>(
      begin: radius * _horizontalControlTop,
      end: radius * _horizontalControlBottom,
    ).transform(const LinearPointCurve(0.5, 0.75).transform(norm));
    // Point that slides up and down depending on distance for the target x position
    final dipControlOffset = Tween<double>(
      begin: radius * _pointControlTop,
      end: radius * _pointControlBottom,
    ).transform(const LinearPointCurve(0.5, 0.8).transform(norm));
    final y = Tween<double>(begin: _topY, end: _bottomY)
        .transform(const LinearPointCurve(0.2, 0.7).transform(norm));
    final dist = Tween<double>(begin: _topDistance, end: _bottomDistance)
        .transform(const LinearPointCurve(0.5, 0).transform(norm));
    final x0 = _x - dist / 2;
    final x1 = _x + dist / 2;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(x0 - radius, 0)
      ..cubicTo(
        x0 - radius + anchorControlOffset,
        0,
        x0 - dipControlOffset,
        y,
        x0,
        y,
      )
      ..lineTo(x1, y)
      ..cubicTo(
        x1 + dipControlOffset,
        y,
        x1 + radius - anchorControlOffset,
        0,
        x1 + radius,
        0,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    final paint = Paint()..color = _color;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_BackgroundCurvePainter oldPainter) {
    return _x != oldPainter._x ||
        _normalizedY != oldPainter._normalizedY ||
        _color != oldPainter._color;
  }
}
