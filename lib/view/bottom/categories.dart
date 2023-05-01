import 'package:apart/utils/appStrings.dart';
import 'package:apart/utils/extensions/goto.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Constant/app_colors.dart';
import '../../view_model/categories_vm.dart';
import '../../widgets/base_widget.dart';
import '../../widgets/custom_appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../manpower/manpower_cat_screen.dart';


class Categories extends BaseWidget<CateogoriesVM>{
  const Categories({super.key});

  @override
  Widget buildUI(BuildContext context, CateogoriesVM viewModel) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;
    final double itemHeight = itemWidth+5;
    return  Container(
      decoration:const BoxDecoration(
          // gradient:LinearGradient(
          //     begin: Alignment.topRight,
          //     end: Alignment.bottomLeft,
          //     colors: [colorTheme,colorWhite,colorLeafGreen]
          // )
      ),
      child: Scaffold(
        extendBody:true,
        backgroundColor:Colors.transparent,
        appBar: MyAppBar(
          centerTitle:true,
          backgroundColor:Colors.transparent,
          title:"Categories",
          leading:Image.asset("assets/png/logo1.png",),
        ),
        body: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount:2,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                childAspectRatio: (itemWidth / itemHeight),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                children: List.generate(viewModel.categoriess.length, (i) {
                  var category = viewModel.categoriess[i];
                  return Padding(
                    padding: const EdgeInsets.only(left:5,right:5,top:5,bottom: 5),
                    child: InkWell(
                      onTap: () {
                        if(viewModel.categoriess[i].name.toString()=="Manpower"){
                          context.push(const ManpowerCatScreen());
                        }else{
                          Fluttertoast.showToast(msg:"coming soon");
                        }

                      },
                      child: Material(
                        elevation:4,
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          decoration: BoxDecoration(
                            color:Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:1),
                                child: Container(
                                  width:itemWidth,
                                  height:itemHeight/1.7,
                                  decoration: BoxDecoration(
                                    color:Colors.white,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: CachedNetworkImage(
                                     imageUrl:category.icon.toString(),
                                   // imageUrl:"https://s3-alpha-sig.figma.com/img/c222/91f3/5aada705d8a1239091f8d51f7ff7db0a?Expires=1682294400&Signature=XED7kJbXAAii2dE0IHvchGYZPEBydZ6mz1CRxqatviBkg9qR4gkE5B8pLrVwp~rzgsmyasTFRSBgmqkJA49xhPY7TV2md3O9v4oyaOmMcfzo6LD1XSAII-5vVRKhlp-pEjySom3r2peT8XPGmdvvQlHZy3ubdG2TEBlpl5NQM7Z~pYEyLgrVFxefHVXrAliJZbJIEyBvh3vP9H2VqJ1Rn5UqMNzTN9enBpude94Pi1t9hk4fNcvNQdyrficFR2H-Fz2NlSvU3JzwDY57plNljE7o-P0~qx3MFID57uK2c~Z~tkoATOAyY1ajEZ-s-h7sGaPAkS0YNv1XgAOQg~s3wQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                                    imageBuilder: (context, imageProvider) => Container(
                                      decoration: BoxDecoration(
                                        color:Colors.white,
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Center(child: Image.asset(placeImg)),
                                    ),
                                    errorWidget: (context, url, error) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(placeImg),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(


                                      width: 100,
                                      child: Text(category.name.toString(),textScaleFactor: 1,
                                        softWrap:true,
                                        overflow: TextOverflow.ellipsis,textAlign:TextAlign.center,
                                        style: const TextStyle(
                                          color:colorTheme,
                                          fontWeight:FontWeight.w600,
                                          fontSize:10,
                                        ),
                                        maxLines:2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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