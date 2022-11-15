import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vanilla/screens/account/imagePicker.dart';
import 'package:vanilla/widgets/textWidget.dart';
import 'package:vanilla/widgets/buttonWidget.dart';
import 'package:vanilla/widgets/textFormWidget.dart';

class SetProfilePage extends StatefulWidget {
  const SetProfilePage({Key? key}) : super(key: key);

  @override
  _SetProfilePageState createState() => _SetProfilePageState();
}

class _SetProfilePageState extends State<SetProfilePage> {
  final _storage = const FlutterSecureStorage();
  late FirebaseAuth firebase;

  TextEditingController locationController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  getUserUID() async {
    firebase.currentUser?.uid;
    await _storage.write(key: 'uid', value: firebase.currentUser?.uid);
    print(firebase.currentUser?.uid);
  }

  List<bool> isGender = [false, false];

  List<bool> isInterested = [false, false, false];

  String currentLocation = 'Current Location';
  Position? currentPosition;

  Future<Text> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please turn on your location.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location blocked.');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: 'Location blocked permanently');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];

      setState(() {
        currentPosition = position;
        currentLocation =
            "${place.street}, \n ${place.locality}, ${place.country},";
      });
    } catch (e) {
      print(e);
    }
    return const Text("Nothing to build");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserUID();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black87,
        ),
        elevation: 0,
        centerTitle: true,
        title: TextWidget(
          text: 'Set Profile',
          fontSize: 20,
          color: const Color(0xFFB81F8F),
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.white10,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.help_outline,
              color: Colors.black38,
            ),
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        //padding: const EdgeInsets.only(left: 5, right: 5,),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextWidget(
                  text: 'Let\'s get you ready!',
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextInput(
                          textString: 'Nickname',
                          textController: nameController,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextInput(
                          textString: 'Age',
                          textController: ageController,
                          obscureText: false,
                          keyboardType: TextInputType.datetime,
                        ),
                        TextWidget(
                          text: "Your birthday won'\t be shown publicly",
                          fontSize: 10,
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextWidget(
                          text: "Gender",
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Container(
                          color: Colors.grey[200],
                          child: ToggleButtons(
                            onPressed: (int newIndex) {
                              setState(() {
                                for (int index = 0;
                                    index < isGender.length;
                                    index++) {
                                  if (index == newIndex) {
                                    isGender[index] = true;
                                  } else {
                                    isGender[index] = false;
                                  }
                                }
                              });
                            },
                            isSelected: isGender,
                            selectedColor: Colors.white,
                            //color: Colors.grey,

                            fillColor: Color(0xFFB81F8F),
                            renderBorder: false,
                            splashColor: Colors.white.withOpacity(0.01),
                            borderRadius: BorderRadius.circular(15),
                            borderColor: Colors.white,
                            borderWidth: 10,
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  ' Male ',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontFamily: 'Proxima Nova',
                                  ),
                                ),
                              ),
                              //SizedBox(width: 20,),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Female',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontFamily: 'Proxima Nova',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextWidget(
                          text: "Interested in",
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Container(
                          color: Colors.grey[200],
                          child: ToggleButtons(
                            onPressed: (int newIndex) {
                              setState(() {
                                for (int index = 0;
                                    index < isInterested.length;
                                    index++) {
                                  if (index == newIndex) {
                                    isInterested[index] = true;
                                  } else {
                                    isInterested[index] = false;
                                  }
                                }
                              });
                            },
                            isSelected: isInterested,
                            selectedColor: Colors.white,
                            //color: Colors.grey,
                            fillColor: Color(0xFFB81F8F),
                            renderBorder: false,
                            splashColor: Colors.white.withOpacity(0.01),
                            borderRadius: BorderRadius.circular(10),
                            borderColor: Colors.white,
                            borderWidth: 5,
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  ' Male ',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontFamily: 'Proxima Nova',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Female',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontFamily: 'Proxima Nova',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  ' Both ',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontFamily: 'Proxima Nova',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextWidget(
                          text: "Location",
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white10,
                            //borderRadius: BorderRadius.circular(12),
                            border: Border(
                              //top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                              bottom: BorderSide(width: 1, color: Colors.grey),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  currentLocation,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    height: 1.5,
                                    fontFamily: 'Proxima Nova',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    _determinePosition();
                                  },
                                  child: const Text(
                                    'LOCATE',
                                    style: TextStyle(
                                      fontSize: 14,
                                      height: 1.5,
                                      color: Colors.blue,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          ButtonWidget(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProfileImagesScreen())),
            text: 'Continue',
          ),
          const SizedBox(
            height: 50,
          ),
        ]),
      ),
    );
  }
}
