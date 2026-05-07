import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mizan_app/core/constants/mizan_app_constants.dart';
import 'package:mizan_app/models/installments_model.dart';

class InstallmentsTable extends StatelessWidget {
  final int id;
  final List<InstallmentsModel> data;
  final String monthlyinstallment;
  final String date;
  final String comments;
  final void Function() onDelete;

  const InstallmentsTable({
    super.key,
    required this.data,
    required this.monthlyinstallment,
    required this.date,
    required this.comments,
    required this.id,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        border: TableBorder.all(color: kPrimaryColor4),
        columnWidths: const {
          0: FixedColumnWidth(45),
          1: FixedColumnWidth(120),
          2: FixedColumnWidth(150),
          3: FixedColumnWidth(120),
        },
        children: [
          // Header
          TableRow(
            decoration: BoxDecoration(color: kPrimaryColor3),
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "حذف",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "ملاحظات",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "الميعاد",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "القسط الشهري",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          // Rows
          ...data.map((item) {
            return TableRow(
              decoration: BoxDecoration(color: kPrimaryColor),
              children: [
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: onDelete,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(item.comments, textAlign: TextAlign.center),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(item.dateTime, textAlign: TextAlign.center),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.monthlyinstallment.toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
