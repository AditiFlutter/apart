import 'package:apart/utils/appStrings.dart';
import 'package:flutter/material.dart';
import '../../Constant/app_colors.dart';
import '../../view_model/categories_vm.dart';
import '../../widgets/base_widget.dart';
import '../../widgets/custom_appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';


class Categories extends BaseWidget<CateogoriesVM>{
  const Categories({super.key});

  @override
  Widget buildUI(BuildContext context, CateogoriesVM viewModel) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;
    final double itemHeight = itemWidth+5;
    return  Container(
      decoration:const BoxDecoration(
          gradient:LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [colorTheme,colorWhite,colorLeafGreen]
          )
      ),
      child: Scaffold(
        extendBody:true,
        backgroundColor:Colors.transparent,
        appBar: MyAppBar(
          backgroundColor:Colors.transparent,
          title:"Categories",
          leading:Image.asset("assets/png/logo1.png",),centerTitle:false,
        ),
        body: Column(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child:GridView.count(
                crossAxisCount:2,
                shrinkWrap: true,
                controller: viewModel.scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                childAspectRatio: (itemWidth / itemHeight),
                crossAxisSpacing: 30,
                mainAxisSpacing: 20,
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                children: List.generate(12, (index) {
                  return InkWell(
                    onTap: () {
                    },
                    child: Material(
                      elevation:4,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CachedNetworkImage(
                              imageUrl:"",
                              imageBuilder: (context, imageProvider) => Container(
                                width:double.infinity,
                                height:100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) => Container(width:double.infinity,
                                  height:100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                  ),child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Image.asset(placeImg),
                                  )),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Expanded(
                              child: Text("categories name",softWrap:true,
                                overflow: TextOverflow.ellipsis,textAlign:TextAlign.center,maxLines:2,
                                style: TextStyle(
                                  color:colorBlack,
                                  fontWeight:FontWeight.w500,
                                  fontSize:12,
                                ),),
                            ),

                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),)


          ],
        ),

      ),
    );
  }
}