import 'package:flutter/material.dart';
import 'package:mizan_app/core/constants/mizan_app_constants.dart';
import 'package:mizan_app/core/database/sqflite.dart';
import 'package:mizan_app/models/installments_model.dart';
import 'package:mizan_app/widgets/custom%20_installments_alertdailog.dart';
import 'package:mizan_app/widgets/custom_installments_table.dart';

class InstallmentsScreen extends StatefulWidget {
  const InstallmentsScreen({super.key});

  @override
  State<InstallmentsScreen> createState() => _InstallmentsScreenState();
}

class _InstallmentsScreenState extends State<InstallmentsScreen> {
  final TextEditingController monthlyinstallment = TextEditingController();
  final TextEditingController dateTime = TextEditingController();
  final TextEditingController comments = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 70),
              child: Text(
                'ميزان',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.10,
                  fontWeight: FontWeight.bold,
                  fontFamily: kfontStyle4,
                ),
              ),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 2),
            child: Row(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.08,
                  backgroundImage: const AssetImage('assets/logo (2).png'),
                ),

                Transform.translate(
                  offset: const Offset(-15, 30),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.15,
                    margin: const EdgeInsets.only(bottom: 10.0),
                    padding: const EdgeInsets.only(right: 10.0, top: 10.0),
                    decoration: BoxDecoration(
                      color: kPrimaryColor2,
                      borderRadius: const BorderRadiusDirectional.only(
                        topStart: Radius.circular(15.0),
                        bottomStart: Radius.circular(15.0),
                        bottomEnd: Radius.circular(15.0),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'في هذه الغرفة يتم عرض او اضافة او حذف الاقساط الملتزم بها حاليا',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.045,
                                fontWeight: FontWeight.bold,
                                fontFamily: kfontStyle2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          FutureBuilder(
            future: Sqflite.loudInstallments(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData &&
                  snapshot.data!.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      // ignore: non_constant_identifier_names
                      final installments = snapshot.data![index];
                      return InstallmentsTable(
                        data: snapshot.data!,
                        monthlyinstallment: installments.monthlyinstallment
                            .toString(),
                        date: installments.dateTime,
                        comments: installments.comments,
                        id: installments.id!,
                        onDelete: () async {
                          await Sqflite.delete(snapshot.data![index].id!);
                          setState(() {});
                        },
                      );
                    },

                    itemCount: 1,
                  ),
                );
              } else {
                return Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Center(
                        child: Text(
                          'ليس لديك اي قسط بعد',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            color: kPrimaryColor2,
                            fontWeight: FontWeight.w700,
                            fontFamily: kfontStyle3,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: MediaQuery.of(context).size.height * 0.52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(65),
                            image: DecorationImage(
                              image: AssetImage('assets/no quest.gif'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniStartDocked,
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * .17,
        height: MediaQuery.of(context).size.height * .08,
        child: FloatingActionButton(
          backgroundColor: kPrimaryColor3,
          foregroundColor: kPrimaryColor,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => SingleChildScrollView(
                child: CustomAlertDailog(
                  monthlyinstallment: monthlyinstallment,
                  dateTime: dateTime,
                  comments: comments,
                  onPressedr: () {
                    monthlyinstallment.clear();
                    dateTime.clear();
                    comments.clear();
                    Navigator.pop(context);
                  },
                  buttontxtr: 'الغاء',

                  buttontxtl: 'اضافة',
                  onPressedl: () async {
                    await Sqflite.insert(
                      InstallmentsModel(
                        monthlyinstallment: double.parse(
                          monthlyinstallment.text,
                        ),
                        dateTime: dateTime.text,
                        comments: comments.text,
                      ),
                    );
                    setState(() {
                      monthlyinstallment.clear();
                      dateTime.clear();
                      comments.clear();
                      Navigator.pop(context);
                    });
                  },
                ),
              ),
            );
          },
          child: Icon(
            Icons.add,
            size: MediaQuery.of(context).size.width * 0.07,
          ),
        ),
      ),
    );
  }
}
