import 'package:flutter/material.dart';

import 'package:mizan_app/core/constants/mizan_app_constants.dart';
import 'package:mizan_app/core/database/cache_helper.dart';
import 'package:mizan_app/screens/mizan_menu.dart';
import 'package:mizan_app/widgets/custom_textformfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController sallaryController = TextEditingController();
  TextEditingController bankBalanceController = TextEditingController();
  bool isvisible = true;
  bool isvisible2 = true;
  String? choosecountry;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'ميزان',
          style: TextStyle(
            color: Colors.black,
            fontSize: MediaQuery.of(context).size.width * 0.10,
            fontWeight: FontWeight.bold,
            fontFamily: kfontStyle4,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.28,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login.gif'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.035),
          Expanded(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.96,
                height: MediaQuery.of(context).size.height * 0.1,
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          labelText: 'الاسم',
                          controller: nameController,
                          suffixIcon: null,
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        CustomTextFormField(
                          labelText: 'الايميل',
                          controller: emailController,
                          suffixIcon: null,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        CustomTextFormField(
                          obscureText: isvisible,
                          labelText: 'الراتب الشهري',
                          controller: sallaryController,
                          suffixIcon: Icons.visibility,

                          keyboardType: TextInputType.number,
                          onPressed: () {
                            setState(() {
                              isvisible = !isvisible;
                            });
                          },
                          color: isvisible ? kPrimaryColor4 : Colors.blue,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        CustomTextFormField(
                          obscureText: isvisible2,
                          labelText: 'الرصيد البنكي',
                          controller: bankBalanceController,
                          suffixIcon: Icons.visibility,

                          keyboardType: TextInputType.number,
                          onPressed: () {
                            setState(() {
                              isvisible2 = !isvisible2;
                            });
                          },
                          color: isvisible2 ? kPrimaryColor4 : Colors.blue,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.055,
                          width: MediaQuery.of(context).size.width * 0.96,
                          child: Container(
                            padding: EdgeInsetsDirectional.only(
                              start: 10,
                              end: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              underline: SizedBox(),
                              dropdownColor: kPrimaryColor2,
                              iconEnabledColor: kPrimaryColor5,
                              iconSize:
                                  MediaQuery.of(context).size.width * 0.10,
                              menuWidth:
                                  MediaQuery.of(context).size.width * 0.30,
                              value: choosecountry,

                              selectedItemBuilder: (context) {
                                return country.map((country) {
                                  return Align(
                                    alignment: Alignment.centerRight,
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
                                                  0.05,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: kfontStyle3,
                                            ),
                                          ),
                                          WidgetSpan(
                                            child: SizedBox(
                                              width:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.width *
                                                  0.40,
                                            ),
                                          ),
                                          TextSpan(
                                            text: " $country",
                                            style: TextStyle(
                                              fontSize:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.width *
                                                  0.04,
                                              color: Colors.black,

                                              fontFamily: kfontStyle3,
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
                                      MediaQuery.of(context).size.width * 0.05,
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
                                            MediaQuery.of(context).size.width *
                                            0.03,
                                        color: Colors.black,

                                        fontFamily: kfontStyle3,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),

                              onChanged: (value) {
                                setState(() {
                                  choosecountry = value;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(
                              MediaQuery.of(context).size.width * 0.35,
                              MediaQuery.of(context).size.height * 0.07,
                            ),
                            backgroundColor: kPrimaryColor3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),

                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              if (choosecountry == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: kPrimaryColor2,
                                    content: Text(
                                      "من فضلك اختر البلد",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                            .06,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                );
                                return;
                              }
                              await CacheHelper.save(
                                nameController.text,
                                emailController.text,
                                double.tryParse(sallaryController.text),
                                double.tryParse(bankBalanceController.text),
                                choosecountry,
                              );

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MizanMenu(
                                    userName: nameController.text,
                                    sallary: sallaryController.text,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Text(
                            'تسجيل',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: kfontStyle3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
