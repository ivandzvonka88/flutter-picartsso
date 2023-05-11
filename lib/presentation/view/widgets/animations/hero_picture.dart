import 'dart:typed_data';

import 'package:flutter/material.dart';

class HeroPicture extends StatelessWidget {
  const HeroPicture({
    Key? key,
    required this.picture,
    required this.onTap,
  }) : super(key: key);

  final Uint8List picture;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Hero(
      tag: 'image',
      child: Material(
        color: Colors.transparent,
        child: InteractiveViewer(
          child: GestureDetector(
            onTap: onTap,
            child: Center(
              child: SizedBox(
                height: mediaQuery.size.height,
                width: mediaQuery.size.width,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.memory(picture),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
