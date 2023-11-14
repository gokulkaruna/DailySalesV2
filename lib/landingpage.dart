// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app_settings/app_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ensure_visible_when_focused/ensure_visible_when_focused.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:unfocus_widget/unfocus_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  //Text editing controllers
  final TextEditingController _shopNo = TextEditingController();
  final TextEditingController _date = TextEditingController();

  final TextEditingController _ml1000 = TextEditingController();
  final TextEditingController _ml750 = TextEditingController();
  final TextEditingController _ml375 = TextEditingController();
  final TextEditingController _ml180 = TextEditingController();
  final TextEditingController _ml650 = TextEditingController();
  final TextEditingController _ml500 = TextEditingController();

  final TextEditingController _imfsSalesValue = TextEditingController();
  final TextEditingController _beerSalesValue = TextEditingController();
  final TextEditingController _totalSalesValue = TextEditingController();

  final TextEditingController _cbLowCases = TextEditingController();
  final TextEditingController _cbMedCases = TextEditingController();
  final TextEditingController _cbPreCases = TextEditingController();
  final TextEditingController _cbBeerCases = TextEditingController();

  final TextEditingController _totalCbValue = TextEditingController();

  final TextEditingController _days90 = TextEditingController();

  final TextEditingController _salesLowBottles = TextEditingController();
  final TextEditingController _salesMedBottles = TextEditingController();
  final TextEditingController _salesPreBottles = TextEditingController();

  final TextEditingController _phoneNum1 = TextEditingController();

  //focusnodes
  final FocusNode ph1focus = FocusNode();
  final FocusNode ph2focus = FocusNode();
  final FocusNode ph3focus = FocusNode();

  final FocusNode focus1 = FocusNode();
  final FocusNode focus2 = FocusNode();
  final FocusNode focus3 = FocusNode();
  final FocusNode focus4 = FocusNode();
  final FocusNode focus5 = FocusNode();
  final FocusNode focus6 = FocusNode();
  final FocusNode focus7 = FocusNode();
  final FocusNode focus8 = FocusNode();
  final FocusNode focus9 = FocusNode();
  final FocusNode focus10 = FocusNode();
  final FocusNode focus11 = FocusNode();
  final FocusNode focus12 = FocusNode();
  final FocusNode focus13 = FocusNode();
  final FocusNode focus14 = FocusNode();
  final FocusNode focus15 = FocusNode();
  final FocusNode focus16 = FocusNode();
  final FocusNode focus17 = FocusNode();
  final FocusNode focus18 = FocusNode();
  final FocusNode focus19 = FocusNode();
  final FocusNode focus20 = FocusNode();

  final _formKey = GlobalKey<FormState>();

  double imfsval = 0;
  double beerval = 0;

  final phoneValidator = MultiValidator([
    PatternValidator(r'(^[6-9]\d{9}$)',
        errorText: 'Please enter a valid phone number')
  ]);


  void _validateform() {
    final form = _formKey.currentState;
    if (form != null) {
      if (form.validate()) {
        String star = '*';
        String sms =
            '${_shopNo.text}$star${_date.text}$star${_ml1000.text}$star${_ml750.text}$star${_ml375.text}$star${_ml180.text}$star${_ml650.text}$star${_ml500.text}$star${_imfsSalesValue.text}$star${_beerSalesValue.text}$star${_totalSalesValue.text}$star${_cbLowCases.text}$star${_cbMedCases.text}$star${_cbPreCases.text}$star${_cbBeerCases.text}$star${_totalCbValue.text}$star${_days90.text}$star${_salesLowBottles.text}$star${_salesMedBottles.text}$star${_salesPreBottles.text}';
        showAlertDialog(context, sms);
      }
    }
  }

