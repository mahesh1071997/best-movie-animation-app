import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoappController extends GetxController {
  //TODO: Implement TodoappController

  final count = 0.obs;

  List<DateTime?> dialogCalendarPickerValue = [
    DateTime(2021, 8, 10),
    DateTime(2021, 8, 13),
  ];
  List<DateTime?> singleDatePickerValueWithDefaultValue = [
    DateTime.now(),
  ];
  List<DateTime?> multiDatePickerValueWithDefaultValue = [
    DateTime(DateUtils.dateOnly(DateTime.now()).year, DateUtils.dateOnly(DateTime.now()).month, 1),
    DateTime(DateUtils.dateOnly(DateTime.now()).year, DateUtils.dateOnly(DateTime.now()).month, 5),
    DateTime(DateUtils.dateOnly(DateTime.now()).year, DateUtils.dateOnly(DateTime.now()).month, 14),
    DateTime(DateUtils.dateOnly(DateTime.now()).year, DateUtils.dateOnly(DateTime.now()).month, 17),
    DateTime(DateUtils.dateOnly(DateTime.now()).year, DateUtils.dateOnly(DateTime.now()).month, 25),
  ];
  List<DateTime?> rangeDatePickerValueWithDefaultValue = [
    DateTime(1999, 5, 6),
    DateTime(1999, 5, 21),
  ];

  List<DateTime?> rangeDatePickerWithActionButtonsWithValue = [
    DateTime.now(),
    DateTime.now().add(const Duration(days: 5)),
  ];
  String getValueText(
      CalendarDatePicker2Type datePickerType,
      List<DateTime?> values,
      ) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
          .map((v) => v.toString().replaceAll('00:00:00.000', ''))
          .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
