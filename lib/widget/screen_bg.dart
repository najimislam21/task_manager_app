import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/asset_path.dart';

class ScreenBG extends StatelessWidget {
  final Widget child;
  const ScreenBG({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Positioned.fill(child:
        SvgPicture.asset(AssetPath.backgroundSVG, fit: BoxFit.cover,),
        ),
        child,
      ],
    );
  }
}