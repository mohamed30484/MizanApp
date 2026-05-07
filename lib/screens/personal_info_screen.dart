import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mizan_app/core/constants/mizan_app_constants.dart';
import 'package:mizan_app/core/database/cache_helper.dart';
import 'package:mizan_app/screens/splash.dart';
import 'package:mizan_app/widgets/custom%20_installments_alertdailog.dart';
import 'package:mizan_app/widgets/custom_textformfield.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  String? username;
  String? email;
  double? sallary;
  double? bankAccount;
  String? countries;

  @override
  void initState() {
    super.initState();
    username = CacheHelper.loudname();
    email = CacheHelper.loudemail();
    sallary = CacheHelper.loudsallary();
    bankAccount = CacheHelper.loudbankBalance();
    countries = CacheHelper.loudcountry();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController sallaryController = TextEditingController();
  TextEditingController bankBalanceController = TextEditingController();
  bool isvisible = true;
  bool isvisible2 = true;
  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        leadingWidth: MediaQuery.of(context).size.width * 0.40,
        backgroundColor: kPrimaryColor,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: kPrimaryColor3,
              fixedSize: Size(
                MediaQuery.of(context).size.width * 0.30,
                MediaQuery.of(context).size.height * 0.09,
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: kPrimaryColor3,
                    title: Text(
                      'تأكيد',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.07,
                      ),
                    ),
                    content: Text(
                      'هل تريد الخروج من التطبيق؟',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'لا',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: Text(
                          'نعم',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Text(
              'تسجيل الخروج',
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
          ),
        ),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 60),
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

      body: Stack(
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.67,
              decoration: BoxDecoration(
                color: kPrimaryColor2,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    username!,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontFamily: kfontStyle2,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  Text(
                    email!,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontFamily: kfontStyle2,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.28,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      color: kPrimaryColor3,
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: Center(
                      child: Text(
                        countries!,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w900,
                          color: Colors.black87,
                          fontFamily: kfontStyle2,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: MediaQuery.of(context).size.width * 0.15,
                        child: CircleAvatar(
                          backgroundColor: kPrimaryColor2,
                          radius: MediaQuery.of(context).size.width * 0.14,
                          child: Text(
                            sallary.toString(),
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontFamily: kfontStyle2,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: MediaQuery.of(context).size.width * 0.15,
                        child: CircleAvatar(
                          backgroundColor: kPrimaryColor2,
                          radius: MediaQuery.of(context).size.width * 0.14,
                          child: Text(
                            bankAccount.toString(),
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontFamily: kfontStyle2,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'الراتب الشهري',
                        style: TextStyle(
                          fontFamily: kfontStyle2,
                          fontSize: MediaQuery.of(context).size.width * 0.047,
                          fontWeight: FontWeight.w900,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'الحساب البنكي',
                        style: TextStyle(
                          fontFamily: kfontStyle2,
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontWeight: FontWeight.w900,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(
                        MediaQuery.of(context).size.height * 0.10,
                        MediaQuery.of(context).size.width * 0.10,
                      ),
                    ),
                    onPressed: () {
                      nameController.text = CacheHelper.loudname();
                      emailController.text = CacheHelper.loudemail();
                      sallaryController.text = CacheHelper.loudsallary()
                          .toString();
                      bankBalanceController.text = CacheHelper.loudbankBalance()
                          .toString();
                      countries;
                      username = nameController.text;
                      email = emailController.text;
                      sallary = double.tryParse(sallaryController.text);
                      bankAccount = double.parse(bankBalanceController.text);

                      showDialog(
                        context: context,
                        builder: (context) {
                          bool dialogVisible1 = isvisible;
                          bool dialogVisible2 = isvisible2;

                          selectedCountry ??= countries;

                          return StatefulBuilder(
                            builder: (context, setDialogState) {
                              return SingleChildScrollView(
                                child: AlertDialog(
                                  backgroundColor: kPrimaryColor,

                                  title: Text(
                                    'تعديل البيانات الشخصية',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    textDirection: TextDirection.rtl,
                                  ),

                                  actions: [
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: CustomTextFormField(
                                        controller: nameController,
                                        keyboardType: TextInputType.name,
                                        labelText: 'الاسم',
                                      ),
                                    ),

                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                          0.03,
                                    ),

                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: CustomTextFormField(
                                        controller: emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        labelText: 'الايميل',
                                      ),
                                    ),

                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                          0.03,
                                    ),

                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: CustomTextFormField(
                                        controller: sallaryController,
                                        keyboardType: TextInputType.number,
                                        labelText: 'الراتب الشهري',
                                        color: dialogVisible1
                                            ? kPrimaryColor4
                                            : Colors.blue,
                                        suffixIcon: Icons.visibility,
                                        obscureText: dialogVisible1,
                                        onPressed: () {
                                          setDialogState(() {
                                            dialogVisible1 = !dialogVisible1;
                                          });
                                        },
                                      ),
                                    ),

                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                          0.03,
                                    ),

                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: CustomTextFormField(
                                        controller: bankBalanceController,
                                        keyboardType: TextInputType.number,
                                        labelText: 'الرصيد البنكي',
                                        color: dialogVisible2
                                            ? kPrimaryColor4
                                            : Colors.blue,
                                        suffixIcon: Icons.visibility,
                                        obscureText: dialogVisible2,
                                        onPressed: () {
                                          setDialogState(() {
                                            dialogVisible2 = !dialogVisible2;
                                          });
                                        },
                                      ),
                                    ),

                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                          0.03,
                                    ),

                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                          0.055,
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.96,
                                      child: Container(
                                        padding: EdgeInsetsDirectional.only(
                                          start: 10,
                                          end: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),

                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          underline: SizedBox(),
                                          dropdownColor: kPrimaryColor2,
                                          iconEnabledColor: kPrimaryColor5,
                                          iconSize:
                                              MediaQuery.of(
                                                context,
                                              ).size.width *
                                              0.08,
                                          menuWidth:
                                              MediaQuery.of(
                                                context,
                                              ).size.width *
                                              0.30,

                                          value: selectedCountry,

                                          selectedItemBuilder: (context) {
                                            return country.map((country) {
                                              return Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: "أختر بلدك ",
                                                        style: TextStyle(
                                                          fontSize:
                                                              MediaQuery.of(
                                                                context,
                                                              ).size.width *
                                                              0.03,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              kfontStyle3,
                                                        ),
                                                      ),
                                                      WidgetSpan(
                                                        child: SizedBox(
                                                          width:
                                                              MediaQuery.of(
                                                                context,
                                                              ).size.width *
                                                              0.10,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: " $country",
                                                        style: TextStyle(
                                                          fontSize:
                                                              MediaQuery.of(
                                                                context,
                                                              ).size.width *
                                                              0.03,
                                                          color: Colors.black,

                                                          fontFamily:
                                                              kfontStyle3,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }).toList();
                                          },

                                          hint: Text(
                                            "أختر بلدك",
                                            style: TextStyle(
                                              fontSize:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.width *
                                                  0.03,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: kfontStyle3,
                                            ),
                                          ),

                                          items: country.map((country) {
                                            return DropdownMenuItem(
                                              value: country,
                                              child: Align(
                                                alignment: Alignment.topRight,
                                                child: Text(
                                                  country,
                                                  style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(
                                                          context,
                                                        ).size.width *
                                                        0.03,
                                                    color: Colors.black,
                                                    fontFamily: kfontStyle3,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }).toList(),

                                          onChanged: (value) {
                                            setDialogState(() {
                                              selectedCountry = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: kPrimaryColor3,
                                            foregroundColor: Colors.white,
                                            shape: BeveledRectangleBorder(
                                              borderRadius:
                                                  BorderRadiusGeometry.circular(
                                                    4,
                                                  ),
                                            ),
                                          ),

                                          onPressed: () async {
                                            await CacheHelper.save(
                                              nameController.text,
                                              emailController.text,
                                              double.tryParse(
                                                sallaryController.text,
                                              ),
                                              double.tryParse(
                                                bankBalanceController.text,
                                              ),
                                              selectedCountry,
                                            );

                                            setState(() {
                                              username = nameController.text;
                                              email = emailController.text;
                                              sallary = double.tryParse(
                                                sallaryController.text,
                                              );
                                              bankAccount = double.tryParse(
                                                bankBalanceController.text,
                                              );
                                              countries = selectedCountry;
                                            });

                                            Navigator.pop(context);
                                          },

                                          child: Text(
                                            "حفظ",
                                            style: TextStyle(
                                              fontSize:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.width *
                                                  .04,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),

                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            foregroundColor: Colors.black,
                                            shape: BeveledRectangleBorder(
                                              borderRadius:
                                                  BorderRadiusGeometry.circular(
                                                    4,
                                                  ),
                                            ),
                                          ),

                                          onPressed: () {
                                            Navigator.pop(context);
                                          },

                                          child: Text(
                                            'الغاء',
                                            style: TextStyle(
                                              fontSize:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.width *
                                                  .04,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Text(
                      'تعديل',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.07,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontFamily: kfontStyle3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: kPrimaryColor2,
                  radius: MediaQuery.of(context).size.width * 0.20,
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/slogan.gif'),
                  radius: MediaQuery.of(context).size.height * 0.09,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
