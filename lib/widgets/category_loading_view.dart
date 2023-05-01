import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../Constant/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryLoadingView extends StatelessWidget {
  const CategoryLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;
    final double itemHeight = itemWidth+45;
    var _shimmerGradient = LinearGradient(
      colors: [
        Colors.grey.shade300,
        Colors.grey.shade400,
        Colors.grey.shade300,
      ],
      stops: const [
        0.1,
        0.3,
        0.4,
      ],
      begin: const Alignment(-1.0, -0.5),
      end: const Alignment(1.0, 0.5),
      tileMode: TileMode.repeated,
    );
    return Shimmer(gradient: _shimmerGradient, child: GridView.count(
      crossAxisCount:3,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      childAspectRatio: (itemWidth / itemHeight),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
      children: List.generate(15, (index) {
        return Container(
          width:double.infinity,
          height:100,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color:colorTheme,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }),
    ));
  }
}
