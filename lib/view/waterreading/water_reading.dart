import 'package:apart/constant/Toasty.dart';
import 'package:apart/utils/extensions/goto.dart';
import 'package:apart/view/manpower/manpower_workers_data.dart';
import 'package:apart/view_model/bescom_reading_vm.dart';
import 'package:apart/view_model/water_reading_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Constant/app_colors.dart';
import '../../view_model/manpower_shift_data_vm.dart';
import '../../widgets/base_widget.dart';
import '../../widgets/custom_appbar.dart';


class WaterReading extends BaseWidget<WaterReadingVM> {
  const WaterReading({super.key});

  @override
  Widget buildUI(BuildContext context, WaterReadingVM viewModel) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;
    final double itemHeight = itemWidth-10;

    return  Container(
      decoration:const BoxDecoration(
        // gradient:LinearGradient(
        //     begin: Alignment.topRight,
        //     end: Alignment.bottomLeft,
        //     colors: [colorTheme,colorWhite,colorLeafGreen]
        // )

        color: Colors.white,

      ),
      child: Scaffold(
        extendBody:true,
        backgroundColor:Colors.transparent,
        appBar: MyAppBar(
          title:"Water Reading",
          backgroundColor:Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top:5,right:8),
              child: Image.asset("assets/png/logo1.png",),
            )

          ],
        ),
        body: SingleChildScrollView(
          child:Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize:MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:8,top:10,bottom:0),
                          child:InkWell(
                            onTap: () {
                              viewModel.pickUpSelectDate(context,0);
                            },
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.topCenter,

                                  child: const Text("From Date",textScaleFactor: 1,
                                      style: TextStyle(color:colorTheme,decoration:TextDecoration.underline,
                                        fontSize: 14, fontWeight: FontWeight.w800,)),
                                ),

                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:8,top:5,bottom:10),
                          child:InkWell(
                            onTap: () {
                              viewModel.pickUpSelectDate(context,0);
                            },
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,

                                  child: Text(viewModel.fromdate,textScaleFactor: 1,
                                      style: const TextStyle(color:colorBlue,
                                        fontSize: 12, fontWeight: FontWeight.w800,)),
                                ),
                                const Padding(
                                  padding:  EdgeInsets.only(left: 5),
                                  child: Icon(Icons.edit,size:16,),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:8,top:10,bottom:0,right: 8),
                          child:InkWell(
                            onTap: () {
                              viewModel.pickUpSelectDate(context,1);
                            },
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.topCenter,
                                  child: const Text("To Date",textScaleFactor: 1,
                                      style: TextStyle(color:colorTheme,decoration:TextDecoration.underline,
                                        fontSize: 14, fontWeight: FontWeight.w800,)),
                                ),

                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:8,top:5,bottom:10,right: 8),
                          child:InkWell(
                            onTap: () {
                              viewModel.pickUpSelectDate(context,1);
                            },
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,

                                  child: Text(viewModel.todate,textScaleFactor: 1,

                                      style: const TextStyle(color:colorBlue,
                                        fontSize: 12, fontWeight: FontWeight.w800,)),
                                ),
                                const Padding(
                                  padding:  EdgeInsets.only(left: 5),
                                  child: Icon(Icons.edit,size:16,),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height:10,),
                DropdownButtonFormField<String>(

                  isExpanded: true,
                  validator: (value){
                    return value == null ? "Water Meter Type":null;
                  },
                  decoration: InputDecoration(
                    fillColor:colorLightOrange,
                    filled:true,
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: ScreenUtil().setSp(8)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                          .setSp(8)) //                 <--- border radius here
                      ),
                      borderSide:  const BorderSide(color: colorLightOrange),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                          .setSp(8)) //                 <--- border radius here
                      ),
                      borderSide: const BorderSide(color: colorLightOrange),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                          .setSp(8)) //                 <--- border radius here
                      ),
                      borderSide: const BorderSide(color: colorLightOrange),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                          .setSp(8)) //                 <--- border radius here
                      ),
                      borderSide: const BorderSide(color: Colors.red),
                    ),),
                  hint: Text("Select Meter Type",
                      style: GoogleFonts.poppins(
                          fontSize: ScreenUtil().setSp(11),
                          fontStyle: FontStyle.normal,
                          color:colorBlack,
                          fontWeight: FontWeight.w400)),
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: ScreenUtil().setSp(14),
                      color: colorBlack),
                  items: viewModel.waterType.map((value)
                  {
                    return DropdownMenuItem<String>(
                      onTap:(){
                        viewModel.meterTypeId=value.id.toString();
                        viewModel.onchange();
                        // value.name.toString()=="WTP final Meter"?viewModel.waterMeter.clear():viewModel.getBescomReading();

                      },
                      value: value.id.toString(),
                      child: Text(value.name.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize:
                              ScreenUtil().setSp(12),
                              color: colorBlack)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    viewModel.meterTypeId=newValue.toString();
                    viewModel.onchange();


                  },
                ),
                SizedBox(height:10,),
                Visibility(
                  visible:viewModel.meterTypeId.toString()=="2"?false:true,
                  child: DropdownButtonFormField<String>(

                    isExpanded: true,
                    validator: (value){
                      return value == null ? "Select Water Meter":null;
                    },
                    decoration: InputDecoration(
                      fillColor:colorLightOrange,
                      filled:true,
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: ScreenUtil().setSp(8)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                            .setSp(8)) //                 <--- border radius here
                        ),
                        borderSide:  const BorderSide(color: colorLightOrange),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                            .setSp(8)) //                 <--- border radius here
                        ),
                        borderSide: const BorderSide(color: colorLightOrange),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                            .setSp(8)) //                 <--- border radius here
                        ),
                        borderSide: const BorderSide(color: colorLightOrange),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil()
                            .setSp(8)) //                 <--- border radius here
                        ),
                        borderSide: const BorderSide(color: Colors.red),
                      ),),
                    hint: Text("Select Water Meter",
                        style: GoogleFonts.poppins(
                            fontSize: ScreenUtil().setSp(11),
                            fontStyle: FontStyle.normal,
                            color:colorBlack,
                            fontWeight: FontWeight.w400)),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: ScreenUtil().setSp(14),
                        color: colorBlack),
                    items: viewModel.waterMeter.map((value)
                    {
                      return DropdownMenuItem<String>(
                        onTap:(){
                          viewModel.meterId=value.id.toString();
                          viewModel.getBescomReadingData();
                        },
                        value: value.id.toString(),
                        child: Text(value.meterNo.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize:
                                ScreenUtil().setSp(12),
                                color: colorBlack)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      viewModel.meterId=newValue.toString();
                    },
                  ),
                ),
                SizedBox(height:10,),
                ListView.builder(
                    shrinkWrap:true,
                    itemCount:viewModel.waterReadings.length,
                    physics:const ScrollPhysics(),
                    scrollDirection:Axis.vertical,
                    itemBuilder: (context, i) {
                      var category = viewModel.waterReadings[i];
                      return  Padding(
                        padding: const EdgeInsets.only(bottom:5),
                        child: InkWell(
                          onTap: () {

                          },
                          child:Card(
                            elevation:5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(
                                      ScreenUtil().setSp(10))),
                            ),
                            child: Container(
                              width: ScreenUtil().screenWidth,
                              padding: EdgeInsets.only(bottom: ScreenUtil().setSp(12)),
                              decoration: BoxDecoration(
                                color: colorWhite,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(
                                        ScreenUtil().setSp(10))),
                              ),
                              child: Column(
                                mainAxisAlignment:MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(alignment:Alignment.topRight,
                                    child: Container(
                                      decoration:BoxDecoration(color:colorTheme,
                                          borderRadius:BorderRadius.only(topRight:Radius.circular(ScreenUtil().setSp(10)),bottomLeft:Radius.circular(ScreenUtil().setSp(10)))
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child:  Text("Date: ${category.date}",
                                            style: GoogleFonts.poppins(
                                                fontSize:
                                                ScreenUtil().setSp(12),
                                                color:colorWhite,
                                                fontWeight:
                                                FontWeight.w600)),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: ScreenUtil()
                                                .setSp(30)),
                                            child: Text("METER NO :",
                                                style: GoogleFonts.poppins(
                                                    fontSize: ScreenUtil()
                                                        .setSp(12),
                                                    color: colorBlack,
                                                    fontWeight:
                                                    FontWeight.w300)),
                                          )),
                                      Text(":  ",style: GoogleFonts.poppins(
                                          fontSize:
                                          ScreenUtil().setSp(12),
                                          color: colorBlack,
                                          fontWeight:
                                          FontWeight.w600)),
                                      Expanded(
                                        flex: 3,
                                        child:  Text.rich(TextSpan(children: <TextSpan>[
                                          TextSpan(
                                              text:category.meterNo,
                                              style:GoogleFonts.poppins(
                                                  fontSize:
                                                  ScreenUtil().setSp(12),
                                                  color: colorBlack,
                                                  fontWeight:
                                                  FontWeight.w600)),
                                        ])),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: ScreenUtil().setSp(5),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: ScreenUtil().setSp(30)),
                                            child: Text("START READING :",
                                                style: GoogleFonts.poppins(
                                                    fontSize: ScreenUtil()
                                                        .setSp(12),
                                                    color: colorBlack,
                                                    fontWeight:
                                                    FontWeight.w300)),
                                          )),
                                      Text(":  ",style: GoogleFonts.poppins(
                                          fontSize:
                                          ScreenUtil().setSp(12),
                                          color: colorBlack,
                                          fontWeight:
                                          FontWeight.w600)),
                                      Expanded(
                                        flex: 3,
                                        child: Text(category.startReading.toString(),
                                            style: GoogleFonts.poppins(
                                                fontSize:
                                                ScreenUtil().setSp(12),
                                                color: colorBlack,
                                                fontWeight:
                                                FontWeight.w600)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: ScreenUtil().setSp(5),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: ScreenUtil().setSp(30)),
                                            child: Text("END READING",
                                                style: GoogleFonts.poppins(
                                                    fontSize: ScreenUtil()
                                                        .setSp(12),
                                                    color: colorBlack,
                                                    fontWeight:
                                                    FontWeight.w300)),
                                          )),
                                      Text(":  ",style: GoogleFonts.poppins(
                                          fontSize:
                                          ScreenUtil().setSp(12),
                                          color: colorBlack,
                                          fontWeight:
                                          FontWeight.w600)),
                                      Expanded(
                                        flex: 3,
                                        child: Text(category.endReading.toString(),
                                            style: GoogleFonts.poppins(
                                                fontSize:
                                                ScreenUtil().setSp(12),
                                                color: colorBlack,
                                                fontWeight:
                                                FontWeight.w600)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: ScreenUtil().setSp(5),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: ScreenUtil().setSp(30)),
                                            child: Text("CONSUMPTIONS : ",
                                                style: GoogleFonts.poppins(
                                                    fontSize: ScreenUtil()
                                                        .setSp(12),
                                                    color: colorBlack,
                                                    fontWeight:
                                                    FontWeight.w300)),
                                          )),
                                      Text(":  ",style: GoogleFonts.poppins(
                                          fontSize:
                                          ScreenUtil().setSp(12),
                                          color: colorBlack,
                                          fontWeight:
                                          FontWeight.w600)),
                                      Expanded(
                                        flex: 3,
                                        child: Text.rich(TextSpan(children: <TextSpan>[
                                          TextSpan(
                                              text:category.consumption.toString(),
                                              style:GoogleFonts.poppins(
                                                  fontSize:
                                                  ScreenUtil().setSp(18),
                                                  color: colorBlack,
                                                  fontWeight:
                                                  FontWeight.w600)),
                                          TextSpan(
                                              text:" UNIT",
                                              style:GoogleFonts.poppins(
                                                  fontSize:
                                                  ScreenUtil().setSp(14),
                                                  color: colorBlack,
                                                  fontWeight:
                                                  FontWeight.w600)),
                                        ])),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: ScreenUtil().setSp(5),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),

      ),
    );
  }


}