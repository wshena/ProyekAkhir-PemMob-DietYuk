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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_rounded)),
        title: const Text('Profile Page'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit_note)),
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
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Nama',
                                  ),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Email',
                                  ),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'weight',
                                  ),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'height',
                                  ),
                                ),
                                TextFormField(
                                  controller:
                                      dateinput, //editing controller of this TextField
                                  decoration: const InputDecoration(
                                      labelText:
                                          "Date of Birrhday" //label text of field
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
                                  decoration: const InputDecoration(
                                    labelText: 'Place of Birthday',
                                  ),
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
                              })
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
