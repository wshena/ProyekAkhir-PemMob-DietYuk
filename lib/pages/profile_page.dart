import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:uas_mob/data/hive/hive_boxes.dart';
import 'package:uas_mob/data/models/user_model.dart';

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

  final _formKey = GlobalKey<FormState>();
  final conName = TextEditingController();
  final conEmail = TextEditingController();
  final conWeight = TextEditingController();
  final conHeight = TextEditingController();
  final conDob = TextEditingController();
  final conPob = TextEditingController();
  final conGender = TextEditingController();

  @override
  void dispose() {
    Hive.close(); // Closing All Boxes

    //Hive.box('users').close();// Closing Selected Box

    super.dispose();
  }

  // Crud Function
  Future<void> addUser(String nama, String email, String weight, String height,
      String pob, String dob, String gender) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }

    final user = UserModel(
        nama: nama,
        email: email,
        weight: weight,
        hieght: height,
        dob: dob,
        pob: pob,
        gender: gender);
    final box = Boxes.getUser();
    box.add(user).then((value) => clearPage());
  }

  Future<void> editUser(UserModel userModel) async {
    conName.text = userModel.nama!;
    conEmail.text = userModel.email!;
    conWeight.text = userModel.weight;
    conHeight.text = userModel.hieght;
    conDob.text = userModel.dob;
    conPob.text = userModel.pob;
    conGender.text = userModel.gender;

    deleteUser(userModel);

    // if you want to do with key you can use that too.

    //box.put("myKey", user);
    //final myBox = Boxes.getUsers();
    //final myUser = myBox.get("myKey");
    //myBox.values; // Access All Values
    //myBox.keys; // Access By Key
  }

  Future<void> deleteUser(UserModel userModel) async {
    userModel.delete();
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
                                    return null;
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
                                    return null;
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
                                    return null;
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
                                    return null;
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
                                      print(
                                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      print(
                                          formattedDate); //formatted date output using intl package =>  2021-03-16
                                      //you can implement different kind of Date Format here according to your requirement

                                      setState(() {
                                        dateinput.text =
                                            formattedDate; //set output date to TextField value.
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
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
                                    return null;
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
                                // your code
                              }),
                          TextButton(
                              onPressed: () {}, child: const Text("Cancel"))
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
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.purple[100],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Nama Orang'),
                const SizedBox(
                  height: 5,
                ),
                const Text('EmailnyaOrang@gmail.com')
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
                  children: [const Text('Weight'), const Text('75 kg')],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [const Text('Height'), const Text('185 cm')],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Date of Birthday'),
                    const Text('23-1-1982')
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Place of Birthday'),
                    const Text('Pnumbra')
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [const Text('Gender'), const Text('NonBinary')],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
