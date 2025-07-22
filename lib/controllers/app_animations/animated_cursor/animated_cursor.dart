import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AnimatedCursor extends StatefulWidget {
  final Color color;
  final Widget child;

  const AnimatedCursor({
    super.key,
    required this.color,
    required this.child,
  });

  @override
  State<AnimatedCursor> createState() => _AnimatedCursorState();
}

class _AnimatedCursorState extends State<AnimatedCursor>
    with SingleTickerProviderStateMixin {
  Offset _cursorPosition = Offset.zero;
  Offset _smoothedPosition = Offset.zero;
  late Ticker _ticker;

  @override
  void initState() {
    super.initState();

    _ticker = createTicker((elapsed) {
      final dx = (_cursorPosition.dx - _smoothedPosition.dx) * 0.4;
      final dy = (_cursorPosition.dy - _smoothedPosition.dy) * 0.4;

      if ((dx.abs() > 0.1) || (dy.abs() > 0.1)) {
        setState(() {
          _smoothedPosition =
              Offset(_smoothedPosition.dx + dx, _smoothedPosition.dy + dy);
        });
      }
    })..start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.none,
      onHover: (event) {
        _cursorPosition = event.position;
      },
      child: Stack(
        children: [
          Positioned.fill(child: widget.child),
          Positioned(
            left: _smoothedPosition.dx - 15,
            top: _smoothedPosition.dy - 15,
            child: IgnorePointer(
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.3),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: widget.color.withOpacity(0.8),
                      blurRadius: 20,
                      spreadRadius: 8,
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: Container(color: Colors.transparent),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
