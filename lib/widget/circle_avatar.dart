import 'package:journal_linker/assets/index.dart';
import 'package:flutter/material.dart';

class AppCircleAvatar extends StatelessWidget {
  const AppCircleAvatar({
    this.size = 80,
    required this.imageUrl,
    this.borderWidth = 2,
    this.shouldShowHeart = false,
    this.shouldShowOnlineIndicator = false,
    this.widgetOnlineIndicator,
    Key? key,
  }) : super(key: key);
  final double size;
  final String? imageUrl;
  final double borderWidth;
  final bool shouldShowHeart;
  final bool shouldShowOnlineIndicator;
  final Widget? widgetOnlineIndicator;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(borderWidth),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CircleAvatar(
              radius: 100,
              child: ImageAssets.networkImage(
                url: imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        if (widgetOnlineIndicator != null)
          widgetOnlineIndicator ?? SizedBox.shrink(),
      ],
    );
  }
}
