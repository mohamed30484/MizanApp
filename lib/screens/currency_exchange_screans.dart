import 'package:flutter/material.dart';
import 'package:mizan_app/core/constants/mizan_app_constants.dart';

class CurrencyExchangeScreans extends StatefulWidget {
  const CurrencyExchangeScreans({super.key});

  @override
  State<CurrencyExchangeScreans> createState() =>
      _CurrencyExchangeScreansState();
}

class _CurrencyExchangeScreansState extends State<CurrencyExchangeScreans> {
  String? selectedCurrency = currency.first;
  final TextEditingController? amountController = TextEditingController();
  final double amount = 0.0;
  double result = 0.0;
  GlobalKey<FormState> amountKey = GlobalKey<FormState>();

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
                                'في هذه الغرفة يمكنك تحويل العملات الي قيمتها الدولارية',
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.055,
              width: MediaQuery.of(context).size.width * 0.96,
              child: Container(
                padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  underline: const SizedBox(),
                  dropdownColor: kPrimaryColor2,
                  iconEnabledColor: kPrimaryColor5,
                  icon: const SizedBox(),
                  menuWidth: MediaQuery.of(context).size.width * 0.45,

                  value: selectedCurrency,

                  selectedItemBuilder: (context) {
                    return currency.map((currency) {
                      return Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Expanded(
                            child: Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                Flexible(
                                  child: Text(
                                    "أختر العملة المراد تحويلها",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                          0.040,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: kfontStyle3,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  flex: 0,
                                  child: Text(
                                    currency,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                          0.04,
                                      color: Colors.black,
                                      fontFamily: kfontStyle3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: kPrimaryColor5,
                            size: MediaQuery.of(context).size.width * 0.08,
                          ),
                        ],
                      );
                    }).toList();
                  },

                  hint: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "أختر العملة المراد تحويلها",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: kfontStyle3,
                      ),
                    ),
                  ),

                  items: currency.map((currency) {
                    return DropdownMenuItem<String>(
                      value: currency,

                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          currency,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.038,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontFamily: kfontStyle3,
                          ),
                        ),
                      ),
                    );
                  }).toList(),

                  onChanged: (value) {
                    setState(() {
                      selectedCurrency = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            SizedBox(
              width: MediaQuery.of(context).size.width * .60,
              height: MediaQuery.of(context).size.width * .2,
              child: Form(
                key: amountKey,
                child: TextFormField(
                  controller: amountController,
                  textDirection: TextDirection.rtl,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: 'أدخل المبلغ',
                    hintTextDirection: TextDirection.rtl,
                    hintStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: kPrimaryColor5),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor3,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(5),
                ),
                minimumSize: Size(
                  MediaQuery.of(context).size.width * .45,
                  MediaQuery.of(context).size.width * .17,
                ),
              ),
              onPressed: () {
                if (amountKey.currentState!.validate()) {
                  if (selectedCurrency != null &&
                      amountController!.text.isNotEmpty) {
                    final input = amountController!.text;

                    if (double.tryParse(input) == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: kPrimaryColor2,
                          content: Text(
                            "من فضلك ادخل رقم",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      );
                      return;
                    }

                    final amount = double.parse(input);

                    final rate = exchangeRate[selectedCurrency!] ?? 1;

                    setState(() {
                      result = amount / rate;
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: kPrimaryColor2,
                        content: Text(
                          textDirection: TextDirection.rtl,
                          "من فضلك ادخل رقم",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width * .05,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    );
                  }
                }
              },
              child: Text(
                'تحويل',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: MediaQuery.of(context).size.width * 0.08,
                  fontWeight: FontWeight.w500,
                  fontFamily: kfontStyle3,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            // ignore: sized_box_for_whitespace
            Container(
              padding: EdgeInsets.only(left: 15, top: 15),
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                border: Border.all(width: 1.5),
                color: kPrimaryColor2,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  ' ${selectedCurrency ?? ''} ${amountController!.text} = ${result.toStringAsFixed(2)} USD',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ],
        ),
        itemCount: 1,
      ),
    );
  }
}
