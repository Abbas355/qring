import 'package:flutter/material.dart';
import 'package:qring/utils/constants.dart' as constants;
import 'package:qring/utils/image_assets.dart';
import 'package:qring/views/profile_screen/widgets/theme_button.dart';

class CustomContainer extends StatefulWidget {
  // final IconData icon;
  final String icon;
  final String title;
  final VoidCallback? onTap;
  final String subtitle;
  final bool? initialValue;
  final ValueChanged<bool>? onChanged;
  final Widget? trailing; // Optional trailing widget, e.g., an arrow or text

  const CustomContainer({
    Key? key,
    required this.icon,
    required this.title,
    this.onChanged,
    this.onTap,
    this.subtitle = '',
    this.initialValue,
    this.trailing,
  }) : super(key: key);

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  late bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color:constants.drawerclor,
              ),
              child: Image.asset(widget.icon, height: 10),
            ),
            const SizedBox(width: 16.0),

            // Title & optional subtitle
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  Spacer(),
                  if (widget.subtitle.isNotEmpty)
                    Text(
                      widget.subtitle,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            // Conditional switch or trailing
            if (widget.title == 'Low Battery Prompt')
              Switch(
                value: _value,
                onChanged: (newValue) {
                  setState(() => _value = newValue);
                  widget.onChanged?.call(newValue);
                },
                activeColor: Colors.deepPurple[300],
                inactiveTrackColor: Colors.grey[300],
                inactiveThumbColor: Colors.grey[500],
              )
            else if (widget.trailing != null)
              widget.trailing!
            else
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
