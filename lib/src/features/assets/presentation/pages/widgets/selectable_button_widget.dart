import 'package:flutter/material.dart';

class SelectableButtonWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectableButtonWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        isSelected
            ? Theme.of(context).primaryColor
            : Theme.of(context).scaffoldBackgroundColor;
    final Color foregroundColor =
        isSelected ? Colors.white : Colors.grey.shade600;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          spacing: 5,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: foregroundColor),
            Text(title, style: TextStyle(color: foregroundColor, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
