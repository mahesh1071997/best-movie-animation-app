import 'package:booking/app/modules/todoapp/views/todo-timeline.dart';
import 'package:booking/app/modules/todoapp/views/todo_date_detail.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controllers/todoapp_controller.dart';
import 'package:intl/intl.dart';

class TodoappView extends GetView<TodoappController> {
  const TodoappView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CalendarFormat calendarFormat = CalendarFormat.month;
    RangeSelectionMode rangeSelectionMode = RangeSelectionMode
        .toggledOn; // Can be toggled on/off by longpressing a date
    DateTime focusedDay = DateTime.now();
    DateTime? selectedDay;
    DateTime? rangeStart;
    DateTime? rangeEnd;
    final kToday = DateTime.now();
    var kTodayFinal = DateTime.now();
    final kFirstDay = DateTime(2023, 1, 1);
    final kLastDay = DateTime(kToday.year + 30, kToday.month + 3, kToday.day);
    List<Event> events = [
      Event(date: DateTime(2023, 9, 12), title: "Designing Meeting",description: "Work",startTime: "4:00 PM",endTime: ""),
      Event(date: DateTime(2023, 9, 12), title: "Lunch With Helena",description: "Family",startTime: "6:00 PM",endTime: ""),
      Event(date: DateTime(2023, 9, 12), title: "Workout",description: "Health",startTime: "7:00 PM",endTime: "9:00 PM"),
      Event(date: DateTime(2023, 9, 16), title: "Malling Of Letters",description: "Work",startTime: "All Day",endTime: ""),
      Event(date: DateTime(2023, 9, 16), title: "Lunch With Helena",description: "Family",startTime: "6:00 PM",endTime: ""),
      Event(date: DateTime(2023, 9, 16), title: "Workout",description: "Health",startTime: "7:00 PM",endTime: "9:00 PM"),
      // Add more events...
    ];
    List<Event> getEventsInRange(DateTime start, DateTime end) {
      return events
          .where(
              (event) => event.date.isAfter(start) && event.date.isBefore(end))
          .toList();
    }

    List<Event> _getEventsForDay(DateTime day) {
      return events.where((event) => isSameDay(event.date, day)).toList();
    }
    List<DateTime> getUniqueDatesInRange(DateTime start, DateTime end) {
      List<DateTime> uniqueDates = [];

      // Iterate through the range of dates
      for (DateTime date = start; date.isBefore(end) || date.isAtSameMomentAs(end); date = date.add(const Duration(days: 1))) {
        if (!uniqueDates.contains(date)) {
          uniqueDates.add(date);
        }
      }

      return uniqueDates;
    }

    List<Event> getEventsOnDate(DateTime targetDate, DateTime rangeStart, DateTime rangeEnd) {
      // Filter events based on the target date within the specified range.
      List<Event> filteredEvents = events.where((event) {
        return event.date.isAfter(rangeStart.subtract(const Duration(days: 1))) &&
            event.date.isBefore(rangeEnd.add(const Duration(days: 1))) &&
            event.date.year == targetDate.year &&
            event.date.month == targetDate.month &&
            event.date.day == targetDate.day;
      }).toList();

      // Sort the filtered events by time or any other relevant criteria.
      // You can modify this sorting logic as needed.
      filteredEvents.sort((a, b) => a.date.compareTo(b.date));

      return filteredEvents;
    }


    return Scaffold(
      appBar: AppBar(
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
        leading: const Icon(Icons.drag_handle_rounded, color: Colors.black),
        title: const Text('TodoappView'),
        centerTitle: true,
      ),
      body: GetBuilder(
        init: TodoappController(),
        id: 'TodoAppReaload',
        builder: (_) {
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(()=> TodoappTimeLine());
                      // Get.to(()=> TodoappDateDetailView());
                    },
                    child: Text(
                      DateFormat('MMMM').format(kTodayFinal).toUpperCase(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    DateFormat('MMMM')
                        .format(DateTime(kTodayFinal.year,
                            kTodayFinal.month + 1, kTodayFinal.day))
                        .toUpperCase()
                        .substring(0, 6),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.grey),
                  ),
                ],
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
                calendarFormat: calendarFormat,
                rangeSelectionMode: rangeSelectionMode,
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(selectedDay, selectedDay)) {
                    selectedDay = selectedDay;
                    focusedDay = focusedDay;
                    rangeStart = null; // Important to clean those
                    rangeEnd = null;
                    rangeSelectionMode = RangeSelectionMode.toggledOff;

                  }
                  kTodayFinal = selectedDay;

