import 'package:apart/Constant/app_colors.dart';
import 'package:apart/view_model/calendra_vm.dart';
import 'package:apart/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import '../../widgets/base_widget.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class Calendar extends BaseWidget<CalendarVM>{
  const Calendar({super.key});


  @override
  Widget buildUI(BuildContext context, CalendarVM viewModel) {
    return Container(
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
            title:"Schedule Work",
            centerTitle:false,
            backgroundColor:Colors.transparent,
            leading:Image.asset("assets/png/logo1.png",),

          ),
          body:SfCalendar(
            view: CalendarView.month,
            todayHighlightColor:colorThemeGreen,
            cellBorderColor:colorThemeGreen,
            showNavigationArrow:true,
            headerHeight:70,
            dataSource: MeetingDataSource(_getDataSource()),
            monthViewSettings: const MonthViewSettings(showAgenda: true,
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment
            ),
          ),
      ),
    );
  }
  List<Meeting> _getDataSource() {
    List<Meeting> meetings =[];
    print(DateTime(2023, 02, 27, 9,05));
    meetings.add(
        Meeting("Task 1",DateTime(2023, 02, 25, 9,05),DateTime(2023, 02, 25, 9,08),
            colorTheme, false));
    meetings.add(
        Meeting("Task 2",DateTime(2023, 02, 23, 9,10),DateTime(2023, 02, 23, 9,08),
            colorTheme, false));

    return meetings;
  }

}
class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source){
    appointments = source;

  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }
  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }


  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
class Meeting {
  Meeting(this.eventName, this.from,this.to,this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}