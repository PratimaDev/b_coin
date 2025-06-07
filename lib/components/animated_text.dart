import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedStatusText extends StatefulWidget {
  final VoidCallback? onMatchFound;

  const AnimatedStatusText({super.key, this.onMatchFound});

  @override
  State<AnimatedStatusText> createState() => _AnimatedStatusTextState();
}

class _AnimatedStatusTextState extends State<AnimatedStatusText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String dots = '.';

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )
      ..addListener(() {
        if (_controller.status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (_controller.status == AnimationStatus.dismissed) {
          _controller.forward();
        }

        setState(() {
          dots = (dots.length < 3) ? dots += '.' : '.';
        });
      })
      ..forward();

    Future.delayed(Duration(seconds: 10), () {
      if (mounted && widget.onMatchFound != null) {
        widget.onMatchFound!();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black,
      highlightColor: Colors.grey.shade300,
      child: Text(
        "Connecting$dots",
        style: TextStyle(
          fontSize: 14.sp, // Responsive font size
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