//#############################################################################-

  void saveFormtoPrefs() async {
    //report
    List<String> formData = [
      _shopNo.text,
      _date.text,
      _ml1000.text,
      _ml750.text,
      _ml375.text,
      _ml180.text,
      _ml650.text,
      _ml500.text,
      _imfsSalesValue.text,
      _beerSalesValue.text,
      _totalSalesValue.text,
      _cbLowCases.text,
      _cbMedCases.text,
      _cbPreCases.text,
      _cbBeerCases.text,
      _totalCbValue.text,
      _days90.text,
      _salesLowBottles.text,
      _salesMedBottles.text,
      _salesPreBottles.text
    ];

    //phonenum

    List<String> phoneNums = [
      _phoneNum1.text,
    ];

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setStringList('formdata', formData);
    sharedPreferences.setStringList('phonedata', phoneNums);
  }

  void retrieveFormData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    List<String> formdata =
        (sharedPreferences.getStringList('formdata') ?? List.empty());
    List<String> phonedata =
        (sharedPreferences.getStringList('phonedata') ?? List.empty());

    if (formdata.isNotEmpty) {
      _shopNo.value = TextEditingValue(text: formdata[0]);
      _date.value = TextEditingValue(text: formdata[1]);
      _ml1000.value = TextEditingValue(text: formdata[2]);
      _ml750.value = TextEditingValue(text: formdata[3]);
      _ml375.value = TextEditingValue(text: formdata[4]);
      _ml180.value = TextEditingValue(text: formdata[5]);
      _ml650.value = TextEditingValue(text: formdata[6]);
      _ml500.value = TextEditingValue(text: formdata[7]);
      _imfsSalesValue.value = TextEditingValue(text: formdata[8]);
      _beerSalesValue.value = TextEditingValue(text: formdata[9]);
      _totalSalesValue.value = TextEditingValue(text: formdata[10]);
      _cbLowCases.value = TextEditingValue(text: formdata[11]);
      _cbMedCases.value = TextEditingValue(text: formdata[12]);
      _cbPreCases.value = TextEditingValue(text: formdata[13]);
      _cbBeerCases.value = TextEditingValue(text: formdata[14]);
      _totalCbValue.value = TextEditingValue(text: formdata[15]);
      _days90.value = TextEditingValue(text: formdata[16]);
      _salesLowBottles.value = TextEditingValue(text: formdata[17]);
      _salesMedBottles.value = TextEditingValue(text: formdata[18]);
      _salesPreBottles.value = TextEditingValue(text: formdata[19]);
    }

    if (phonedata.isNotEmpty) {
      _phoneNum1.value = TextEditingValue(text: phonedata[0]);
    }
  }

  // -------------------------------------

  Future<void> _sendSMS(String phoneNumber1, String msg) async {
      final Uri smsLaunchUri = Uri(
      scheme: 'sms',
      path: phoneNumber1,
      queryParameters: <String, String>{
        'body': msg,
      },
    );
    await launchUrl(smsLaunchUri);
  }

  //----------------------------------
  void requestPermission() async {
    PermissionStatus status = await Permission.sms.request();
    // var status = await Permission.sms.status;
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
      print("Permission is denined.");
    } else if (status.isGranted) {
      //permission is already granted.
      print("Permission is already granted.");
    } else if (status.isPermanentlyDenied) {
      if (status.isPermanentlyDenied) {
        await AppSettings.openAppSettings();
      } else {
        await Permission.storage.request();
      }
      //permission is permanently denied.
      print("Permission is permanently denied");
    } else if (status.isRestricted) {
      //permission is OS restricted.
      print("Permission is OS restricted.");
    }
  }

  @override
  void initState() {
    requestPermission();
    retrieveFormData();
    super.initState();
  }
  //###########################################################################-

  //alert dialog
  showAlertDialog(BuildContext context, String sms) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text(
        "Cancel",
        style: TextStyle(color: Colors.red),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    Widget continueButton = TextButton(
      child: const Text("Send SMS"),
      onPressed: () {
        _sendSMS(_phoneNum1.text,sms);
        Navigator.of(context).pop();
        saveFormtoPrefs();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Confirm SMS to Send."),
      content: Text(sms, softWrap: true),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  //set total value from IMFS and BEER Value
  void setTotalIMFSVal() {
    String totStr = (imfsval + beerval).toString();
    _totalSalesValue.text = totStr.substring(0, totStr.length - 2);
  }

  //phone number input
  Widget _phoneNumInput() {
    return Card(
      elevation: 5,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enter Phone number',
                style: TextStyle(
                  fontSize: 18,
                )),
            EnsureVisibleWhenFocused(
              focusNode: ph1focus,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    focusNode: ph1focus,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        //  ph1focus.requestFocus();
                        return 'Please enter atleast one phone number to send';
                      } else if (!value
                          .contains(RegExp(r'(^[6-9]\d{9}$)'))) {
                        // ph1focus.requestFocus();
                        return 'Invalid Phone number';
                      }
                      return null;
                    },
                    // readOnly:_phoneNum1Editable,
                    controller: _phoneNum1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Enter your Phone Number*',
                        border: const OutlineInputBorder(),
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _phoneNum1.clear();
                              });
                            },
                            icon: const Icon(Icons.close))),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  //Shop details widget
  Widget shopDetails() {
    return Card(
      elevation: 5,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Shop Details",
            style: TextStyle(fontSize: 18),
          ),
          Column(children: [
            EnsureVisibleWhenFocused(
              focusNode: focus1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      focus1.requestFocus();
                      return 'Please enter some number';
                    } else if (!value.contains(RegExp(r'(\d+)'))) {
                      focus1.requestFocus();
      
                      return 'Please enter only numbers';
                    }
                    return null;
                  },
                  focusNode: focus1,
                  controller: _shopNo,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Shop No.',
                    border: const OutlineInputBorder(),
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _shopNo.clear();
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
            ),
            EnsureVisibleWhenFocused(
              focusNode: focus2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      focus2.requestFocus();
                      return 'Please enter some number';
                    } else if (!value.contains(RegExp(r'(\d+)'))) {
                      focus2.requestFocus();
      
                      return 'Please enter only numbers';
                    } else if (value.length > 2) {
                      focus2.requestFocus();
      
                      return 'Date cannot have more then two digits';
                    }
                    return null;
                  },
                  focusNode: focus2,
                  controller: _date,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    border: const OutlineInputBorder(),
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _date.clear();
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }

  //Sales Bottle ML wise widget
  Widget salesBottlesML() {
    return Card(
      elevation: 5,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Sales Bottles",
            style: TextStyle(fontSize: 18),
          ),
          Column(children: [
            //1000 ML
            EnsureVisibleWhenFocused(
              focusNode: focus3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      focus3.requestFocus();
                      return 'Please enter some number';
                    } else if (!value.contains(RegExp(r'(\d+)'))) {
                      focus3.requestFocus();
      
                      return 'Please enter only numbers';
                    }
                    return null;
                  },
                  focusNode: focus3,
                  controller: _ml1000,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: '1000 ML',
                    border: const OutlineInputBorder(),
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _ml1000.clear();
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
            ),
      
            //750 ML
            EnsureVisibleWhenFocused(
              focusNode: focus4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      focus4.requestFocus();
                      return 'Please enter some number';
                    } else if (!value.contains(RegExp(r'(\d+)'))) {
                      focus4.requestFocus();
      
                      return 'Please enter only numbers';
                    }
                    return null;
                  },
                  focusNode: focus4,
                  controller: _ml750,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: '750 ML',
                    border: const OutlineInputBorder(),
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _ml750.clear();
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
            ),
      
            //375 ML
            EnsureVisibleWhenFocused(
              focusNode: focus5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      focus5.requestFocus();
                      return 'Please enter some number';
                    } else if (!value.contains(RegExp(r'(\d+)'))) {
                      focus5.requestFocus();
      
                      return 'Please enter only numbers';
                    }
                    return null;
                  },
                  focusNode: focus5,
                  controller: _ml375,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: '375 ML',
                    border: const OutlineInputBorder(),
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _ml375.clear();
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
            ),
      
            //180 ML
            EnsureVisibleWhenFocused(
              focusNode: focus6,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      focus6.requestFocus();
                      return 'Please enter some number';
                    } else if (!value.contains(RegExp(r'(\d+)'))) {
                      focus6.requestFocus();
      
                      return 'Please enter only numbers';
                    }
                    return null;
                  },
                  focusNode: focus6,
                  controller: _ml180,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: '180 ML',
                    border: const OutlineInputBorder(),
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _ml180.clear();
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
            ),
      
            //650 ML
            EnsureVisibleWhenFocused(
              focusNode: focus7,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      focus7.requestFocus();
                      return 'Please enter some number';
                    } else if (!value.contains(RegExp(r'(\d+)'))) {
                      focus7.requestFocus();
      
                      return 'Please enter only numbers';
                    }
                    return null;
                  },
                  focusNode: focus7,
                  controller: _ml650,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: '650 ML',
                    border: const OutlineInputBorder(),
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _ml650.clear();
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
            ),
      
            //500/325 ML
            EnsureVisibleWhenFocused(
              focusNode: focus8,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      focus8.requestFocus();
                      return 'Please enter some number';
                    } else if (!value.contains(RegExp(r'(\d+)'))) {
                      focus8.requestFocus();
      
                      return 'Please enter only numbers';
                    }
                    return null;
                  },
                  focusNode: focus8,
                  controller: _ml500,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: '500/325 ML',
                    border: const OutlineInputBorder(),
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _ml500.clear();
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }

  //Sales Value Widget
  Widget salesValue() {
    return Card(
      elevation: 5,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Sales Value",
            style: TextStyle(fontSize: 18),
          ),
          Column(children: [
            EnsureVisibleWhenFocused(
              focusNode: focus9,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextFormField(
                  onChanged: (value) {
                    imfsval = double.parse(value);
      
                    setState(() {
                      setTotalIMFSVal();
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      focus9.requestFocus();
                      return 'Please enter some number';
                    } else if (!value.contains(RegExp(r'(\d+)'))) {
                      focus9.requestFocus();
      
                      return 'Please enter only numbers';
                    }
                    return null;
                  },
                  focusNode: focus9,
                  controller: _imfsSalesValue,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'IMFS Sales Value',
                    border: const OutlineInputBorder(),
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _imfsSalesValue.clear();
                          setTotalIMFSVal();
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
            ),
            EnsureVisibleWhenFocused(
              focusNode: focus10,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextFormField(
                  onChanged: (value) {
                    beerval = double.parse(value);
                    setState(() {
                      setTotalIMFSVal();
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      focus10.requestFocus();
                      return 'Please enter some number';
                    } else if (!value.contains(RegExp(r'(\d+)'))) {
                      focus10.requestFocus();
      
                      return 'Please enter only numbers';
                    }
                    return null;
                  },
                  focusNode: focus10,
                  controller: _beerSalesValue,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'BEER Sales Value',
                    border: const OutlineInputBorder(),
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _beerSalesValue.clear();
                          setTotalIMFSVal();
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
            ),
            EnsureVisibleWhenFocused(
              focusNode: focus11,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextFormField(
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      focus11.requestFocus();
                      return 'Please enter some number';
                    } else if (!value.contains(RegExp(r'(\d+)'))) {
                      focus11.requestFocus();
      
                      return 'Please enter only numbers';
                    }
                    return null;
                  },
                  focusNode: focus11,
                  controller: _totalSalesValue,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'TOTAL Sales Value',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }

  //CB Cases Widget
  Widget cbCases() {
    return Card(
      elevation: 5,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "CB Cases",
            style: TextStyle(fontSize: 18),
          ),
          Column(children: [
            EnsureVisibleWhenFocused(
              focusNode: focus12,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      focus12.requestFocus();
                      return 'Please enter some number';
                    } else if (!value.contains(RegExp(r'(\d+)'))) {
                      focus12.requestFocus();
      
                      return 'Please enter only numbers';
                    }
                    return null;
                  },
                  focusNode: focus12,
                  controller: _cbLowCases,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Low Range - CB Cases',
                    border: const OutlineInputBorder(),
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _cbLowCases.clear();
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
            ),
            EnsureVisibleWhenFocused(
              focusNode: focus13,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      focus13.requestFocus();
                      return 'Please enter some number';
                    } else if (!value.contains(RegExp(r'(\d+)'))) {
                      focus13.requestFocus();
      
                      return 'Please enter only numbers';
                    }
                    return null;
                  },
                  focusNode: focus13,
                  controller: _cbMedCases,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Medium Range - CB Cases',
                    border: const OutlineInputBorder(),
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _cbMedCases.clear();
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
            ),
            EnsureVisibleWhenFocused(
              focusNode: focus14,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      focus14.requestFocus();
                      return 'Please enter some number';
                    } else if (!value.contains(RegExp(r'(\d+)'))) {
                      focus14.requestFocus();
      
                      return 'Please enter only numbers';
                    }
                    return null;
                  },
                  focusNode: focus14,
                  controller: _cbPreCases,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Premium Range - CB Cases',
                    border: const OutlineInputBorder(),
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _cbPreCases.clear();
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
            ),
            EnsureVisibleWhenFocused(
              focusNode: focus15,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      focus15.requestFocus();
                      return 'Please enter some number';
                    } else if (!value.contains(RegExp(r'(\d+)'))) {
                      focus15.requestFocus();
      
                      return 'Please enter only numbers';
                    }
                    return null;
                  },
                  focusNode: focus15,
                  controller: _cbBeerCases,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Beer - CB Cases',
                    border: const OutlineInputBorder(),
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _cbBeerCases.clear();
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }

  //Total CB Value Widget
  Widget totalCbValue() {
    return Card(
      elevation: 5,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Total CB Value",
            style: TextStyle(fontSize: 18),
          ),
          Column(children: [
            EnsureVisibleWhenFocused(
              focusNode: focus16,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      focus16.requestFocus();
                      return 'Please enter some number';
                    } else if (!value.contains(RegExp(r'(\d+)'))) {
                      focus16.requestFocus();
      
                      return 'Please enter only numbers';
                    }
                    return null;
                  },
                  focusNode: focus16,
                  controller: _totalCbValue,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Total CB Value',
                    border: const OutlineInputBorder(),
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _totalCbValue.clear();
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }

  //90 days Widget
  Widget days90() {
    return Card(
      elevation: 5,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "90 Days",
            style: TextStyle(fontSize: 18),
          ),
          Column(children: [
            EnsureVisibleWhenFocused(
              focusNode: focus17,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      focus17.requestFocus();
                      return 'Please enter some number';
                    } else if (!value.contains(RegExp(r'(\d+)'))) {
                      focus17.requestFocus();
      
                      return 'Please enter only numbers';
                    }
                    return null;
                  },
                  focusNode: focus17,
                  controller: _days90,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: '90 days',
                    border: const OutlineInputBorder(),
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _days90.clear();
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }

  //Sales Bottles Range wise Widget
  Widget salesBottleRange() {
    return Card(
      elevation: 5,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Sales Bottles",
            style: TextStyle(fontSize: 18),
          ),
          Column(children: [
            EnsureVisibleWhenFocused(
              focusNode: focus18,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      focus18.requestFocus();
                      return 'Please enter some number';
                    } else if (!value.contains(RegExp(r'(\d+)'))) {
                      focus18.requestFocus();
      
                      return 'Please enter only numbers';
                    }
                    return null;
                  },
                  focusNode: focus18,
                  controller: _salesLowBottles,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Low Range - Sales Bottles',
                    border: const OutlineInputBorder(),
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _salesLowBottles.clear();
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
            ),
            EnsureVisibleWhenFocused(
              focusNode: focus19,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      focus19.requestFocus();
                      return 'Please enter some number';
                    } else if (!value.contains(RegExp(r'(\d+)'))) {
                      focus19.requestFocus();
      
                      return 'Please enter only numbers';
                    }
                    return null;
                  },
                  focusNode: focus19,
                  controller: _salesMedBottles,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Medium Range - Sales Bottles',
                    border: const OutlineInputBorder(),
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _salesMedBottles.clear();
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
            ),
            EnsureVisibleWhenFocused(
              focusNode: focus20,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      focus20.requestFocus();
                      return 'Please enter some number';
                    } else if (!value.contains(RegExp(r'(\d+)'))) {
                      focus20.requestFocus();
      
                      return 'Please enter only numbers';
                    }
                    return null;
                  },
                  focusNode: focus20,
                  controller: _salesPreBottles,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Premium Range - Sales Bottles',
                    border: const OutlineInputBorder(),
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _salesPreBottles.clear();
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }

  //generate button
  Widget _genBtn() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              surfaceTintColor: Colors.white,
              padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
              elevation: 5,
            ),
            onPressed: (() {
              _validateform();
            }),
            child: const Text('Generate SMS',style: TextStyle(color: Colors.green),)));
  }



  @override
  Widget build(BuildContext context) {
    return UnFocusWidget(
      child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Daily Sales Report',
                style: TextStyle(color: Colors.white,),
              )),
          // backgroundColor: Colors.amber.shade50,
          body: SafeArea(
              child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 40),
                  child: Form(
                      key: _formKey,
                      child: Column(children: [
                        _phoneNumInput(),
                        shopDetails(),
                        salesBottlesML(),
                        salesValue(),
                        cbCases(),
                        totalCbValue(),
                        days90(),
                        salesBottleRange(),
                        _genBtn()
                      ]))))),
    );
  }
}
