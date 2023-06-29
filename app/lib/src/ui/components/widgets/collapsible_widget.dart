import 'package:flutter/material.dart';

class CollapsibleWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final String titleWhenCollapsed;
  final String titleWhenExpanded;
  final double minHeight;

  const CollapsibleWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1000),
    this.titleWhenCollapsed = 'Show More',
    this.titleWhenExpanded = 'Show Less',
    required this.minHeight,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CollapsibleWidgetState createState() => _CollapsibleWidgetState();
}

class _CollapsibleWidgetState extends State<CollapsibleWidget>
    with TickerProviderStateMixin {
  GlobalKey? _keyFoldChild;
  bool collapsed = true;
  double? _childWidth;
  AnimationController? _controller;
  Animation<double>? _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _keyFoldChild = GlobalKey();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  }

  void _afterLayout(_) {
    final RenderBox renderBox =
        _keyFoldChild!.currentContext!.findRenderObject()! as RenderBox;
    _sizeAnimation =
        Tween<double>(begin: widget.minHeight, end: renderBox.size.height)
            .animate(_controller!);
    _childWidth = renderBox.size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: _controller!,
          builder: (context, child) {
            if (_sizeAnimation == null) {
              return ClipRect(
                child: SizedOverflowBox(
                  alignment: Alignment.topCenter,
                  size: Size.fromHeight(widget.minHeight),
                  child: child,
                ),
              );
            } else {
              return ClipRect(
                child: SizedOverflowBox(
                  alignment: Alignment.topCenter,
                  size: Size(_childWidth!, _sizeAnimation!.value),
                  child: child,
                ),
              );
            }
          },
          child: Container(
            key: _keyFoldChild,
            child: widget.child,
          ),
        ),
        TextButton(
          onPressed: () {
            if (collapsed) {
              _controller!.forward();
            } else {
              _controller!.reverse();
            }
            setState(() {
              collapsed = !collapsed;
            });
          },
          child: Text(
            collapsed ? widget.titleWhenCollapsed : widget.titleWhenExpanded,
          ),
        ),
      ],
    );
  }
}
