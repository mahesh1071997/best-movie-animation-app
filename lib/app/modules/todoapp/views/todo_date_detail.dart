import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controllers/todoapp_controller.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;


class TodoappDateDetailView extends GetView<TodoappController> {
  const TodoappDateDetailView({Key? key }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    List<Event> events = [
      Event(date: DateTime(2023, 9, 12), title: "Designing Meeting",description: "Work",startTime: "4:00 PM",endTime: ""),
      Event(date: DateTime(2023, 9, 12), title: "Lunch With Helena",description: "Family",startTime: "6:00 PM",endTime: ""),
      Event(date: DateTime(2023, 9, 12), title: "Workout",description: "Health",startTime: "7:00 PM",endTime: "9:00 PM"),
      // Add more events...
    ];
    return GetBuilder(
        init: TodoappController(),
        id: 'TodoAppReaload',
      builder: (context) {
        return Stack(
          children: [
            Scaffold(backgroundColor: Colors.white,
              appBar: AppBar(
                actions: const [
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

                centerTitle: true,
              ),floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              floatingActionButton: Padding(
                padding: const EdgeInsets.only(bottom: 26),
                child: FloatingActionButton(child: CircleAvatar(backgroundColor:Colors.blue,child: Icon(Icons.add)),onPressed: (){},),
              ),

              body:  Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "TO-DO",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      Text(
                        " Sep 23",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30,color: Colors.grey),
                      ),

                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (_, index) {
                        Event event =
                        events[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            ListTile(
                              leading:  Radio(value: false, groupValue: 1, onChanged: (val){}),
                              title:  Text(event.title,style: TextStyle(fontWeight: FontWeight.bold),),
                              subtitle: Text("${event.description}"),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                      itemCount: events.length,
                    ),
                  )



                ],
              ),
            ),
            Positioned(
              right: -15,
              top: -15,
              child: Image.asset("assets/num5.png",height: 200,color: Colors.blue[100],)
            ),
          ],
        );
      }
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

class GradientCountdownText extends StatelessWidget {
  final String text;
  final double fontSize;

  GradientCountdownText({required this.text, this.fontSize = 48.0});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return ui.Gradient.linear(
          const Offset(0.0, 0.0),
          Offset(0.0, bounds.height),
          [
            Colors.redAccent.withOpacity(0.6), // Start color with opacity
            Colors.red.withOpacity(0.8),       // Middle color with opacity
            Colors.red,                         // End color
          ],
          [0.0, 0.5, 1.0], // Adjust stops for desired gradient effect
        );
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.transparent, // Text color is transparent
        ),
      ),
    );
  }
}
