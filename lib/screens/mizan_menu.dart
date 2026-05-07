import 'package:flutter/material.dart';

import 'package:mizan_app/core/constants/mizan_app_constants.dart';
import 'package:mizan_app/core/database/cache_helper.dart';
import 'package:mizan_app/screens/currency_exchange_screans.dart';
import 'package:mizan_app/screens/installments_screen.dart';
import 'package:mizan_app/screens/oraganize_expenses.dart';
import 'package:mizan_app/screens/personal_info_screen.dart';
import 'package:mizan_app/widgets/custom_mizanmenu_container.dart';

class MizanMenu extends StatelessWidget {
  const MizanMenu({super.key, required this.userName, required this.sallary});
  final String userName;
  final String sallary;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'ميزان',

              style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.width * 0.10,
                fontWeight: FontWeight.bold,
                fontFamily: kfontStyle4,
              ),
            ),
          ],
        ),
      ),

      body: ListView.builder(
        itemBuilder: (context, index) => Column(
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
                                'آهلا بك في الميزان يا',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: kfontStyle2,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                userName,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.045),

            CustomMizanMenuContainer(
              title: 'حساب تحويل العملات الي الدولار',
              imagePath: 'assets/dolar.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CurrencyExchangeScreans(),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.020),
            CustomMizanMenuContainer(
              title: 'عرض الاقساط ومواعيدها',
              imagePath: 'assets/aqsat.jpg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InstallmentsScreen()),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.020),
            CustomMizanMenuContainer(
              title: 'تنظيم المصروفات بالنسبة لدخلك الشهري',
              imagePath: 'assets/masrouf.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OraganizeExpenses(sallary: sallary),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.020),
            CustomMizanMenuContainer(
              title: 'البيانات الشخصية',
              imagePath: 'assets/data.jpg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PersonalInfoScreen()),
                );
              },
            ),
          ],
        ),
        itemCount: 1,
      ),
    );
  }
}