                  controller.update(['TodoAppReaload']);

                },
                onRangeSelected: (start, end, focusedDay) {
                  selectedDay = null;
                  focusedDay = focusedDay;
                  rangeStart = start;
                  rangeEnd = end;
                  rangeSelectionMode = RangeSelectionMode.toggledOn;
                  controller.update(['TodoAppReaload']);
                },
                onFormatChanged: (format) {
                  if (calendarFormat != format) {
                    calendarFormat = format;
                  }
                  controller.update(['TodoAppReaload']);
                },
                onPageChanged: (focusedDay) {
                  focusedDay = focusedDay;
                  kTodayFinal = focusedDay;
                  controller.update(['TodoAppReaload']);
                },
              ),
              if(rangeStart!=null&&rangeEnd!=null)...[
                if (getEventsInRange(rangeStart!, rangeEnd!).isNotEmpty) ...[
                 /* Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Expanded(
                      child:ListView.builder(
                        itemCount: getUniqueDatesInRange(rangeStart!, rangeEnd!).length,
                        itemBuilder: (_, dateIndex) {
                          DateTime currentDate =
                          getUniqueDatesInRange(rangeStart!, rangeEnd!)[dateIndex];
                          List<Event> eventsOnCurrentDate =
                          getEventsOnDate(currentDate, rangeStart!, rangeEnd!);

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if(eventsOnCurrentDate.isNotEmpty)...[
                                Text(
                                  DateFormat('EEEE d, MMM').format(currentDate),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                const Divider(),
                              ],

                              Expanded(
                                child: ListView.separated(
                                  itemBuilder: (_, eventIndex) {
                                    Event event = eventsOnCurrentDate[eventIndex];
                                    return  ListTile(contentPadding: EdgeInsets.all(0),
                                      leading: Text(event.startTime!),
                                      title: Text(event.title),
                                      subtitle: Text(event.description!),
                                    );
                                  },
                                  separatorBuilder: (BuildContext context, int index) {
                                    return const Divider();
                                  },
                                  itemCount: eventsOnCurrentDate.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),*/
                  Expanded(
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverPadding(
                          padding: const EdgeInsets.all(19.0),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int dateIndex) {
                                DateTime currentDate =
                                getUniqueDatesInRange(rangeStart!, rangeEnd!)[dateIndex];
                                List<Event> eventsOnCurrentDate =
                                getEventsOnDate(currentDate, rangeStart!, rangeEnd!);

                                List<Widget> eventWidgets = [];

                                if (eventsOnCurrentDate.isNotEmpty) {
                                  eventWidgets.add(
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 8,),
                                        Text(
                                          DateFormat('EEEE d, MMM').format(currentDate),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 8,),
                                        const Divider(),
                                      ],
                                    ),
                                  );
                                }

                                eventWidgets.addAll(eventsOnCurrentDate.map((event) {
                                  return Column(
                                    children: [

                                  ListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  leading: Text(event.startTime!),
                                  title: Text(event.title,style: const TextStyle(fontWeight: FontWeight.bold),),
                                  subtitle: Text(event.description!),
                                  ),
                                      const Divider(),
                                    ],
                                  );
                                }));

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: eventWidgets,
                                );
                              },
                              childCount: getUniqueDatesInRange(rangeStart!, rangeEnd!).length,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )

                ]
              ],

            ],
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

  Event({required this.date, required this.title,this.startTime, this.endTime, this.description,});
}
