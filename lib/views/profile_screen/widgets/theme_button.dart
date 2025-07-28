import 'package:flutter/material.dart';
import 'package:qring/utils/constants.dart' as constants;
import 'package:qring/utils/image_assets.dart';

class DayNightToggleButton extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;

  const DayNightToggleButton({
    super.key,
    this.initialValue = true,
    this.onChanged,
  });

  @override
  State<DayNightToggleButton> createState() => _DayNightToggleButtonState();
}

class _DayNightToggleButtonState extends State<DayNightToggleButton> {
  late bool _isDayMode;
  late bool _animationDirection; // Controls animation direction separately

  @override
  void initState() {
    super.initState();
    _isDayMode = widget.initialValue;
    _animationDirection = _isDayMode;
  }

  void _handleTap() {
    setState(() {
      // Change only the animation direction first
      _animationDirection = !_isDayMode;
    });

    // Wait for animation to complete, then change the icon mode
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _isDayMode = !_isDayMode;
        });
        widget.onChanged?.call(_isDayMode);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double toggleWidth = 50.0;
    final double toggleHeight = 20.0;
    final double iconSize = 20.0;

    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: toggleWidth,
        height: toggleHeight,
        decoration: BoxDecoration(
          color: constants.drawerclor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              left: _animationDirection ? 2.0 : toggleWidth - iconSize - 5.0,
              top: (toggleHeight - iconSize) / 2,
              child: Image.asset(
                _isDayMode
                    ? ImageAssets.profile['day']!
                    : ImageAssets.profile['night']!,
                width: iconSize,
                height: iconSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
