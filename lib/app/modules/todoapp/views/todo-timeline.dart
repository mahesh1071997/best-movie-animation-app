import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';

import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controllers/todoapp_controller.dart';
import 'package:intl/intl.dart';

class TodoappTimeLine extends GetView<TodoappController> {
  const TodoappTimeLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime focusedDay = DateTime.now();
    DateTime? selectedDay=DateTime.now();
    DateTime? rangeStart;
    DateTime? rangeEnd;
    final kToday = DateTime.now();
    var kTodayFinal = DateTime.now();
    final kFirstDay = DateTime(2023, 1, 1);
    final kLastDay = DateTime(kToday.year + 30, kToday.month + 3, kToday.day);
    List<Event> events = [
      Event(
          date: DateTime(2023, 9, 12),
          title: "Designing Meeting",
          description: "Work",
          startTime: "4:00 PM",
          endTime: ""),
      Event(
          date: DateTime(2023, 9, 12),
          title: "Lunch With Helena",
          description: "Family",
          startTime: "6:00 PM",
          endTime: ""),
      Event(
          date: DateTime(2023, 9, 12),
          title: "Workout",
          description: "Health",
          startTime: "7:00 PM",
          endTime: "9:00 PM"),
      Event(
          date: DateTime(2023, 9, 16),
          title: "Malling Of Letters",
          description: "Work",
          startTime: "All Day",
          endTime: ""),
      Event(
          date: DateTime(2023, 9, 16),
          title: "Lunch With Helena",
          description: "Family",
          startTime: "6:00 PM",
          endTime: ""),
      Event(
          date: DateTime(2023, 9, 16),
          title: "Workout",
          description: "Health",
          startTime: "7:00 PM",
          endTime: "9:00 PM"),
      // Add more events...
    ];

    List<Event> _getEventsForDay(DateTime day) {
      return events.where((event) => isSameDay(event.date, day)).toList();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GetBuilder(
        init: TodoappController(),
        id: 'TodoAppReaload',
        builder: (_) {
          return Container(
            color: Colors.white,
            child: Column(
              children: [
                AppBar(
                  actions: const [
                    Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(Icons.search, color: Colors.black),
                    SizedBox(
                      width: 25,
                    ),
                  ],
                  backgroundColor: Colors.white,
                  elevation: 0,
                  leading: const Icon(Icons.drag_handle_rounded,
                      color: Colors.black),
                  title: Text(
                    DateFormat('MMM dd, yyyy').format(DateTime(kTodayFinal.year,
                        kTodayFinal.month + 1, kTodayFinal.day)),
                    style: TextStyle(color: Colors.black),
                  ),
                  centerTitle: true,
                ),
                const SizedBox(
                  height: 29,
                ),
                TableCalendar(
                  firstDay: kFirstDay,
                  lastDay: kLastDay,
                  eventLoader: _getEventsForDay,
                  focusedDay: focusedDay,
                  selectedDayPredicate: (day) => isSameDay(selectedDay, day),
                  rangeStartDay: rangeStart,
                  headerVisible: false,
                  rangeEndDay: rangeEnd,
                  calendarFormat: CalendarFormat.week,
                  rangeSelectionMode: RangeSelectionMode.disabled,
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(selectedDay, selectedDay)) {
                      selectedDay = selectedDay;
                      focusedDay = focusedDay;
                      // rangeSelectionMode = RangeSelectionMode.toggledOff;
                    }
                    kTodayFinal = selectedDay;
                    controller.update(['TodoAppReaload']);
                  },
                  onPageChanged: (focusedDay) {
                    focusedDay = focusedDay;
                    kTodayFinal = focusedDay;
                    controller.update(['TodoAppReaload']);
                  },
                ),
               /* Expanded(
                    child: ListView.builder(
                  itemCount: 24, // Number of hours in a day
                  itemBuilder: (context, hourIndex) {
                    final currentTime = DateTime(selectedDay!.year,
                        selectedDay.month, selectedDay.day, hourIndex);
                    final eventsForHour = events ?? [];

                    return Card(
                      child: ListTile(
                        title: Text(DateFormat('h a').format(currentTime).toString()), // Display time
                        subtitle: Column(
                          children: eventsForHour.map((event) {
                            return Text(event.title); // Display event titles
                          }).toList(),
                        ),
                      ),
                    );
                  },
                )),*/
                Expanded(child: _DemoDayView())
              ],
            ),
          );
        },
      ),
    );
  }
}

class Event {
  final DateTime date;
  final String title;
  final String? startTime;
  final String? endTime;
  final String? description;

  Event({
    required this.date,
    required this.title,
    this.startTime,
    this.endTime,
    this.description,
  });
}

class _DemoDayView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    return DayView(
      initialTime: const HourMinute(hour: 1),
      date: now,userZoomable: false,
      events: [
        FlutterWeekViewEvent(
          textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,),
          title: 'An event 1',backgroundColor: Colors.pinkAccent,decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)),border: Border.all(color: Colors.blueGrey,width: 2),),
          description: 'A description 1',
          start: date.subtract(const Duration(hours: 1)),
          end: date.add(const Duration(hours: 1, minutes: 30)),
          onTap: () => 'Event 1 has been tapped !',
        ),

        FlutterWeekViewEvent(
          textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,),
          title: 'An event 2',backgroundColor: Colors.pinkAccent,decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)),border: Border.all(color: Colors.blueGrey,width: 2),),
          description: 'A description 2',
          start: date.add(const Duration(hours: 20)),
          end: date.add(const Duration(hours: 21)),
        ),
      ],
      style: DayViewStyle.fromDate(
        date: date,backgroundRulesColor: Colors.pink,currentTimeRuleColor: Colors.blueGrey,
        currentTimeCircleColor: Colors.pink,
      ),
    );
  }
}
