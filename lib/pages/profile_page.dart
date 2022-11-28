import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

enum Gender { male, female }

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController dateinput = TextEditingController();

  Gender? _gender = Gender.male;

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  final _formKey = GlobalKey<FormState>(); // global form key

  // controler for formfield
  final conName = TextEditingController();
  final conEmail = TextEditingController();
  final conWeight = TextEditingController();
  final conHeight = TextEditingController();
  final conDob = TextEditingController();
  final conPob = TextEditingController();
  final conGender = TextEditingController();

  String? unama = '';
  String? uemail = '';
  String? uweight = '';
  String? uheight = '';
  String? udob;
  String? upob = '';
  String? ugender;

  // Crud Function
  Future<void> addUser(String nama, String email, String weight, String height,
      String pob, String dob, String gender) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }

    unama = nama;
    uemail = email;
    uweight = weight;
    uheight = height;
    udob = dob;
    upob = pob;
    ugender = gender;
  }

  Future<void> editUser(String nama, String email, String weight, String height,
      String pob, String dob, String gender) async {
    conName.text = nama;
    conEmail.text = email;
    conWeight.text = weight;
    conHeight.text = height;
    conDob.text = dob;
    conPob.text = pob;
    conGender.text = gender;
  }

  clearPage() {
    conName.text = '';
    conEmail.text = '';
    conWeight.text = '';
    conHeight.text = '';
    conDob.text = '';
    conPob.text = '';
    conGender.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title: const Text('Profile Page'),
        actions: [
          // IconButton(onPressed: () {}, icon: const Icon(Icons.edit_note)),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        scrollable: true,
                        title: const Text('Add Data'),
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: conName,
                                  decoration: const InputDecoration(
                                    labelText: 'Nama',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                  },
                                ),
                                TextFormField(
                                  controller: conEmail,
                                  decoration: const InputDecoration(
                                    labelText: 'Email',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                  },
                                ),
                                TextFormField(
                                  controller: conWeight,
                                  decoration: const InputDecoration(
                                    labelText: 'weight',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your weight';
                                    }
                                  },
                                ),
                                TextFormField(
                                  controller: conHeight,
                                  decoration: const InputDecoration(
                                    labelText: 'height',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your height';
                                    }
                                  },
                                ),
                                TextFormField(
                                  controller:
                                      dateinput, //editing controller of this TextField
                                  decoration: const InputDecoration(
                                      labelText:
                                          "Date of Birthday" //label text of field
                                      ),
                                  readOnly:
                                      true, //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(
                                            2000), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101));

                                    if (pickedDate != null) {
                                      //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      //formatted date output using intl package =>  2021-03-16
                                      //you can implement different kind of Date Format here according to your requirement

                                      setState(() {
                                        dateinput.text =
                                            formattedDate; //set output date to TextField value.
                                      });
                                    } else {}
                                  },
                                ),
                                TextFormField(
                                  controller: conPob,
                                  decoration: const InputDecoration(
                                    labelText: 'Place of Birthday',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your birthday';
                                    }
                                  },
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      title: const Text('Male'),
                                      leading: Radio<Gender>(
                                        value: Gender.male,
                                        groupValue: _gender,
                                        onChanged: (Gender? value) {
                                          setState(() {
                                            _gender = value;
                                          });
                                        },
                                      ),
                                    ),
                                    ListTile(
                                      title: const Text('Female'),
                                      leading: Radio<Gender>(
                                        value: Gender.female,
                                        groupValue: _gender,
                                        onChanged: (Gender? value) {
                                          setState(() {
                                            _gender = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          TextButton(
                              child: const Text("Submit"),
                              onPressed: () {
                                setState(() {
                                  addUser(
                                      conName.text,
                                      conEmail.text,
                                      conWeight.text,
                                      conHeight.text,
                                      conPob.text,
                                      conDob.text,
                                      conGender.text);
                                });
                                Navigator.pop(context);
                              }),
                          TextButton(
                              onPressed: () {
                                clearPage();
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel"))
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50),
            alignment: Alignment.center,
            child: Column(
              children: [
                // ignore: prefer_const_constructors
                Image(
                  // ignore: prefer_const_constructors
                  image: AssetImage(
                      'assets/images/blank-profile-picture-gfd0b36f52_1280.png'),
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("$unama"),
                const SizedBox(
                  height: 5,
                ),
                Text("$uemail")
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.80,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [const Text("Weight"), Text("$uweight")],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [const Text('Height'), Text("$uheight")],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Date of Birthday'),
                    Text("${dateinput.text}")
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [const Text('Place of Birthday'), Text("$upob")],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [const Text('Gender'), Text("${_gender?.name}")],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
