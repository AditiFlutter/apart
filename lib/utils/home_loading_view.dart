import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../Constant/app_colors.dart';

class HomeLoadingView extends StatelessWidget {
  const HomeLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    return Shimmer(gradient: _shimmerGradient, child: Column(
      children: [
        Container(
          height: 170,
          decoration: BoxDecoration(
            color:Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:20,bottom:10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child:const Text("Categories",textScaleFactor: 1,
                    style: TextStyle(color:colorBlue,
                      fontSize: 14, fontWeight: FontWeight.w800,)),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              width:50,
              height:50,
              decoration: BoxDecoration(
                color:Colors.white,
                border:Border.all(color:colorTheme,width:1),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              width:50,
              height:50,
              decoration: BoxDecoration(
                color:Colors.white,
                border:Border.all(color:colorTheme,width:1),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              width:50,
              height:50,
              decoration: BoxDecoration(
                color:Colors.white,
                border:Border.all(color:colorTheme,width:1),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top:10,bottom:10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child:const Text("Feature Product",textScaleFactor: 1,
                    style: TextStyle(color:colorBlue,
                      fontSize: 14, fontWeight: FontWeight.w800,)),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              width:100,
              height:120,
              decoration: BoxDecoration(
                color:Colors.white,
                border:Border.all(color:colorTheme,width:1),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              width:100,
              height:120,
              decoration: BoxDecoration(
                color:Colors.white,
                border:Border.all(color:colorTheme,width:1),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              width:100,
              height:120,
              decoration: BoxDecoration(
                color:Colors.white,
                border:Border.all(color:colorTheme,width:1),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          height: 170,
          decoration: BoxDecoration(
            color:Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:20,bottom:10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child:const Text("Partners",textScaleFactor: 1,
                    style: TextStyle(color:colorBlue,
                      fontSize: 14, fontWeight: FontWeight.w800,)),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              width:80,
              height:80,
              decoration: BoxDecoration(
                color:Colors.white,
                border:Border.all(color:colorTheme,width:1),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
             width:80,
              height:80,
              decoration: BoxDecoration(
                color:Colors.white,
                border:Border.all(color:colorTheme,width:1),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
             width:80,
              height:80,
              decoration: BoxDecoration(
                color:Colors.white,
                border:Border.all(color:colorTheme,width:1),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top:10,bottom:10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child:const Text("Discount Products",textScaleFactor: 1,
                    style: TextStyle(color:colorBlue,
                      fontSize: 14, fontWeight: FontWeight.w800,)),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height:180,
                decoration: BoxDecoration(
                  color:Colors.white,
                  border:Border.all(color:colorTheme,width:1),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                height:180,
                decoration: BoxDecoration(
                  color:Colors.white,
                  border:Border.all(color:colorTheme,width:1),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    ));
  }
}
