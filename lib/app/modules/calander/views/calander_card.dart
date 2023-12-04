import 'dart:collection';
import 'dart:ui';

import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../demo-card.dart';
import '../../../../demoooooo.dart';

class CalanderCard extends GetView {
  final int? index;
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  CalanderCard({super.key, required this.index});

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
      _rangeStart = null; // Important to clean those
      _rangeEnd = null;
      _rangeSelectionMode = RangeSelectionMode.toggledOff;

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    _selectedDay = null;
    _focusedDay = focusedDay;
    _rangeStart = start;
    _rangeEnd = end;
    _rangeSelectionMode = RangeSelectionMode.toggledOn;

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  final List<String> titles = [
    "Yoga",
    "Push-ups",
    "Cardio",
    "Acrobatics",
    "Cardio",
    "Acrobatics",
  ];

  final List<String> titlesImages = [
    'assets/img/course1.jpg',
    'assets/img/course3.jpg',
    'assets/img/course1.jpg',
    'assets/img/course3.jpg',
    'assets/img/course1.jpg',
    'assets/img/course3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    _selectedDay = _focusedDay;
    // _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Hero(
          tag: 'TAPIndex0',
          key: UniqueKey(),
          createRectTween: (begin, end) {
            return DelayedRectTween(begin: begin!, end: end!, delay: 0.5); // Add a 0.5-second delay
          },

          child: Column(
            children: [
              TableCalendar<Event>(
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                rangeStartDay: _rangeStart,
                rangeEndDay: _rangeEnd,
                calendarFormat: _calendarFormat,
                rangeSelectionMode: _rangeSelectionMode,
                eventLoader: _getEventsForDay,
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle:  CalendarStyle(
                  // Use `CalendarStyle` to customize the UI
                  outsideDaysVisible: false,
                  defaultTextStyle:  GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                  disabledTextStyle: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                  todayTextStyle: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                  holidayTextStyle: GoogleFonts.poppins(
                    color: Colors.white,
                  ),outsideTextStyle: GoogleFonts.poppins(
                  color: Colors.white,
                ),
                  rangeEndTextStyle: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                  rangeStartTextStyle: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                  selectedTextStyle: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                  weekendTextStyle: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                  weekNumberTextStyle: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                  withinRangeTextStyle: GoogleFonts.poppins(
                    color: Colors.white,
                  ),

                ),
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    _calendarFormat = format;
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
              const SizedBox(height: 8.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: PageListview(
                    visualizedItem: 5,
                    itemExtent: MediaQuery.of(context).size.height * .26,
                    initialIndex: 5,
                    backItemShadowColor: Theme.of(context).scaffoldBackgroundColor,
                    padding: const EdgeInsets.all(10),
                    children: List.generate(
                      titles.length,
                          (index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(titlesImages[index]),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                titles[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrangeAccent,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))
  ..addAll({
    kToday: [
      Event('Today\'s Event 1'),
      Event('Today\'s Event 2'),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
