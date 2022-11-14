import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Photos extends StatelessWidget {
  const Photos({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.red,
            height: 200,
            child: Image(image: AssetImage("images/imgouther/cta.jpg")),
          ),
          Container(
            height: 200,
            color: Colors.blue,
            child: SvgPicture.asset("images/imgsvg/features-5.svg",),
          ),
        ],
      ),
    );
  }
}