import 'package:flutter/cupertino.dart';

void showCupertinoSnackBar({
  required BuildContext context,
  required String message,
  required Color backgroundColor,
  int durationMillis = 3000,
}) {
  const animationDurationMillis = 200;
  final overlayEntry = OverlayEntry(
    builder: (context) =>
     _CupertinoSnackBar(
      message: message,
      backgroundColor: backgroundColor,
      animationDurationMillis: animationDurationMillis,
      waitDurationMillis: durationMillis,
    ),
  );
  Future.delayed(
    Duration(milliseconds: durationMillis + 2 * animationDurationMillis),
    overlayEntry.remove,
  );
  Overlay.of(context).insert(overlayEntry);
}

class _CupertinoSnackBar extends StatefulWidget {
  final String message;
  final int animationDurationMillis;
  final int waitDurationMillis;
  final Color backgroundColor;

  const _CupertinoSnackBar({
    Key? key,
    required this.message,
        required this.backgroundColor,

    required this.animationDurationMillis,
    required this.waitDurationMillis,
  }) : super(key: key);

  @override
  State<_CupertinoSnackBar> createState() => _CupertinoSnackBarState();
}

class _CupertinoSnackBarState extends State<_CupertinoSnackBar> {
  bool _show = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => setState(() => _show = true));
    Future.delayed(
      Duration(
        milliseconds: widget.waitDurationMillis,
      ),
      () {
        if (mounted) {
          setState(() => _show = false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      bottom: _show ? 8.0 : -50.0,
      left: 8.0,
      right: 8.0,

      curve: _show ? Curves.linearToEaseOut : Curves.easeInToLinear,
      duration: Duration(milliseconds: widget.animationDurationMillis),
      child: CupertinoPopupSurface(
        child: Container(
          color: widget.backgroundColor ,
          padding: const EdgeInsets.symmetric(
            horizontal: 4.0,
            vertical: 14.0,
          ),
          child: Text(
            widget.message,
            semanticsLabel: widget.message,
            style: TextStyle(
              fontSize: 16.0,
              color: CupertinoColors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}