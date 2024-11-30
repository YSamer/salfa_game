import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    this.image,
    this.width,
    this.height,
    this.border,
    this.fit,
    this.isCircel = false,
    this.color,
    this.errorColor,
    this.loadingColor,
  });
  final String? image;
  final double? width;
  final double? height;
  final double? border;
  final BoxFit? fit;
  final bool isCircel;
  final Color? color;
  final Color? errorColor;
  final Color? loadingColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(isCircel ? 100000 : border ?? 0),
      child: (image != null && image!.contains('assets/svgs'))
          ? SvgPicture.asset(
              image!,
              height: height,
              width: width,
              fit: fit ?? BoxFit.contain,
              colorFilter: color != null
                  ? ColorFilter.mode(color!, BlendMode.srcIn)
                  : null,
            )
          : (image != null && image!.contains('assets/images'))
              ? Image.asset(
                  image!,
                  height: height,
                  width: width,
                  fit: fit,
                  color: color,
                )
              : Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: loadingColor ?? Colors.grey,
                    borderRadius: BorderRadius.circular(
                      isCircel ? 100000 : border ?? 0,
                    ),
                  ),
                ),
    );
  }
}
